#Floyd's triangle
#http://rosettacode.org/wiki/Floyd%27s_triangle

#floyd(n) creates an n-row floyd's triangle counting from 1 to (n/2+.5)*n
function floyd(n) 
	x = 1
	dig(x,line,n) = (while line < n; x+=line; line+= 1 end; return ndigits(x)+1)
	for line = 1:n, i = 1:line; print(lpad(x,dig(x,line,n)," ")); x+=1; i==line && print("\n") end
end

# Output 
# julia> floyd(14)
#   1
#   2  3
#   4  5  6
#   7  8  9 10
#  11 12 13 14 15
#  16 17 18 19 20 21
#  22 23 24 25 26 27 28
#  29 30 31 32 33 34 35 36
#  37 38 39 40 41 42 43 44  45
#  46 47 48 49 50 51 52 53  54  55
#  56 57 58 59 60 61 62 63  64  65  66
#  67 68 69 70 71 72 73 74  75  76  77  78
#  79 80 81 82 83 84 85 86  87  88  89  90  91
#  92 93 94 95 96 97 98 99 100 101 102 103 104 105