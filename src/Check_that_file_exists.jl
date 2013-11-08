#Check that file exists
#http://rosettacode.org/wiki/Check_that_file_exists

# on *nix at least, is it forward or backslashes on windows? 
ispath("input.txt")
ispath("/input.txt")
ispath("docs")
ispath("/docs")
