#Return multiple values
#http://rosettacode.org/wiki/Return_multiple_values

function addsub(x, y)
  return x + y, x - y
end
julia> addsub(10,4)
(14,6)