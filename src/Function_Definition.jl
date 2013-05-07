#Function Definition
#http://rosettacode.org/wiki/Function_definition

# General function definition
function multiply(a::Number,b::Number)
  return a*b
end
# Julia also supports `assignment` definition as shorthand
multiply(a,b) = a*b