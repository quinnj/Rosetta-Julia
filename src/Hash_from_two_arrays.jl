#Hash from two arrays
#http://rosettacode.org/wiki/Hash_from_two_arrays

# using loops

function hashfromarrays(keys, values)
	hash = Dict()
	for (key, value) in zip(keys, values)
		hash[key] = value
	end
	hash
end

hash = hashfromarrays(["a", "b", "c"], [1,2,3])

@assert sort(collect(keys(hash))) == ["a", "b", "c"]
@assert sort(collect(values(hash))) == [1, 2, 3]

# using only function calls... pending
