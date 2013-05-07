#Flatten a list
#http://rosettacode.org/wiki/Flatten_a_list

# Julia auto-flattens nested arrays of this form
# Output
julia> t = [[1], 2, [[3,4], 5], [[[]]], [[[6]]], 7, 8, []]
8-element Int32 Array:
 1
 2
 3
 4
 5
 6
 7
 8