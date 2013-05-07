#Temperature conversion
#http://rosettacode.org/wiki/Temperature_conversion

cfr(k) = print("Kelvin: $k, Celsius: $(round(k-273.15,2)), Fahrenheit: $(round(k*1.8-459.67,2)), Rankine: $(round(k*1.8,2))")
julia> cfr(21)
Kelvin: 21, Celsius: -252.15, Fahrenheit: -421.87, Rankine: 37.8