#Self-describing numbers
#http://rosettacode.org/wiki/Self-describing_numbers

function selfie(x)
	y = reverse(digits(x))
	len = length(y)
	sum(y) != len && return false
	for i = 1:len
		y[i] != sum(y .== i-1) && return false
	end
	return true
end
selfie(2020)
selfie(2021)
selfies(x) = for i = 1:x selfie(i) && println(i) end
@time selfies(4000000)