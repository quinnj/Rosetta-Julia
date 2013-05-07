#Variables
#http://rosettacode.org/wiki/Variables

Certain constructs in the language introduce scope blocks, which are regions of code that are eligible to be the scope of some set of variables. The scope of a variable cannot be an arbitrary set of source lines, but will always line up with one of these blocks. The constructs introducing such blocks are:
function bodies (either syntax) while loops for loops try blocks catch blocks let blocks type blocks.
#declaration/assignment, declaration is optional
x::Int32 = 1
#datatypes are inferred dynamically, but can also be set thru convert functions and datatype literals
x = 1 #x is inferred as Int, which is Int32 for 32-bit machines, Int64 for 64-bit machines
#variable reference
julia>x
1
 
x = int8(1) #x is of type Int8
x = 1.0 #x is Float64
x = y = 1 #assign both x and y to 1
global x = 1 #assigns 1 to global variable x (used inside scope blocks)
local x = 1 #assigns 1 to local variable x (used inside scope blocks)
x = 'a' #x is a 'Char' type, designated by single quotes
x = "a" #x is a 1-element string, designated by double quotes
A common use of variables is giving names to specific, unchanging values. Such variables are only assigned once. This intent can be conveyed to the compiler using the const keyword:
const e  = 2.71828182845904523536
const pi = 3.14159265358979323846