def add(x ,y)
    x + y 
end

def subtract(x, y)
    x - y
end

def sum(arr)
    arr.inject(0) {|sum, num| sum + num}
end

def multiply(arr)
    arr.inject(1) {|mult, num| mult * num}
end

def power(num, pow)
    num**pow
end

def factorial(num)
    if num == 0
        return 1
    elsif
     fact = (1..num).inject(1) {|mult, element| mult * element}
    end
    fact
end
