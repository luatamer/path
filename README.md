Lua Path
==========

Currently works only on NIX (Linux, BSD, UNIX etc.)
Maybe it will work on Mac since Mac is based on BSD, I have no way of testing.
It will for sure not work on Windows currently.
If you need it to work, let me know I can probably make that happen.

Module depands on nix commands `test` and `realpath`

There are tests for all commands. One test appears to fail even know the result is as
expected. Still working on figuring that out; any help would be welcome.

_____________________________________________________________________________

Cheatsheet
==========

```lua
bool = path.is.dir(string)
bool = path.is.folder(string)
bool = path.is.file(string)
bool = path.is.symlink(string)
bool = path.is.pipe(string)
bool = path.is.socket(string)
bool = path.is.character(string)
bool = path.is.block(string)

bool = path.can.read(string)
bool = path.can.write(string)
bool = path.can.run(string)
bool = path.can.exec(string) // ALIAS OF can.run

string = path.get.abs(string)
string = path.get.dirname(string)
string = path.get.filename(string)
string = path.get.ext(string)

table = path.list.all(string)
table = path.list.folders(string)
table = path.list.dirs(string) // ALIAS OF list.folders
table = path.list.files(string)
table = path.list.by_ext(filepath, ext)
table = path.list.split(string)

table = path.list.ext(string)
table = path.list.file_ext(string) // ALIAS OF list.ext

bool = path.exists(string)
string = path.append(filepath, file)
string, string, string = path.split(string) // -> dir, file, ext
string = path.realpath(string)
```

Disclaimer
----------
This is my first Lua program/module, well right after `Hello World`.
Any suggestions are more then welcome.
_____________________________________________________________________________

Installation
============

Run following in your Lua project folder.

```git
git clone https://github.com/luatamer/path.git
```
_____________________________________________________________________________

Usage
=====

Get all `path` commands
```lua
local path = require('path')

if path.is.dir(os.getenv("PWD"))
then
  print('INF Success')
else
  print('ERR Failed')
end
```

Get only `is` commands
```lua
local is = require('path').is

if is.dir(os.getenv("PWD"))
then
  print('INF Success')
else
  print('ERR Failed')
end
```

_____________________________________________________________________________

Documentation
=============
### NAME is.string
#### DESCRIPTION
filepath is.string
All args in this module must be a string, if unsure check first with is.string

_____________________________________________________________________________

### NAME path.append
#### DESCRIPTION
Append file or folder to path, adds seperator if needed

_____________________________________________________________________________

### NAME path.exists
#### DESCRIPTION
checks if filepath exists

_____________________________________________________________________________

### NAME is.dir
#### DESCRIPTION
filepath exists and is a filesytem directory/folder

_____________________________________________________________________________

### NAME is.folder
#### ALIAS
alias for is.dir

_____________________________________________________________________________

### NAME is.file
#### DESCRIPTION
filepath exists and is a filesytem file

_____________________________________________________________________________

### NAME is.symlink
#### DESCRIPTION
filepath exists and is symbolic link

_____________________________________________________________________________

### NAME is.pipe
#### DESCRIPTION
filepath exists and is a pipe

_____________________________________________________________________________

### NAME is.socket
#### DESCRIPTION
filepath exists and is socket

_____________________________________________________________________________

### NAME is.character
#### DESCRIPTION
filepath exists and is character special

_____________________________________________________________________________

### NAME is.block
#### DESCRIPTION
filepath exists and is block special

_____________________________________________________________________________

### NAME can.read
#### DESCRIPTION
filepath exists and we can read the filepath

_____________________________________________________________________________

### NAME can.write
#### DESCRIPTION
filepath exists and we can write to the filepath

_____________________________________________________________________________

### NAME can.run
#### DESCRIPTION
filepath exists and we can run/execute the filepath

_____________________________________________________________________________

### NAME can.exec
#### ALIAS of can.run
#### DESCRIPTION
filepath exists and we can run/execute the filepath

_____________________________________________________________________________

### NAME list.all
#### DESCRIPTION
list all files and folders at given filepath

_____________________________________________________________________________

### NAME list.files
#### DESCRIPTION
list all files at given filepath

_____________________________________________________________________________

### NAME list.by_ext
#### DESCRIPTION
list all files at given filepath by extention

_____________________________________________________________________________

### NAME list.ext
#### DESCRIPTION
list all file extentions

#### EXAMPLE
```
path.list.ext('archive.tar.gz')
--> {"tar", "gz"}
```
_____________________________________________________________________________

### NAME list.folders
#### DESCRIPTION
list all folders at given filepath

_____________________________________________________________________________

### NAME list.dirs
#### ALIAS of list.folders
#### DESCRIPTION
list all folders at given filepath

_____________________________________________________________________________

### NAME path.split
#### DESCRIPTION
Will return 3 items, works also on windows
Does not verify paths existens

#### EXAMPLE

```
string, string, string = path.spilt(string)
folder, filename, extention = path.spilt("/tmp/test.lua.txt")
-> /tmp/ test.lua.txt txt
```
_____________________________________________________________________________

### NAME get.abs
#### DESCRIPTION
returns filename including extention discarding folder/directory
Returned value will be a filesystem file OR NIL

_____________________________________________________________________________

### NAME get.dirname
#### DESCRIPTION
returns absolute directory/folder path discarding filename.
Returned value will be a filesystem directory/folder OR NIL

_____________________________________________________________________________

### NAME get.filename
#### DESCRIPTION
returns filename including extention discarding folder/directory
Returned value will be a filesystem file OR NIL

_____________________________________________________________________________

### NAME get.ext
#### DESCRIPTION
Returns the file extention from the given filepath if exists

_____________________________________________________________________________


### NAME path.realpath
#### DESCRIPTION
Print the resolved absolute file name; all but the last component must exist
#### ERROR
realpath: [filepath]: No such file or directory     ]]

_____________________________________________________________________________

