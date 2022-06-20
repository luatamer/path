local path =  {}
local is =  {}
local can =  {}
local list =  {}
local get =  {}
path.is = is
path.can = can
path.list = list
path.get = get

path.seperator = "/"

--[[ Naming
is returns bool
can returns bool
get returns string
list returns table

path.is.dir
path.is.file

path.get.abs --> file or dir as string
path.get.dirname --> Last leaf of path
path.get.filename --> full file name including extention
path.get.ext --> File extention, return last extention as string


path.list.dirname --> table of all leafs such as /usr/local/bin return {"user","local", "bin"}
path.list.filename --> table of all leafs such as /usr/local/bin return {"user","local", "bin"}
path.list.ext --> table of all extentions such file.tar.gs return {"tar","gz"}

]]


-- Template
--[[
NAME
ALIAS
DESCRIPTION
ERROR
EXAMPLE
]]



function path.is.string(filepath)
  if type(filepath)~="string" then return false end
end

function path.append(filepath, file)
  if string.sub(filepath, -1) == "/"
  then
    return filepath..file
  end
  return filepath..path.seperator..file
end

function path.exists(filepath)
  return os.execute('test -e '..filepath)
end

function path.is.dir(filepath)
  return os.execute('test -d '..filepath)
end

function path.is.folder(filepath)
  return os.execute('test -d '..filepath)
end

function path.is.file(filepath)
  return os.execute('test -f '..filepath)
end

function path.is.symlink(filepath)
  return os.execute('test -L '..filepath)
end

function path.is.pipe(filepath)
  return os.execute('test -p '..filepath)
end

function path.is.socket(filepath)
  return os.execute('test -S '..filepath)
end

function path.is.character(filepath)
  return os.execute('test -c '..filepath)
end

function path.is.block(filepath)
  return os.execute('test -b '..filepath)
end

function path.can.read(filepath)
  return os.execute('test -r '..filepath)
end

function path.can.write(filepath)
  return os.execute('test -w '..filepath)
end

function path.can.run(filepath)
  return os.execute('test -x '..filepath)
end

function path.can.exec(filepath)
  return os.execute('test -x '..filepath)
end

-- Will return 3 items, works also on windows
-- folder, filename, extention
-- spilt("/tmp/test.lua.txt")
-- -> /tmp/ test.lua.txt txt
function path.split(filepath)
  local d, n, x = string.match(filepath, "(.-)([^\\/]-%.?([^%.\\/]*))$")
  if string.sub(d, -1) == "/"
  then
    d = string.sub(d, 0, string.len(d)-1)
  end
  return d, n, x
end


function path.get.dirname(filepath)
  local str = path.get.abs(filepath)
  local parts = path.list.split(str)
  return parts[#parts]
end

function path.get.abs(filepath)
  local p = path.realpath(filepath)
  local result
  if path.is.file(p)
  then
    result, _, _ = path.split(p)
  elseif path.is.dir(p)
  then
    result = p
  end
  return result
end


function path.get.ext(filepath)
  local result
  if path.is.file(filepath)
  then
    _, _, result = path.split(filepath)
  end
  return result
end

function path.get.filename(filepath)
  local result
  if path.is.file(filepath)
  then
    _, result, _ = path.split(filepath)
  end
  return result
end

function path.list.all(filepath)
  local p = io.popen('ls -A '..filepath)
  local file_pairs = {}
  for file in p:lines() do
    local p = path.append(filepath, file)
    file_pairs[#file_pairs + 1] = p
  end
  return file_pairs
end

function path.list.files(filepath)
  local p = io.popen('ls -A '..filepath)
  local file_pairs = {}
  for file in p:lines() do
    local p = path.append(filepath, file)
    if path.is.file(p) then
      file_pairs[#file_pairs + 1] = p
    end
  end
  return file_pairs
end

function path.list.folders(filepath)
  local p = io.popen('ls -A '..filepath)
  local file_pairs = {}
  for file in p:lines() do
    local p = path.append(filepath, file)
    if path.is.dir(p)
    then
      file_pairs[#file_pairs + 1] = p
    end
  end
  return file_pairs
end

function path.list.dirs(filepath)
  return path.list.folders(filepath)
end

function path.list.by_ext(filepath, ext)
  local p = io.popen('ls -A '..filepath..'/*.'..ext)
  local file_pairs = {}
  for file in p:lines() do
    file_pairs[#file_pairs + 1] = file
  end
  return file_pairs
end

function split(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
         table.insert(t, cap)
      end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
   end
   if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
   end
   return t
end

--[[
parts = split_path("/usr/local/bin")
  --> {'usr','local','bin'}
]]
function path.list.split(filepath)
   return split(filepath,'[\\/]+')
end


--[[
Print the resolved absolute file name; all but the last component must exist
realpath: [filepath]: No such file or directory     ]]
function path.realpath(filepath)
  local handle = io.popen('realpath -ez '..filepath)
  local result = handle:read("*a")
  handle:close()
  return result
end

return path
