=={{header|Julia}}==
Interestingly, Julia's Base includes this exact representation as the Rational type. The below code is taken straight from Base:
<lang julia>#Type definition
type Rational{T<:Integer} <: Real
    num::T
    den::T

    function Rational(num::T, den::T)
        if num == 0 && den == 0
            error("invalid rational: 0//0")
        end
        g = gcd(den, num)
        new(div(num, g), div(den, g))
    end
end
#Type constructors
Rational{T<:Integer}(n::T, d::T) = Rational{T}(n,d)
Rational(n::Integer, d::Integer) = Rational(promote(n,d)...)
Rational(n::Integer) = Rational(n,one(n))
//(n::Integer,  d::Integer ) = Rational(n,d)
//(x::Rational, y::Integer ) = x.num//(x.den*y)
//(x::Integer,  y::Rational) = (x*y.den)//y.num
//(x::Rational, y::Rational) = (x.num*y.den)//(x.den*y.num)

#Operators
-(x::Rational) = (-x.num) // x.den
+(x::Rational, y::Rational) = (x.num*y.den + x.den*y.num) // (x.den*y.den)
-(x::Rational, y::Rational) = (x.num*y.den - x.den*y.num) // (x.den*y.den)
*(x::Rational, y::Rational) = (x.num*y.num) // (x.den*y.den)
/(x::Rational, y::Rational) = (x.num*y.den) // (x.den*y.num)
/(x::Rational, z::ComplexPair) = inv(z/x)

==(x::Rational, y::Rational) = x.den == y.den && x.num == y.num
==(x::Rational, y::Integer ) = x.den == 1 && x.num == y
==(x::Integer , y::Rational) = y == x

# needed to avoid ambiguity between ==(x::Real, z::Complex) and ==(x::Rational, y::Number)
==(z::Complex , x::Rational) = real_valued(z) && real(z) == x
==(x::Rational, z::Complex ) = real_valued(z) && real(z) == x

==(x::Rational, y::Number  ) = x.num == x.den*y
==(x::Number  , y::Rational) = y == x
==(x::Rational, y::FloatingPoint) = x.den==0 ? oftype(y,x)==y : x.num == x.den*y

< (x::Rational, y::Rational) = x.den == y.den ? x.num < y.num : x.num*y.den < x.den*y.num
< (x::Rational, y::Real    ) = x.num < x.den*y
< (x::Real    , y::Rational) = x*y.den < y.num

<=(x::Rational, y::Rational) = x.den == y.den ? x.num <= y.num : x.num*y.den <= x.den*y.num
<=(x::Rational, y::Real    ) = x.num <= x.den*y
<=(x::Real    , y::Rational) = x*y.den <= y.num

div(x::Rational, y::Rational) = div(x.num*y.den, x.den*y.num)
div(x::Rational, y::Real    ) = div(x.num, x.den*y)
div(x::Real    , y::Rational) = div(x*y.den, y.num)

function ^(x::Rational, y::Integer)
    if y < 0
        Rational(x.den^-y, x.num^-y)
    else
        Rational(x.num^y, x.den^y)
    end
end

^(x::Number, y::Rational) = x^(y.num/y.den)

#Conversions
convert{T<:Integer}(::Type{Rational{T}}, x::Rational) = Rational(convert(T,x.num),convert(T,x.den))
convert{T<:Integer}(::Type{Rational{T}}, x::Integer) = Rational(convert(T,x), convert(T,1))
function convert{T<:Integer}(::Type{Rational{T}}, x::FloatingPoint, tol::Real)
    if isnan(x);       return zero(T)//zero(T); end
    if x < typemin(T); return -one(T)//zero(T); end
    if typemax(T) < x; return  one(T)//zero(T); end
    tm = x < 0 ? typemin(T) : typemax(T)
    z = x*tm
    if z <= 0.5 return zero(T)//one(T) end
    if z <= 1.0 return one(T)//tm end
    y = x
    a = d = 1
    b = c = 0
    while true
        f = itrunc(y); y -= f
        p, q = f*a+c, f*b+d
        if p < typemin(T) || p > typemax(T) ||
           q < typemin(T) || q > typemax(T)
           break
        end
        a, b, c, d = p, q, a, b
        if y == 0 || abs(a/b-x) <= tol
            break
        end
        y = 1/y
    end
    return convert(T,a)//convert(T,b)
end
convert{T<:Integer}(rt::Type{Rational{T}}, x::FloatingPoint) = convert(rt,x,eps(one(x)))
convert(::Type{Rational}, x::FloatingPoint, tol::Real) = convert(Rational{Int},x,tol)
convert(::Type{Rational}, x::FloatingPoint) = convert(Rational{Int},x,eps(one(x)))
convert(::Type{Bool}, x::Rational) = (x!=0)  # to resolve ambiguity
convert{T<:Rational}(::Type{T}, x::Rational) = x
convert{T<:Real}(::Type{T}, x::Rational) = convert(T, x.num/x.den)</lang>
Let's see it in action:
<pre></pre>