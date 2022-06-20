local pwd = os.getenv("PWD")
local home = os.getenv("HOME")
local path = require('path')


local a = path.list.all(pwd)

print("List path.list.all(pwd): "..pwd)
for key,value in pairs(a)
do
   print(key, value)
end

local x = path.list.by_ext(pwd, "lua")
print('List path.list.by_ext(pwd, "lua"'..pwd)
for key,value in pairs(x)
do
   print(key, value)
end

local tmp = "/tmp"
local f = path.list.folders(tmp)
print('Folders: path.list.folders("/tmp")')
for key,value in pairs(f)
do
   print(key, value)
end

local d = path.list.dirs(home)
print('dirs: path.list.dirs(home)')
for key,value in pairs(d)
do
   print(key, value)
end


local s = path.list.files(tmp)
print('Files: path.list.files("/tmp")')
for key,value in pairs(s)
do
   print(key, value)
end
