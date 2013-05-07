#Catalan Numbers
#http://rosettacode.org/wiki/Catalan_numbers

# From the Catalan package
# Returns the n-th Catalan number
function catalan(bn::Integer)
    if bn < 0
        throw(DomainError())
    else
        n = BigInt(bn)
    end
    return binomial(2n, n)/(n + 1)
end

# Output
for n = 1:15 println(catalan(n)) end

# julia>  for n = 1:15 println(catalan(n)) end
# 1
# 2
# 5
# 14
# 42
# 132
# 429
# 1430
# 4862
# 16796
# 58786
# 208012
# 742900
# 2674440
# 9694845