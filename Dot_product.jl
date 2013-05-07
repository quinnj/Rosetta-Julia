#Dot product
#http://rosettacode.org/wiki/Dot_product

# Linear algebra functions in Julia are largely implemented by calling functions from LAPACK.
 
x = [1, 3, -5]
y = [4, -2, -1]
z = dot(x, y)