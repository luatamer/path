local path = require('path');
local pwd = os.getenv("PWD")
local tmp = os.tmpname()

local try_pwd = path.get.dirname(pwd)
local try_file = path.get.dirname("./try_dirname.lua")
local try_tmp = path.get.dirname(tmp)


print("INF Testing dir PWD")
if try_pwd == nil
then
  print("ERR should exists, does not")
elseif try_pwd == 'test'
then
  print("INF exists, and is: ")
  print('test')
  print(try_pwd)
else
  print("ERR should match, does not ")
  print("ERR ->test<-")
  print("ERR ->"..try_pwd.."<-")
end

-- Looks like it is matching but it does't pass the == test
print("INF Testing tmp file with dirname")
if try_tmp == nil
then
  print("ERR should exists, does not")
elseif try_tmp == 'tmp'
then
  print("INF exists, and is: ")
  print("INF ->"..try_tmp.."<-")
  print("INF ->tmp<-")
else
  print("ERR should match, does not ")
  print("ERR ->"..try_tmp.."<-")
  print("ERR ->tmp<-")
end


-- Looks like it is matching but it does't pass the == test
print("INF Testing ./try_dirname.lua with dirname")
if try_file == nil
then
  print("ERR should exists, does not")
elseif try_file == 'test'
then
  print("INF exists, and is: ")
  print("INF ->"..try_file.."<-")
  print("INF ->test<-")
else
  print("ERR should match, does not ")
  print("ERR ->"..try_file.."<-")
  print("ERR ->test<-")
end

