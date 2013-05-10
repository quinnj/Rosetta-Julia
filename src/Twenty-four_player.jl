#Twenty-four player
#http://rosettacode.org/wiki/24_game/Solve

function solve24(nums)
    length(nums) != 4 && error("Input must be a 4-element Array")
    syms = [+,-,*,/]
    for x in syms, y in syms, z in syms
        for i = 1:24
            a,b,c,d = nthperm(nums,i)
            if round(x(y(a,b),z(c,d)),5) == 24
                return "($a$y$b)$x($c$z$d)"
            elseif round(x(a,y(b,z(c,d))),5) == 24 
                return "$a$x($b$y($c$z$d))"
            elseif round(x(y(z(c,d),b),a),5) == 24 
                return "(($c$z$d)$y$b)$x$a"
            elseif round(x(y(b,z(c,d)),a),5) == 24 
                return "($b$y($c$z$d))$x$a"
            end
        end
    end
    return "0"
end

# Output
# julia> solve24([6, 8, 2, 8])
# "(6+8)+(2+8)"

# julia> solve24([4, 2, 8, 1])
# "8*(4+(1-2))"

# julia> solve24([3, 1, 9, 9])#
# "(9-1)*(9/3)"

# julia> solve24([5, 7, 5, 1])#
# "0"

# julia> solve24([5, 8, 4, 1])
# "8+(4*(5-1))"

# julia> solve24([8, 3, 4, 9])
# "(8+3)+(4+9)"

# julia> solve24([3, 7, 4, 4])#
# "4*(3+(7-4))"

# julia> solve24([5, 6, 4, 1])
# "4/(1-(5/6))"

# julia> solve24([5, 5, 9, 8])
# "(8-9)+(5*5)"