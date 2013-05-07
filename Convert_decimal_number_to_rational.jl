#Convert decimal number to rational
#http://rosettacode.org/wiki/Convert_decimal_number_to_rational#Julia

# Julia has a native Rational type, and provides [http://docs.julialang.org/en/latest/manual/conversion-and-promotion/#case-study-rational-conversions a convenience conversion function] that implements a standard algorithm for approximating a floating-point number by a ratio of integers to within a given tolerance, which defaults to machine epsilon.

rational(0.9054054)
rational(0.518518)
rational(0.75)

# Output
# 4527027//5000000
# 259259//500000
# 3//4

# Since Julia by default uses its [[wp:Double-precision floating-point format#IEEE 754 double-precision binary floating-point format: binary64|Float64]] type to represent floating-point numbers, if enough decimal digits are provided (so that the difference between the floating-point representation of the resulting fraction and the original number is smaller than the machine epsilon) the smaller fraction is returned, which in this case is the exact result:

 # julia> rational(0.5185185185185185)
 # 14//27
 # julia> rational(0.9054054054054054)
 # 67//74