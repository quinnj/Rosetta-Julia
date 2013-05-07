#Fibonacci sequence
#http://rosettacode.org/wiki/Fibonacci_sequence

fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)