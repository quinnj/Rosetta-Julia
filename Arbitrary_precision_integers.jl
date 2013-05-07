#Arbitrary precision integers
#http://rosettacode.org/wiki/Arbitrary-precision_integers_(included)

# To allow computations with arbitrary precision integers and floating point numbers, Julia wraps the GNU Multiple Precision Arithmetic Library, GMP. The BigInt and BigFloat types are available in Julia for arbitrary precision integer and floating point numbers respectively.

# Constructors exist to create these types from primitive numerical types, or from String. Once created, they participate in arithmetic with all other numeric types thanks to Julia’s type promotion and conversion mechanism.

julia> BigInt(typemax(Int64)) + 1
9223372036854775808

julia> BigInt("123456789012345678901234567890") + 1
123456789012345678901234567891

julia> BigFloat("1.23456789012345678901")
1.23456789012345678901

julia> BigFloat(2.0^66) / 3
24595658764946068821.3

julia> factorial(BigInt(40))
815915283247897734345611269596115894272000000000

# However, type promotion between the primitive types above and BigInt/BigFloat is not automatic and must be explicitly stated.

julia> x = typemin(Int64)
-9223372036854775808

julia> x = x - 1
9223372036854775807

julia> typeof(x)
Int64

julia> y = BigInt(typemin(Int64))
-9223372036854775808

julia> y = y - 1
-9223372036854775809

julia> typeof(y)
BigInt

# Task
julia> @elapsed big = string(BigInt(5)^4^3^2)
0.017507363
 
julia> length(big) 
183231
 
julia> big[1:20]
"62060698786608744707"
 
julia> big[end-20:end]
"892256259918212890625"