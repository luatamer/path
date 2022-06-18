local pwd = os.getenv("PWD")
local path = require('path');


print("Testing dir PWD")
if path.is.dir(pwd)
then
  print("INF is dir: "..pwd)
else
  print("ERR should be dir, is not")
end

local f = "try_is.lua"
print("Testing file " ..f)
if path.is.file(pwd)
then
  print("ERR is file: "..pwd)
elseif path.is.file(f)
then
  print("INF should be file: " ..path.realpath(f))
else
    print("ERR should be file")
end

