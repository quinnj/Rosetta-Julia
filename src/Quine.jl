# Quine
# http://rosettacode.org/wiki/Quine

# In Julia, `$x` in a string literal interpolates the value of the variable into the string.
# `$(expression)` evaluates the expression and interpolates the result into the string.
# Normally, the string value `"hi\tworld"` would be inserted without quotation marks and with a literal tab.
# The `repr` function returns a string value that contains quotation marks
# and in which the literal tab is replaced by the characters `\t`.
# When the result of the `repr` function is interpolated,
# the result is what you would type into your code to create that string literal.

x = "print(\"x=\$(repr(x))\\n\$x\")"
print("x=$(repr(x))\n$x")
