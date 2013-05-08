# Higher-order Functions
# http://rosettacode.org/wiki/Higher-order_functions

function foo(x)
  str = x("world")
  println("hello $(str)!")
end

foo(y -> "blue $y") # prints "hello blue world"

function g(x,y,z)
  x(y,z)
end

println(g(+,2,3)) # prints 5
