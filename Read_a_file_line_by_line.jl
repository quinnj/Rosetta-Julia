#Read a file line by line
#http://rosettacode.org/wiki/Read_a_file_line_by_line

open("input_file","w") do f
    for line in each_line(f)
      #line operations
    end
end