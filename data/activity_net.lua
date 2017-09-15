require 'torch'

local json = require 'json'

function serialize(o)
	
	local output = io.open("videos.txt", "w")	
	local text = ""	
	for k,v in pairs(o) do  
	pattern = "[?&]v=(...........)"
	local id = string.match(v,pattern)	
	--print(id)	
	
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
local associations={}
local urls = {}
local annotations={}
local labels = {}
data = table1['database']
for key,value in pairs(data)
	do url = data[key]['url']
	pattern = "[?&]v=(...........)"
	local id = string.match(url,pattern)
	table.insert(urls,id)
	annotations[url] = data[key]['annotations']
	--print(annotations)
	for k,v in pairs(annotations)
		--do label = annotations[k]['label']
		do annotation = annotations[k]
		for k,v in pairs(annotation)
			do segment = annotation[k]['segment']
			label = annotation[k]['label']
			associations[url]={["SegmentStart"]=segment[1],["SegmentEnd"]=segment[2],["label"]=label}
			
		end
		
		--
	end
end

str = json.encode(associations)
local file= io.open("videos_segments.json", "w")
file:write(str)
file:close()	
--serialize(urls)


