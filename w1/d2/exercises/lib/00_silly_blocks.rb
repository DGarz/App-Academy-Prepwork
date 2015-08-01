def reverser(&prc)
  prc.call.split(" ").map(&:reverse).join(" ")
end

def adder (num = 1, &prc)
  num + prc.call
end

def repeater (num = 1, &prc)
  num.times do
    prc.call
  end
end

  