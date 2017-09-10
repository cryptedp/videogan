require 'torch'

local json = require 'json'

local file = io.open("activityNet.json")
local table 
if file then 
	table = json.decode(file:read("*all"))
	file:close() 
end
print(table)
