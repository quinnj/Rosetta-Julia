#Write float arrays to a text file
#http://rosettacode.org/wiki/Write_float_arrays_to_a_text_file

xprecision = 3
yprecision = 5
x = round([1, 2, 3, 1e11],xprecision)
y = round([1, 1.4142135623730951, 1.7320508075688772, 316227.76601683791],yprecision)
file = open("filename","w") do f
	for (a, b) in zip(x,y)
		writedlm(f,[a b],'\t')
	end
end