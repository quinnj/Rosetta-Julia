#Shell oneliner
#http://rosettacode.org/wiki/Shell_one-liner

$ julia -e 'for x in ARGS; println(x); end' foo bar
foo
bar