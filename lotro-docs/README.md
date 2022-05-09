# Generate Turbine.lua EmmyLua Documentation

## Generate TurbineDump.json

I wish this was more automated.  Will work on that in another revision.

* Install [API Table Dump](https://www.lotrointerface.com/downloads/info578.html) made by Galuhad
* Ensure the Turbine extra's plugin is not installed
* Launch LOTRO
* Turn on Chat Logging
* Load API Table Dump addon
* Dump Turbine
* Copy dump from chatlog and format into LUA.
* Convert to JSON by adding the following to bottom of LUA and running with lua interpreter
```lua
json = require 'lunajson'
local fh = io.open("TurbineDump.json", "w")
fh:write(json.encode(Dump))
fh:close()
```
```bash
$ lua TurbineDump.lua > TurbineDump.json
```

## Generate Event Dump

* Install TurbineDumper plugin in lotro plugin folder
* Load it and collect events data.
* Unload plugin and it will save to disk (Documents/The Lord of the Ring Online/PluginData/Account/TurbineDumper.plugindata)
* Convert it to json (similar to TurbineDump above)


## Generate EmmyLua
 
* Download Latest [SSG HTML Documentation](https://www.lotrointerface.com/downloads/fileinfo.php?id=1054) from lotrointerface.com.  The newest was for Update 25
* Unzip and place in a subfolder of `lotro-docs`.  (I used U25)
* Edit [ripdocs.pl](ripdocs.pl) to have a $BASE_DOC_DIR variable pointing at the folder
* Run the ripdocs script
```bash
perl ripdocs.pl
```
* Manual change lines as described in [manual-changes.txt](manual-changes.txt)
```bash
cd resources/Lua/EmmyLua/Turbine
patch -p0 < ../../../lotro-docs/manual-changes.txt
```
## Perl Modules

You may need to install perl modules
```
sudo apt install build-essential perl
cpan i HTML::Entities Mojo::DOM JSON
```
