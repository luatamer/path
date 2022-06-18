local pwd = os.getenv("PWD")
local dirname = require('path').dirname;

local try_pwd = dirname(pwd)

print("Testing dir PWD")
if try_pwd == nil
then
  print("ERR should exists, does not")
elseif try_pwd == pwd
then
  print("INF exists, and is: "..try_pwd)
end

-- Looks like it is matching but it does't pass the == test
local try_file = dirname("./try_dirname.lua")
print("Testing ./try_dirname.lua with dirname")
if try_file == nil
then
  print("ERR should exists, does not")
elseif try_file == pwd
then
  print("INF exists, and is: "..try_file)
else
  print("ERR should match, does not ")
  print("ERR ->"..try_file.."<-")
  print("ERR ->"..pwd.."<-")
end

