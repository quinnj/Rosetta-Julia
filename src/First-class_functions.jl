# Functions as values of a variable
# http://rosettacode.com/wiki/First-class_functions

cube(x) = x^3
cuberoot(x) = x^(1/3)

# Higher order function
function compose(tuple)
    (f, g) = tuple
    return (x) -> f(g(x));
end
 
# Storing functions in a array
fun = [sin, cos, cube]
inv = [asin, acos, cuberoot]
 
# Print out the imperative solution
result = []
for i = 1:3
    result = [result, compose(inv[i], fun[i])(0.5)]
end
@assert sum(result - [0.5, 0.5, 0.5]) < 0.01

# A more functional approach
fns = [sin, cos, x -> x^3]
inv = [asin, acos, x -> x ^(1/3)]
identities = map(compose, collect(zip(fns, inv)))
result = map(x -> x(0.5), identities)
@assert sum(result - [0.5, 0.5, 0.5]) < 0.01
