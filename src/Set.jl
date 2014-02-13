a, b = Set(1,2,3), Set(3,4,5)
union(a, b) # Union of a and b -> Set(1,2,3,4,5)
intersect(a,b) # Intersection of a and b -> Set(3)
setdiff(a,b) # All elements in set a, except those in B -> Set(1,2)
issubset(a,b) # Whether every element in set a is also in b -> false
a == b # Whether a and b have the same elements -> false