#JSON
#http://rosettacode.org/wiki/JSON

# Pkg.add("JSON") ... an external library http://docs.julialang.org/en/latest/packages/packagelist/
using JSON

sample = Dict()
sample["blue"] = [1, 2]
sample["ocean"] = "water"
 
json_string = json(sample)
json_obj = JSON.parse(json_string)
 
@assert json_string == "{\"ocean\":\"water\",\"blue\":[1,2]}"
@assert json_obj == ["ocean"=>"water","blue"=>{1,2}]
@assert typeof(json_obj) == Dict{String, Any}

