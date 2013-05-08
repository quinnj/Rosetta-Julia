# Identity Matrix
# http://rosettacode.org/wiki/Identity_matrix

# The `eye` function takes an integer argument and returns a square identity matrix of that size.
eye(3)
# This returns:
# 3x3 Float64 Array:
#  1.0  0.0  0.0
#  0.0  1.0  0.0
#  0.0  0.0  1.0

# If you want to take the size from the commandline, you can use:
eye(int(readline(STDIN)))
 

# You can also can also call `eye(m,n)` to create an M-by-N identity matrix.
# For example:
eye(2,3)
# results in:
# 2x3 Float64 Array:
#  1.0  0.0  0.0
#  0.0  1.0  0.0

