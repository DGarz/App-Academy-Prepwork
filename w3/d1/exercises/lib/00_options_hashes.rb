require 'byebug'
# Options Hashes
#
# Write a method `transmogrify` that takes a `String`. This method should
# take optional parameters `:times`, `:upcase`, and `:reverse`. Hard-code
# reasonable defaults in a `defaults` hash defined in the `transmogrify`
# method. Use `Hash#merge` to combine the defaults with any optional
# parameters passed by the user. Do not modify the incoming options
# hash. For example:
#
# ```ruby
# transmogrify("Hello")                                    #=> "Hello"
# transmogrify("Hello", :times => 3)                       #=> "HelloHelloHello"
# transmogrify("Hello", :upcase => true)                   #=> "HELLO"
# transmogrify("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
#
# options = {}
# transmogrify("hello", options)
# # options shouldn't change.
# ```

def transmogrify(string, options = {})
  defaults = {
    :times => 1,
    :upcase => false,
    :reverse => false
  }
  
  options = defaults.merge(options)
  trans_string = ""
  
  options[:times].times do
    if (options[:upcase] == true && options[:reverse] == true)
      trans_string << (string.reverse.upcase)
    elsif options[:upcase]
      trans_string << string.upcase
    elsif options[:reverse]
      trans_string << string.reverse
    end
  end
  
  trans_string
end

##can be a lot simpler. see solution
