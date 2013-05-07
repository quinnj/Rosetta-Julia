#Semordnilap
#http://rosettacode.org/wiki/Semordnilap#Julia

raw = readdlm("unixdict.txt",String)[:]
inter = intersect(raw,map(reverse,raw)) #find the matching strings/revstrings
res = String[b == 1 && a != reverse(a) && a < reverse(a) ? a : reverse(a) for a in inter, b in 1:2] #create pairs
res = res[res[:,1] .!= res[:,2],:] #get rid of duplicates, palindromes

# Output

# julia> length(res[:,1])
# 158

# julia> res[1:5,:]
# 5x2 String Array:
#  "able"  "elba"
#  "abut"  "tuba"
#  "ac"    "ca"  
#  "ah"    "ha"  
#  "al"    "la"  