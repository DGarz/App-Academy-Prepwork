def measure(n = 1, &block)
  start = Time.now
  n.times { block.call }
  finish = Time.now
  (finish - start)/n
end