#Hailstone sequence
#http://rosettacode.org/wiki/Hailstone_sequence

function hailstone(n)
	seq = [n]
	while n>1 
		n = n % 2 == 0 ? n/2 : 3n + 1 
		push!(seq,n)
	end
	return seq
end

# Output
# julia> h = hailstone(27);

# julia> @assert length(h) == 112

# julia> @assert h[1:4] == [27,82,41,124]

# julia> @assert h[end-3:end] == [8,4,2,1]

# julia> max([(length(hailstone(i)),i) for i in 1:100000])
# (351,77031)