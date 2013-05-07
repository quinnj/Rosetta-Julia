#Factorial
#http://rosettacode.org/wiki/Factorial

# This is just a copy from the combinatorics.jl module of the Julia standard library
function factorial(n::Integer)
    if n < 0
        return zero(n)
    end
    f = one(n)
    for i = 2:n
        f *= i
    end
    return f
end

# Output
# julia> for i = 10:20
# 	println(factorial(BigInt(i)))
# end
# 3628800
# 39916800
# 479001600
# 6227020800
# 87178291200
# 1307674368000
# 20922789888000
# 355687428096000
# 6402373705728000
# 121645100408832000
# 2432902008176640000