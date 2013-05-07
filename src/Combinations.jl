#Combinations
#http://rosettacode.org/wiki/Combinations

# combinations(array, n) Generate all combinations of n elements from a given array. Because the number of combinations can be very large, this function runs inside a Task to produce values on demand. Write c = @task combinations(a,n), then iterate c or call consume on it.

for i in @task combinations(1:5,3)
println(i)
end

# Output 
# [1, 2, 3]
# [1, 2, 4]
# [1, 3, 4]
# [2, 3, 4]
# [1, 2, 5]
# [1, 3, 5]
# [2, 3, 5]
# [1, 4, 5]
# [2, 4, 5]
# [3, 4, 5]