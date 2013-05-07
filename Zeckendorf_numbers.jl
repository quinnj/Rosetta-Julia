#Zeckendorf numbers
#

function zeck(n)
    n <= 0 && return 0
    fib = [2,1]; while fib[1] < n unshift!(fib,sum(fib[1:2])) end
    dig = Int[]; for f in fib f <= n ? (push!(dig,1); n = n-f;) : push!(dig,0) end
    return dig[1] == 0 ? dig[2:end] : dig
end

# Output
# julia> for x = 0:20
#            println(join(zeck(x)))
#        end
# 0
# 1
# 10
# 100
# 101
# 1000
# 1001
# 1010
# 10000
# 10001
# 10010
# 10100
# 10101
# 100000
# 100001
# 100010
# 100100
# 100101
# 101000
# 101001
# 101010