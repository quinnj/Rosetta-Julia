#A+B
#http://rosettacode.org/wiki/A%2BB

function AB()
	input = sum(map(int,split(readline(STDIN)," ")))
	println(input)
end
AB()

# Output - from command line
# >julia AB.jl
# 1 1
# 2