# Infinity
# http://rosettacode.com/wiki/Infinity

# Julia uses IEEE floats.
 
function infinity()
  return Inf
end
# There is actually a built-in function that does this. It is called inf.
inf(Float64) # Inf
inf(Float32) # Inf
# Negative infinity is -Inf.

# There are nextfloat and prevfloat functions for finding the next possible value,
# given the limited precision of floating point numbers.
prevfloat(Inf) # 1.7976931348623157e308
nextfloat(Inf) # NaN
nextfloat(prevfloat(Inf)) # Inf
prevfloat(nextfloat(Inf)) # Inf
