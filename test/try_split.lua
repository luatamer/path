local pwd = os.getenv("PWD")
local path = require('path')

local filepath = pwd.."/try_split.lua"

print("INF filepath: "..filepath)

local d, n, x = path.split(filepath)

if d == pwd
then
  print("INF dir: "..d)
  print("INF pwd: "..pwd)
else
  print("ERR should match, but does not")
  print("ERR dir ->"..d.."<-")
  print("ERR pwd ->"..pwd.."<-")
end

if n == "try_split.lua"
then
  print("INF filename: "..n)
else
  print("ERR should match, but does not")
  print("ERR     is ->"..n.."<-")
  print("ERR should ->try_split.lua<-")
end

if x == "lua"
then
  print("INF ext: "..x)
else
  print("ERR should match, but does not")
  print("ERR     is ->"..x.."<-")
  print("ERR should ->lua<-")
end
