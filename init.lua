local path =  {}
local is =  {}
local can =  {}
local list =  {}
path.is = is
path.can = can
path.list = list

path.seperator = "/"

--[[
NAME isstring
DESCRIPTION
  filepath isstring
  All args in this module must be a string, if unsure check first with isstring
--]]
function path.is.string(filepath)
  if type(filepath)~="string" then return false end
end

--[[
NAME path.append
DESCRIPTION
  Adds path seperator if needed
--]]
function path.append(filepath, file)
  if string.sub(filepath, -1) == "/"
  then
    return filepath..file
  end
  return filepath..path.seperator..file
end

--[[
NAME exists
DESCRIPTION
  filepath exists    ]]
function path.exists(filepath)
  return os.execute('test -e '..filepath)
end

--[[
NAME is
DESCRIPTION
  Alias of filepath exists
function path.is(filepath)
  return path.exists(filepath)
end
]]

--[[
NAME is_dir
DESCRIPTION
  filepath exists and is a filesytem directory/folder    ]]
function path.is.dir(filepath)
  return os.execute('test -d '..filepath)
end

--[[
NAME is_folder
DESCRIPTION
  filepath exists and is a filesytem folder    ]]
function path.is.folder(filepath)
  return os.execute('test -d '..filepath)
end

--[[
NAME is_file
DESCRIPTION
  filepath exists and is a filesytem file    ]]
function path.is.file(filepath)
  return os.execute('test -f '..filepath)
end

--[[
NAME is_symLink
DESCRIPTION
  filepath exists and is symbolic link    ]]
function path.is.symLink(filepath)
  return os.execute('test -L '..filepath)
end

--[[
NAME is_pipe
DESCRIPTION
  filepath exists and is a pipe    ]]
function path.is.pipe(filepath)
  return os.execute('test -p '..filepath)
end

--[[
NAME is_socket
DESCRIPTION
  filepath exists and is character special    ]]
function path.is.socket(filepath)
  return os.execute('test -S '..filepath)
end

--[[
NAME is_chracter
DESCRIPTION
  filepath exists and is character special    ]]
function path.is.character(filepath)
  return os.execute('test -c '..filepath)
end

--[[
NAME isBlock
DESCRIPTION
  filepath exists and is block special    ]]
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

function path.list.by_ext(filepath, ext)
  local p = io.popen('ls -A '..filepath..'/*.'..ext)
  local file_pairs = {}
  for file in p:lines() do
    file_pairs[#file_pairs + 1] = file
  end
  return file_pairs
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

function path.ext(filepath)
  local result
  if path.is.file(filepath)
  then
    _, _, result = path.split(filepath)
  end
  return result
end

--[[
NAME filename
DESCRIPTION
  returns filename including extention discarding folder/directory
  Returned value will be a filesystem file OR NIL   ]]
function path.filename(filepath)
  local result
  if path.is.file(filepath)
  then
    _, result, _ = split(filepath)
  end
  return result
end

--[[
NAME dirname
DESCRIPTION
  returns absolute directory/folder path discarding filename.
  Returned value will be a filesystem directory/folder OR NIL   ]]
function path.dirname(filepath)
  local p = path.realpath(filepath)
  print("Trying p: "..p)
  local result
  if path.is.file(p)
  then
    res, _, _ = path.split(p)
    result = path.realpath(res)
  elseif path.is.dir(p)
  then
    result = p
  end
  return result
end
--[[
NAME realpath
DESCRIPTION
  Print the resolved absolute file name; all but the last component must exist
ERROR
  realpath: [filepath]: No such file or directory     ]]
function path.realpath(filepath)
  local handle = io.popen('realpath -ez '..filepath)
  local result = handle:read("*a")
  handle:close()
  return result
end

return path
