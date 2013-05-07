#Short circuit evaluation
#

# Julia does have short-circuit evaluation, which works just as you expect it to:
a(x) = (println("\t# Called a($x)"); return x)
b(x) = (println("\t# Called b($x)"); return x)
 
for i in [true,false], j in [true, false]
    println("\nCalculating: x = a($i) && b($j)"); x = a(i) && b(j)
    println("\tResult: x = $x")
    println("\nCalculating: y = a($i) || b($j)"); y = a(i) || b(j)
    println("\tResult: y = $y")
end

# Output:
# Calculating: x = a(true) && b(true)
# 	# Called a(true)
# 	# Called b(true)
# 	Result: x = true

# Calculating: y = a(true) || b(true)
# 	# Called a(true)
# 	Result: y = true

# Calculating: x = a(true) && b(false)
# 	# Called a(true)
# 	# Called b(false)
# 	Result: x = false

# Calculating: y = a(true) || b(false)
# 	# Called a(true)
# 	Result: y = true

# Calculating: x = a(false) && b(true)
# 	# Called a(false)
# 	Result: x = false

# Calculating: y = a(false) || b(true)
# 	# Called a(false)
# 	# Called b(true)
# 	Result: y = true

# Calculating: x = a(false) && b(false)
# 	# Called a(false)
# 	Result: x = false

# Calculating: y = a(false) || b(false)
# 	# Called a(false)
# 	# Called b(false)
# 	Result: y = false