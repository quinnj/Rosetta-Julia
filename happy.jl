#http://rosettacode.org/wiki/Happy_numbers

#Translation of C
const CACHE = 256
buf = zeros(Int,CACHE)
buf[1] = 1
#happy(n) returns 1 if happy, 0 if not
function happy(n)
	if n < CACHE
		buf[n] > 0 && return 2-buf[n]
		buf[n] = 2
	end
	sum = 0
	nn = n
	while nn != 0
		x = nn%10
		sum += x*x
		nn = div(nn,10)
	end
	x = happy(sum)
	n < CACHE && (buf[n] = 2-x)
	return x
end
function main()
	i = 1; counter = 1000000
	while counter > 0
		if happy(i) == 1
			counter -= 1
		end
		i += 1
	end
	return i-1
end

@time main()

#happy(x) produces the first `x` happy numbers in sequence
function happy(x)
	happy_ints = ref(Int)
	int_try = 1
	while length(happy_ints) < x
		n = int_try
		past = ref(Int)
		while n != 1
	        n = sum([y^2 for y in digits(n)])
	        contains(past,n) ? break : push!(past,n)
	    end
	    n == 1 && push!(happy_ints,int_try)
	    int_try += 1
	end
	return happy_ints
end


#to run
happy(8) # -> [1,7,10,13,19,23,28,31]