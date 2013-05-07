#Regular Expressions
#http://rosettacode.org/wiki/Regular_expressions

# To check if a regex matches a string, use the ismatch function:
 
julia> ismatch(r"^\s*(?:#|$)", "not a comment")
false
 
julia> ismatch(r"^\s*(?:#|$)", "# a comment")
true
 
# You can extract the following info from a RegexMatch object:
# the entire substring matched: m.match the captured substrings as a tuple of strings: m.captures the offset at which the whole match begins: m.offset the offsets of the captured substrings as a vector: m.offsets For when a capture doesn’t match, instead of a substring, m.captures contains nothing in that position, and m.offsets has a zero offset (recall that indices in Julia are 1-based, so a zero offset into a string is invalid). Here’s is a pair of somewhat contrived examples:
 
julia> m = match(r"(a|b)(c)?(d)", "acd")
RegexMatch("acd", 1="a", 2="c", 3="d")
 
julia> m.match
"acd"
 
julia> m.captures
3-element Union(UTF8String,ASCIIString,Nothing) Array:
 "a"
 "c"
 "d"
 
julia> m.offset
1
 
julia> m.offsets
3-element Int64 Array:
 1
 2
 3
 
julia> m = match(r"(a|b)(c)?(d)", "ad")
RegexMatch("ad", 1="a", 2=nothing, 3="d")
 
julia> m.match
"ad"
 
julia> m.captures
3-element Union(UTF8String,ASCIIString,Nothing) Array:
 "a"
 nothing
 "d"
 
julia> m.offset
1
 
julia> m.offsets
3-element Int64 Array:
 1
 0
 2