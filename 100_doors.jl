#100 doors
#http://rosettacode.org/wiki/100_doors

#-falses(100) creates a 100-element Bool array filled with false values
#-'b in a:a:100' translates to 'start:step:end'
#-string concatenation by '*'<br>
doors = falses(100)
for a = 1:100, b in a:a:100
	doors[b] = !doors[b]
end
for a = 1:100 println("Door $a is " * (doors[a] ? "open" : "close") ) end
#gimmicky-optimized
for i = 1:10 println("Door $(i^2) is open") end

# Output
# Door 1 is open
# Door 4 is open
# Door 9 is open
# Door 16 is open
# Door 25 is open
# Door 36 is open
# Door 49 is open
# Door 64 is open
# Door 81 is open
# Door 100 is open