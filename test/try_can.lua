local pwd = os.getenv("PWD")
local path = require('path');


print("INF path.can.read(pwd)")
if path.can.read(pwd)
then
  print("INF can read from: "..pwd)
else
  print("ERR should be, but car not read "..pwd)
end

print("INF path.can.write(pwd)")
if path.can.write(pwd)
then
  print("INF can write to: "..pwd)
else
  print("ERR should be , but car not write "..pwd)
end

print("INF path.can.run(pwd)")
if path.can.run(pwd)
then
  print("INF can execute: "..pwd)
else
  print("ERR should be, but can not execute "..pwd)
end

local tmpfile = os.tmpname()

print("INF path.can.read(tmpfile)")
if path.can.read(tmpfile)
then
  print("INF can read from: "..tmpfile)
else
  print("ERR should be, but car not read "..tmpfile)
end

print("INF path.can.write(tmpfile)")
if path.can.write(tmpfile)
then
  print("INF can write to: "..tmpfile)
else
  print("ERR should be , but car not write "..tmpfile)
end

print("INF path.can.run(tmpfile)")
if path.can.run(tmpfile)
then
  print("ERR should not be, but can execute "..tmpfile)
else
  print("INF can not execute: "..tmpfile)
end
