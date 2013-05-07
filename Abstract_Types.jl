#Abstract type
#http://rosettacode.org/wiki/Abstract_type

# Abstract types cannot be instantiated, and serve only as nodes in the type graph, thereby describing sets of related concrete types: those concrete types which are their descendants.

# Usage:
# abstract «name»
# abstract «name» <: «supertype»

# Examples:
abstract Number
abstract Real     <: Number
abstract FloatingPoint <: Real
abstract Integer  <: Real
abstract Signed   <: Integer
abstract Unsigned <: Integer</lang>

#See more [http://docs.julialang.org/en/latest/manual/types/#abstract-types]
