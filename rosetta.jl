#100 Doors

#Boolean
doors = falses(100) #100-element Bool array with false values
for a = 1:100, b in a:a:100 #b in start:step:end
	doors[b] = !doors[b]
end
for a = 1:100 println("Door $a is " * (doors[a] ? "open" : "close") ) end

#Ultra-optimized
for i = 1:10 println("Door $(i^2) is open") end

#99 Bottles of Beer

#One-liner
for i = 99:-1:1 print("\n$i bottles of beer on the wall\n$i bottles of beer\nTake one down, pass it around\n$(i-1) bottles of beer on the wall\n") end

#Happy Numbers
function happy(x)
	happy_ints = ref(Int)
	int_try = 1
	while length(happy_ints) < x
		n = int_try
		past = ref(Int)
		while n != 1
	        n = sum([int(string(y))^2 for y in string(n)])
	        contains(past,n) ? break : push!(past,n)
	    end
	    if n == 1 push!(happy_ints,int_try) end
	    int_try += 1
	end
	return happy_ints
end

#Hamming Numbers
function ishamm(x)


end

#Ackermann function
function ack(m,n)
	if m == 0
		return n + 1
	elseif n == 0
		return ack(m-1,1)
	else
		return ack(m-1,ack(m,n-1))
	end
end

ack2(m,n) = m == 0 ? n + 1 : n == 0 ? ack2(m-1,1) : ack2(m-1,ack2(m,n-1))

#Accumulator factory
function accumulator(i)
	function f(n)
		i += n
		return i
	end
	return f
end

x = accumulator(1)
x(5)
print(accumulator(3))
print(x(2.3))

#A+B
macro add(a,b)
	return a + b
end

