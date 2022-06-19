# path

Currently works only on NIX (Linux, BSD, UNIX etc.)
Maybe it will work on Mac since Mac is based on BSD, I have no way of testing.
It will for sure not work on Windows currently.
If you need it to work, let me know I can probably make that happen.

Module depands on nix commands `test` and `realpath`

There are tests for all commands. One test appears to fail even know the result is as
expected. Still working on figuring that out; any help would be welcome.


### NAME is.string
#### DESCRIPTION
filepath is.string
All args in this module must be a string, if unsure check first with is.string

### NAME path.append
#### DESCRIPTION
Append file or folder to path, adds seperator if needed

### NAME path.exists
#### DESCRIPTION
checks if filepath exists

### NAME is.dir
#### DESCRIPTION
filepath exists and is a filesytem directory/folder

### NAME is.folder
#### ALIAS
alias for is.dir

### NAME is.file
#### DESCRIPTION
filepath exists and is a filesytem file

### NAME is.symLink
#### DESCRIPTION
filepath exists and is symbolic link

### NAME is.pipe
#### DESCRIPTION
filepath exists and is a pipe

### NAME is.socket
#### DESCRIPTION
filepath exists and is character special

### NAME is.chracter
#### DESCRIPTION
filepath exists and is character special

### NAME is.block
#### DESCRIPTION
filepath exists and is block special


### NAME can.read
#### DESCRIPTION
filepath exists and we can read the filepath

### NAME can.write
#### DESCRIPTION
filepath exists and we can write to the filepath

### NAME can.run
#### DESCRIPTION
filepath exists and we can run/execute the filepath

### NAME list.all
#### DESCRIPTION
list all files and folders at given filepath

### NAME list.files
#### DESCRIPTION
list all files at given filepath

### NAME list.by_ext
#### DESCRIPTION
list all files at given filepath by extention

### NAME list.folders
#### DESCRIPTION
list all folders at given filepath

### NAME path.split
#### DESCRIPTION
Will return 3 items, works also on windows
folder, filename, extention
path.spilt("/tmp/test.lua.txt")
-> /tmp/ test.lua.txt txt

### NAME path.filename
#### DESCRIPTION
returns filename including extention discarding folder/directory
Returned value will be a filesystem file OR NIL

### NAME path.ext
#### DESCRIPTION
Returns the file extention from the given filepath if exists

### NAME path.dirname
#### DESCRIPTION
returns absolute directory/folder path discarding filename.
Returned value will be a filesystem directory/folder OR NIL

### NAME path.realpath
#### DESCRIPTION
Print the resolved absolute file name; all but the last component must exist
#### ERROR
realpath: [filepath]: No such file or directory     ]]






