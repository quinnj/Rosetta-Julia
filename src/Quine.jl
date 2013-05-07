# Quine
# http://rosettacode.org/wiki/Quine

x = "print(\"x=\$(repr(x))\\n\$x\")"
print("x=$(repr(x))\n$x")