#Cows and Bulls
function cowsbulls()
	print("Welcome to Cows & Bulls! I've picked a 4 digit number, go ahead and type your guess.\n
		You get one bull for every right number in the right position.\n
		You get one cow for every right number in the wrong position.\n
		Enter 'n' to pick a new number and 'q' to quit.\n>")
	new_number() = string(rand(1:9))*string(rand(1:9))*string(rand(1:9))*string(rand(1:9))
	answer = new_number()
	while true
		input = chomp(readline(STDIN))
		input == "q" && break
		input == "n" && begin answer = new_number(); print("\nLet's try again, go ahead and guess\n>"); continue end
		!ismatch(r"^[1-9]{4}$",string(input)) && begin print("Invalid guess: Please enter a 4-digit number\n"); continue end
		if input == answer 
			print("\nYou're right! Good guessing!\nEnter 'n' for a new number or 'q' to quit\n>")
			continue
		else
			bulls = sum(answer.data .== input.data)
			cows = sum([answer[x] != input[x] && contains(input.data,answer[x]) for x = 1:4])
			print("\nNot quite! Your guess is worth:\n$bulls Bulls\n$cows Cows\nPlease guess again\n\n>")
		end
	end
end

#Call shared library function
#ccall((symbol, library), RetType, (ArgType1, ...), ArgVar1, ...)
	ccall( (:GetDoubleClickTime, "User32"), stdcall,
		Uint, (), )

#Catalan Numbers
function catalan(n)
	binomial(2n,n)/(n+1)
end

 for n = 1:15 println(catalan(n)) end

#Character matching
begins_with("abcd","ab") #returns true
search("abcd","ab") #returns 1:2, indices range where string was found
ends_with("abcd","zn") #returns false
ismatch(r"ab","abcd") #returns true where 1st arg is regex string
julia>for r in each_match(r"ab","abab")
	println(r.offset)
end
1
3

#Combinations
for i in @task combinations(1:5,3)
println(i)
end

#Rock, paper, scissors
function rps()
	print("Welcome to Rock, paper, scissors! Go ahead and type your pick.\n
		r(ock), p(aper), or s(cissors)\n
		Enter 'q' to quit.\n>")
	comp_score = 0
	user_score = 0
	options = ["r","p","s"]
	new_pick() = options[rand(1:3)]
	i_win(m,y) = ((m == "r" && y == "s")|(m == "s" && y == "p")|(m == "p" && y == "r"))
	while true
		input = string(readline(STDIN)[1])
		input == "q" && break
		!ismatch(r"^[rps]",input) && begin print("Invalid guess: Please enter 'r', 'p', or 's'\n"); continue end
		answer = new_pick()
		if input == answer 
			print("\nTie!\nScore still: \nyou $user_score\nme  $comp_score\n>")
			continue
		else
			i_win(answer,input) ? (comp_score += 1) : (user_score += 1)
			print(i_win(answer,input) ? "\nSorry you lose!\n" : "\nYou win!","Score: \nyou $user_score\nme  $comp_score\n>")
		end
	end
end

#24 Game
 function twentyfour()
 	new_digits() = [string(rand(1:9)),string(rand(1:9)),string(rand(1:9)),string(rand(1:9))]
	answer = new_digits()
	print("The 24 Game\nYou will be given any four digits in the range 1 to 9, which may have repetitions.\n
		 Using just the +, -, *, and / operators show how to make an answer of 24.\n
		 Use parentheses, (), to ensure proper order of evaulation.\n
		 Enter 'n' for a new set of digits, and 'q' to quit. Good luck!\n
		 Here's your first 4 digits\n$(answer[1]) $(answer[2]) $(answer[3]) $(answer[4])\n
		 >")
	while true
		input = chomp(readline(STDIN))
		input == "q" && break
		input == "n" && begin answer = new_digits(); print("\nLet's try again, go ahead and guess\n>"); continue end
		#need to check if digits were used
		input = try eval(parse(input)) catch begin print("I couldn't calculate your answer, please try again\n>"); continue end end
		if input == 24
			answer = new_digits()
			print("\nYou did it!\nLet's do another round, or enter 'q' to quit\n>")
			continue
		else
			print("\nSorry that's not quite right!\nTry another strategy\n>")
		end
	end
end

#Return multiple values
function addsub(x, y)
  return x + y, x - y
end

#Anagrams
function counts{T}(x::Array{T,1})
	len = length(x)
	final = Array(Int,len)
	rows = counter = 1
	while true
		while true
			rows+counter > len && break
			x[rows+counter-1] != x[rows+counter] ? break : (counter += 1)
		end
		counter > 1 && (final[rows:rows+counter-1] = counter)
		counter == 1 && (final[rows+counter-1] = 1)
		rows+counter > len && break
		rows += counter
		counter = 1
	end
	return final
end
raw = [readdlm("unixdict.txt",String) String[bytestring(sort(a.data)) for a in readdlm("unixdict.txt",String)]]
raw = raw[sortperm(raw[:,2]),:]
ww = [raw counts(raw[:,2])]
final = ww[sortperm(ww[:,3],Sort.Reverse()),:][1:30,:]

#Arbitrary-precision Integers
@elapsed big = string(BigInt(5)^4^3^2)
length(big) 
big[1:20]
big[end-20:end]

#Anonymous recursion
function anon(x)

end

#semordnilap
raw = readdlm("unixdict.txt",String)[:]
inter = intersect(raw,map(reverse,raw)) #find the matching strings/revstrings
res = String[b == 1 && a != reverse(a) && a < reverse(a) ? a : reverse(a) for a in inter, b in 1:2] #create pairs
res = res[res[:,1] .!= res[:,2],:] #get rid of duplicates, palindromes

length(res[:,1])
res[1:5,:]

#middle three digits
function middle(s)
	s = string(abs(s))
	len = length(s)
	assert(len >= 3 && len % 2 == 1, "Number of digits must be odd and >= 3")
	mid = ifloor(len/2)
	return s[mid:mid+2]
end
passing = [123, 12345, 1234567, 987654321, 10001, -10001, -123, -100, 100, -12345]
failing = [1, 2, -1, -10, 2002, -2002, 0]
for i in [passing,failing]
	try
	println("Number: $i ", "Answer: ",middle(i))
	catch e
	println("Number: $i ", "Answer: ",e)
	end
end

#zigzag matrix TODO
function zigzag(n)
	move(i,j) = j < (n-1) ? (max(1,i),j+1) : (i+1,j)
	x = y = 1
	a = zeros(Int,(n,n))
	for v = 1:n^2
		a[x,y] = v
		if isodd(x+y) 
			x,y=move(x,y)
		else
			y,x=move(y,x)
		end
	end
	return a
end

function zigzag(n)
  grid = Array(Int,(n,n))
  i = 0
  for d in 1:n^2
    (x, y) = (max(1, d - n + 1),min(n, d))
     it = min(d, n^2 - d)
     grid[d%2 != 0?y-it:x+it,d%2 != 0 ?x+it:y-it] = i+= 1
  end
  return grid
end

t = [0  1  5  6 14 15 27;  2  4  7 13 16 26 28;  3  8 12 17 25 29 38;  9 11 18 24 30 37 39; 10 19 23 31 36 40 45; 20 22 32 35 41 44 46, 21 33 34 42 43 47 48]

for i = 1:n^2
	x,y = (max(0,i-n),min(n-1,i-1))
	println(x," ",y)
end

#Zeckendorf number representation
function zeck(n)
	n <= 0 && return 0
    fib = [2,1]; while fib[1] < n unshift!(fib,sum(fib[1:2])) end
    dig = Int[]; for f in fib f <= n ? (push!(dig,1); n = n-f;) : push!(dig,0) end
	return dig[1] == 0 ? dig[2:end] : dig
end

#write float arrays to a text file
xprecision = 3
yprecision = 5
x = round([1, 2, 3, 1e11],xprecision)
y = round([1, 1.4142135623730951, 1.7320508075688772, 316227.76601683791],yprecision)
file = open("filename","w") do f
	for (a, b) in zip(x,y)
		writedlm(f,[a b],'\t')
	end
end

#variables
#declaration/assignment, declaration is optional
x::Int32 = 1
#datatypes are inferred dynamically, but can also be set thru convert functions and datatype literals
x = 1 #x is inferred as Int, which is Int32 for 32-bit machines, Int64 for 64-bit machines
#variable reference
julia>x
1

x = int8(1) #x is of type Int8
x = 1.0 #x is Float64
x = y = 1 #assign both x and y to 1
global x = 1 #assigns 1 to global variable x (used inside scope blocks)
local x = 1 #assigns 1 to local variable x (used inside scope blocks)
x = 'a' #x is a 'Char' type, designated by single quotes
x = "a" #x is a 1-element string, designated by double quotes

Certain constructs in the language introduce scope blocks, which are regions of code that are eligible to be the scope of some set of variables. The scope of a variable cannot be an arbitrary set of source lines, but will always line up with one of these blocks. The constructs introducing such blocks are:

function bodies (either syntax)
while loops
for loops
try blocks
catch blocks
let blocks
type blocks

A common use of variables is giving names to specific, unchanging values. Such variables are only assigned once. This intent can be conveyed to the compiler using the const keyword:

const e  = 2.71828182845904523536
const pi = 3.14159265358979323846

#variadic functions
f(args...) = args

#flatten a list
#julia auto-flattens nested arrays of this form
t = [[1], 2, [[3,4], 5], [[[]]], [[[6]]], 7, 8, []]

#Floyd's triangle
function floyd(n) 
	line = each = 1
	dig(i,line,end) = (while i+line < end i+=line; line+= 1 end; return i)
	for i = 1:n; print(lpad(i,ndigits(dig(i,line,n))+1," ")); each==line && (print("\n"); each=0; line+=1); each+= 1; end
end
#floyd(n) creates an n-row floyd's triangle counting from 1 to (n/2+.5)*n
function floyd(n) 
	x = 1
	dig(x,line,n) = (while line < n; x+=line; line+= 1 end; return ndigits(x)+1)
	for line = 1:n, i = 1:line; print(lpad(x,dig(x,line,n)," ")); x+=1; i==line && print("\n") end
end

#topswops
function topswops(n)
	first = [1:n]; swapsa = ref(Int)
	for perm = 2:(factorial(n)/factorial(n-n))
		swaps = 0
		a = nthperm(first,perm)
		if a == first
			break
		else
			while a[1] != 1
				a[1:a[1]] = reverse(a[1:a[1]]); swaps+= 1
			end
			push!(swapsa,swaps)
		end
	end
	return max(swapsa)
end

#Trabb Pardo Knuth algorithm
f(x) = abs(x)^.5 + 5x^3
for i in map(parse_int,reverse(split(chomp(readline(STDIN)),' ')))
	println("$i: ",f(i)>400?"TOO LARGE":f(i))
end

#temperatures
cfr(k) = print("Kelvin: $k, Celsius: $(round(k-273.15,2)), Fahrenheit: $(round(k*1.8-459.67,2)), Rankine: $(round(k*1.8,2))")

#sum of series
f(x) = sum(1/[1:x]^2)

#sum digits
f(x::Int) = sum([int(string(i)) for i in string(x)])

#Sieve_of_Eratosthenes
function primesupto(limit)

end

#short-circuit evaluation
a(x) = (println("  # Called function a($x) -> $x"); return x)
b(x) = (println("  # Called function a($x) -> $x"); return x)
for i in [true,false], j in [true, false]
	println("\nCalculating: x = a(i) && b(j)"); x = a(i) && b(j)
	println("\nCalculating: y = a(i) || b(j)"); y = a(i) && b(j)
end

#self-describing Numbers: i.e. 2020
function selfie(x)
	y = string(x)
	return all([string(i[2]) == string(mapreduce(x->string(x)==string(i[1]-1),+,y)) for i in enumerate(y)])
end
selfie(2020)
selfie(2021)

#hailstone sequence
function hailstone(n)
	seq = [n]
	while n>1 
		n = n % 2 == 0 ? n/2 : 3n + 1 
		push!(seq,n)
	end
	return seq
end
h = hailstone(27);
@assert length(h) == 112
@assert h[1:4] == [27,82,41,124]
@assert h[end-3:end] == [8,4,2,1]
max([(length(hailstone(i)),i) for i in 1:100000])

#Harshad series
isharshad(x) = x % sum([int(string(i)) for i in string(x)]) == 0
function harshads(n)
	h = ref(Int)
	i = 1
	while length(h) < n
		isharshad(i) && push!(h,i)
		i+=1
	end
	return h
end
i = 1001; while !isharshad(i) i += 1 end; i

#Haversine
haversine(lat1,lon1,lat2,lon2) = 2 * 6372.8 * asin(sqrt(sind((lat2-lat1)/2)^2 + cosd(lat1) * cosd(lat2) * sind((lon2 - lon1)/2)^2))
haversine(36.12,-86.67,33.94,-118.4)

#last letter-first letter

firsts = String[string(i[1]) for i in names]
ends = String[string(i[end]) for i in names]
#first choose a name that has a first letter with no corresponding last letter
#find the one to one letter matches
#find the one to many/many to one
#Name Groups
 #names with first letters with no corresponding last letters: first choice
 #ends with no beginnings: only need one for the end
 #ends with one beginning: forced pairs, these have to go together
 #choose forced pairs before one to many pairs

for each word, we want to find the longest possible chain
	for each word
		find list of possible matches
			for each match, repeat until there are no more matches
type Node
	id::ASCIIString
	n::Int
	max::Int
	parent::Union(Node,Int)
	children::Array{Node}
	Node(id::ASCIIString) = new(id,1,1,0)
end

names = map(Node,["audino", "bagon", "baltoy", "banette", "bidoof", "braviary", "bronzor", "carracosta", "charmeleon",
"cresselia", "croagunk", "darmanitan", "deino", "emboar", "emolga", "exeggcute", "gabite",
"girafarig", "gulpin", "haxorus", "heatmor", "heatran", "ivysaur", "jellicent", "jumpluff", "kangaskhan",
"kricketune", "landorus", "ledyba", "loudred", "lumineon", "lunatone", "machamp", "magnezone", "mamoswine",
"nosepass", "petilil", "pidgeotto", "pikachu", "pinsir", "poliwrath", "poochyena", "porygon2",
"porygonz", "registeel", "relicanth", "remoraid", "rufflet", "sableye", "scolipede", "scrafty", "seaking",
"sealeo", "silcoon", "simisear", "snivy", "snorlax", "spoink", "starly", "tirtouga", "trapinch", "treecko",
"tyrogue", "vigoroth", "vulpix", "wailord", "wartortle", "whismur", "wingull", "yamask"])

function ancestors(n::Node)
	anc = ref(Node)
	while n.parent != 0
		push!(anc,n)
		n = n.parent
	end
	return anc
end

function add_children!(name::Node)
	anc = ancestors(name)
	children = names[Bool[i.id[1] == name.id[end] && !contains(anc,i) for i in names]]
	name.children = children
	length(anc) != 0 && (anc[end].max = name.n+1)
	for i in name.children
		i.n = name.n+1
		i.parent = name
		add_children!(i)
	end
end

function mapnodes(names::Array{Node})
	for i in names
		add_children!(i)
	end
	t = [i.max for i in names]
end

#Greatest element in list
max([1,3,3,7])
max([pi,e+2/5,cos(6)/5,sqrt(91/10)])
max([1,6,Inf])
max(Float64[])

#Arithmetic Evaluation
expr="2 * (3 -1) + 2 * 5"
parsed = parse(expr) #Julia provides low-level access to language parser for AST/Expr creation
t = typeof(parsed)
names(t) #shows type fields
parsed.args #Inspect our 'Expr' type innards
typeof(parsed.args[2]) #'Expr' types can nest
parsed.args[2].args
parsed.args[2].args[3].args #Will nest until lowest level of AST
eval(parsed)
eval(parse("1 - 5 * 2 / 20 + 1"))
eval(parse("2 * (3 + ((5) / (7 - 11)))"))

#perfect numbers
function isperfect(n)
	
end
function perfectsupto(n)
	b = iround((log(.5*(sqrt(8*n+1)-1)))/log(2))
	map(filter(x->isprime(x),Int64[2^i-1 for i = 2:b])) do x
		sum = 0
		for i = 1:x
			sum += i
		end
		return sum
	end
end
#TODO, add index to only do 3, 7, 13, 17, 19, 31, 61, etc...
#add isperfect function, 
function perfects(n)
	map(x->(x*(BigFloat(x)+1))*0.5,filter(x->isprime(x),BigInt[BigInt(2)^i-1 for i = Base.PRIMES[1:n]]))
end
function perfects(n)
	map(x->(x*(BigFloat(x)+1))*0.5,[BigInt(2)^i-1 for i = Base.PRIMES[2:n]])
end
@time perfects(3)
@time perfects(7)
@time perfects(9)
@time perfects(13)
@time perfects(61)
