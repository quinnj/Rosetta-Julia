#Sorting Algorithms/Quicksort
#http://rosettacode.org/wiki/Sorting_algorithms/Quicksort

function quicksort(values)
	if length(values) <= 1
		return values == [] ? [] : [values[1]]
	end

	smallerSorted = typeof(values[1])[]
	biggerSorted = typeof(values[1])[]
	

	for i in values[2:end]
		if i <= values[1]
			append!(smallerSorted, [i])
		else
			append!(biggerSorted, [i])
		end
	end

	smallerSorted = quicksort(smallerSorted)
	biggerSorted = quicksort(biggerSorted)

	final = typeof(values[1])[]
	append!(final, smallerSorted)
	append!(final, [values[1]])
	append!(final, biggerSorted)

	return final
end

a = [4, 65, 2, -31, 0, 99, 83, 782, 1]
print(quicksort(a))
