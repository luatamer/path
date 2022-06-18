local pwd = os.getenv("PWD")
local path = require('path')
local no_exists = './dont_exist'

if path.exists(pwd)
then
  print("INF exists "..pwd)
else
  print("ERR should exists"..pwd)
end

if path.exists(no_exists)
then
  print("ERR exists, but should not"..no_exists)
else
  print("INF does not exists "..no_exists)
end


