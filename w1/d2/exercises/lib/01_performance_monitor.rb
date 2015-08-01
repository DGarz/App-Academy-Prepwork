def measure(n = 1, &block)
  start = Time.now
  n.times do
    block.call
  end
  finish = Time.now
  (finish - start)/n
end