require 'byebug'

class XmlDocument
  
  attr_accessor :indent_size
  
  def initialize(indent = false)
    @indent = indent
    @indent_size = 0
  end
  
  def method_missing(method_name, *args, &block)
    unless block_given? || args.length >= 1
       return "<#{method_name}/>"
    else
      render_tag(method_name, *args, &block)
    end
  end
  
  def render_tag(method_name, *args, &block)
    
    
    tag = "<#{method_name}"
    #debugger
    if block_given?
      tag += ">"
      if @indent == true
        indent
        tag << "\n" 
        tag << (" " * @indent_size) + block.call
        indent_away
        tag += "\n" 
        tag << (" " * @indent_size) + "</#{method_name}>"
      else
        tag << block.call
        tag += "</#{method_name}>"
      end
    end
    
    unless args.length == 0
      args.each do |arg|
        if arg.is_a?(Hash)
          arg.each do |k, v|
            tag << " #{k}=" + "#{v}".inspect
          end
        end
      end
      tag += "/>"
    end
    tag
  end
  
  private
  
  def indent
    @indent_size += 2
  end
  
  def indent_away
    @indent_size -= 2
  end
end

  
