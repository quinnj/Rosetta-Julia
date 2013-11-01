# Functions as values of a variable
# http://rosettacode.com/wiki/First-class_functions

cube(x) = x^3
cuberoot(x) = x^(1/3)

# Higher order function
function compose(f, g) 
  	return (x) -> f(g(x));
end
 
# Storing functions in a array
fun = [sin, cos, cube]
inv = [asin, acos, cuberoot]
 
for i = 1:3
    println(compose(inv[i], fun[i])(0.5))
end

# 0.5
# 0.4999999999999999
# 0.5
