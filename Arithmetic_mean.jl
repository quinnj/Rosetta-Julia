#Arithmetic mean
#http://rosettacode.org/wiki/Averages/Arithmetic_mean

# Julia's built-in mean function accepts AbstractArrays (vector, matrix, etc.)
julia> mean([1,2,3])
2.0
julia> mean(1:10)
5.5
julia> mean([])
ERROR: mean of empty collection undefined: []