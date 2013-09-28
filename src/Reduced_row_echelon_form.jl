# Reduced_row_echelon_form
# http://rosettacode.org/wiki/Reduced_row_echelon_form

function ToReducedRowEchelonForm(matrix)
    lead = 1
    rowCount,columnCount = size(matrix)

    for row = 1:rowCount
        if lead > columnCount
            return
        end

        i = row
        while matrix[i,lead] == 0
            i += 1
            if i == rowCount
                i = row
                lead += 1
                if columnCount == lead
                    return
                end
            end
        end

        matrix[i,:],matrix[row,:] =matrix[row,:],matrix[i,:]
        leadValue = matrix[row,lead]
        matrix[row,:] = [ val / leadValue for val in matrix[row,:]]

        for i=1:rowCount
            if i != row
                leadValue = matrix[i,lead]
                matrix[i,:] = [ (ivalue - leadValue*rowvalue) for (rowvalue,ivalue) in zip(matrix[row,:],matrix[i,:])]
            end
        end
        lead += 1
    end
end


#Output:
#julia> matrix = [1 2 -1 -4 ; 2 3 -1 -11 ; -2 0 -3 22]
#3x4 Int32 Array:
#  1  2  -1   -4
#  2  3  -1  -11
# -2  0  -3   22
#
#julia> ToReducedRowEchelonForm(matrix)
#
#
#julia> matrix
#3x4 Int32 Array:
# 1  0  0  -8
# 0  1  0   1
# 0  0  1  -2
