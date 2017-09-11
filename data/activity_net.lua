require 'torch'

local json = require 'json'

function serialize(o)
	
	local output = io.open("videos.txt", "w")	
	local text = ""	
	for k,v in pairs(o) do  
	pattern = "[?&]v=(...........)"
	local id = string.match(v,pattern)	
	print(id)	
	
	text=text.."\n"..id
	end
	
	
	output:write(text)
	output:close()
end


	
--print(data['jqKK2KH6l4Q'])
	
local file = io.open("activityNet.json")
local table1 
if file then 
	table1 = json.decode(file:read("*all"))
	file:close() 
end
local urls = {}
local annotations={}
local labels = {}
data = table1['database']
for key,value in pairs(data)
	do url = data[key]['url']
	table.insert(urls,url)
	annotations[url] = data[key]['annotations']
	--print(annotations)
	--for k,v in pairs(annotations)
		--do label = annotations[k]['label']
		--segment = annotations[k]['segment']
			 
		--print("key:"..key.." Segment: "..segment[1]..","..segment[2])
	--end
end
--print(annotations)
serialize(urls)


