#Variadic functions
#http://rosettacode.org/wiki/Variadic_function

It is often convenient to be able to write functions taking an arbitrary number of arguments. Such functions are traditionally known as “varargs” functions, which is short for “variable number of arguments”. You can define a varargs function by following the last argument with an ellipsis:
bar(a,b,x...) = (a,b,x)
The variables a and b are bound to the first two argument values as usual, and the variable x is bound to an iterable collection of the zero or more values passed to bar after its first two arguments:
 
julia> bar(1,2)
(1,2,())
 
julia> bar(1,2,3)
(1,2,(3,))
 
julia> bar(1,2,3,4)
(1,2,(3,4))
 
julia> bar(1,2,3,4,5,6)
(1,2,(3,4,5,6))
In all these cases, x is bound to a tuple of the trailing values passed to bar.
On the flip side, it is often handy to “splice” the values contained in an iterable collection into a function call as individual arguments. To do this, one also uses ... but in the function call instead:
 
julia> x = (3,4)
(3,4)
 
julia> bar(1,2,x...)
(1,2,(3,4))
In this case a tuple of values is spliced into a varargs call precisely where the variable number of arguments go. This need not be the case, however:
 
julia> x = (2,3,4)
(2,3,4)
 
julia> bar(1,x...)
(1,2,(3,4))
 
julia> x = (1,2,3,4)
(1,2,3,4)
 
julia> bar(x...)
(1,2,(3,4))
Furthermore, the iterable object spliced into a function call need not be a tuple:
 
julia> x = [3,4]
2-element Int64 Array:
 3
 4
 
julia> bar(1,2,x...)
(1,2,(3,4))
 
julia> x = [1,2,3,4]
4-element Int64 Array:
 1
 2
 3
 4
 
julia> bar(x...)
(1,2,(3,4))
Also, the function that arguments are spliced into need not be a varargs function (although it often is):
 
baz(a,b) = a + b
 
julia> args = [1,2]
2-element Int64 Array:
 1
 2
 
julia> baz(args...)
3
 
julia> args = [1,2,3]
3-element Int64 Array:
 1
 2
 3
 
julia> baz(args...)
no method baz(Int64,Int64,Int64) As you can see, if the wrong number of elements are in the spliced container, then the function call will fail, just as it would if too many arguments were given explicitly.