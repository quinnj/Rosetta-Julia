#Primes Module
 #PRIMES const
 #MPRIMES const
 #ismprime()
 #isprime() for large int
 #atkins() prime generator
 #mersenne prime generator
 #isperfect()
 #perfect number generator

function atkins(limit)
    primes = Array(Int64,limit)

    # n = 3x^2 + y^2 section
    xx3 = 3
    for dxx = 0:24:(12*sqrt((limit-1)/3))
        xx3 += dxx
        y_limit = 12*sqrt(limit - xx3) - 36
        n = xx3 + 16
        for dn = -12:72:y_limit+1
            n += dn
            primes[n] = !primes[n]
        end
        n = xx3 + 4
        for dn = 12:72:y_limit+1
            n+= dn
            primes[n] = !primes[n]
        end
    end

    # n = 4x^2 + y^2 section
    xx4 = 0
    for dxx4 = 4:8:(8*sqrt((limit-1)/4)+4)
        xx4 += dxx4
        n = xx4+1
        if xx4 % 3 != 0
            for dn = 0:8:(4*sqrt(limit - xx4)-3)
                n += dn
                primes[n] = !primes[n]
            end
        else
            y_limit = 12 * sqrt(limit-xx4) - 36
            n = xx4 + 25
            for dn = -24:72:y_limit+1
                n += dn
                primes[n] = !primes[n]
            end
            n = xx4+1
            for dn = 24:72:y_limit+1
                n += dn
                primes[n] = !primes[n] 
            end
        end
    end

    # n = 3x^2 - y^2 section
    xx = 1
    for x = 3:2:(sqrt(limit/2)+1)
        xx += 4x-4
        n = 3xx
        if n > limit
            min_y = ((sqrt(n - limit)>>2)<<2)
            yy = min_y*min_y
            n -= yy
            s = 4min_y+4
        else
            s = 4
        end
        for dn = s:8:4x
            n -= dn
            if n <= limit && n % 12 == 11
                primes[n] = !primes[n]
            end
        end
    end

    xx = 0
    for x = 2:2:(sqrt(limit/2)+1)
        xx += 4x-4
        n = 3xx
        if n > limit
            min_y = ((sqrt(n - limit)>>2)<<2)-1
            yy = min_y*min_y
            s = 4min_y+4
        else
            n -= 1
            s = 0
        end
        for dn = s:8:4x
            n -= dn
            if n <= limit && n % 12 == 11
                primes[n] = !primes[n]
            end
        end
    end

    # eliminate squares
    for n = 5:2:(sqrt(limit)+1)
        if primes[n] == 0
            for k = n*n:n*n:limit
                primes[k] = false
            end
        end
    end
    return [2,3,]
end
 
    # eliminate squares        
    for n in xrange(5,int(sqrt(limit))+1,2):
        if primes[n]:
            for k in range(n*n, limit, n*n):
                primes[k] = False
 
    return [2,3] + filter(primes.__getitem__, xrange(5,limit,2))