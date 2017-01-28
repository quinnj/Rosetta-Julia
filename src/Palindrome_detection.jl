# Code submitted to http://rosettacode.org/wiki/Palindrome_detection#Julia

# Non-Recursive
function palindrome(s)
    len = length(s)
    for i = 1:div(len, 2)
        if(s[len-i+1]!=s[i])
            return false
        end
    end
    return true
end

# Recursive
function palindrome(s)
    len = length(s)
    if(len==0 || len==1)
        return true
    end
    if(s[1] == s[len])
        return palindrome(SubString(s,2,len-1))
    end
    return false
end

Output:

julia> palindrome("ingirumimusnocteetconsumimurigni")
true
