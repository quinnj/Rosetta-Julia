#Call shared library function
#http://rosettacode.org/wiki/Call_a_function_in_a_shared_library

# ccall((symbol, library), RetType, (ArgType1, ...), ArgVar1, ...)

#this example works on Windows
ccall( (:GetDoubleClickTime, "User32"), stdcall,
	Uint, (), )

ccall( (:clock, "libc"), Int32, ())

# For more information, see here [http://docs.julialang.org/en/latest/manual/calling-c-and-fortran-code.html]