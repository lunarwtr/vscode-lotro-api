# Generate Turbine.lua EmmyLua Documentation

## Generate TurbineDump.json

I wish this was more automated.  Will work on that in another revision.

* Install [API Table Dump](https://www.lotrointerface.com/downloads/info578.html) made by Galuhad
* !!!!!IMPORTANT!!!!! Ensure the Turbine extra's plugin is not installed
* Launch LOTRO
* Turn on Chat Logging
* Load API Table Dump addon
* Dump Turbine
* Copy dump from chatlog and format into LUA.
* Convert to JSON by adding the following to bottom of LUA and running with lua interpreter
```lua
dofile("encode_json_sorted.lua")
local fh = io.open("TurbineDump.json", "w")
fh:write(encode_json_sorted(Dump))
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
 
* Download the latest SSG HTML Lua documentation (currently Update 49, `SSG_U49_LuaDocumentation`)
* Unzip it to `lotro-api-docs/U49`, or anywhere else and point `LOTRO_DOC_DIR` at it
* Run the ripdocs script
```bash
perl ripdocs.pl                                              # reads lotro-api-docs/U49
LOTRO_DOC_DIR=/path/to/SSG_U49_LuaDocumentation perl ripdocs.pl
```
* `LOTRO_DOC_VERSION` (default `U49`) selects the folder name and the version used in the
  `[Documentation](https://lunarwtr.github.io/lotro-api-docs/U49/...)` links, so the same
  documentation folder has to be published to the `lotro-api-docs` repository for the links to work
* Enum values are not in the HTML documentation; they come from `TurbineDump.json`. Enums that are
  newer than the dump (currently `EdgeAttachmentType` and `UIScalingGroupType`) are written as
  `number` fields without values until a new dump is made
* Enum members and enums that exist only in `TurbineDump.json` (not in the HTML documentation) are
  added automatically with the description "Not in the SSG documentation (present in the game
  client)." To update enum values, commit a fresh `TurbineDump.json` and re-run `ripdocs.pl`
* Manual change lines as described in [manual-changes.txt](manual-changes.txt)
```bash
cd ../resources/Lua/EmmyLua/Turbine
patch -p0 < ../../../lotro-docs/manual-changes.txt
```
## Perl Modules

You may need to install perl modules
```
sudo apt install build-essential perl
cpan i HTML::Entities Mojo::DOM JSON
```

## Updating manual-changes.txt

`manual-changes.txt` is a plain `diff -u` from the generated file to the final one. After editing the
final `Turbine.lua`, regenerate it so the next documentation update can re-apply the changes:
```bash
cd ../resources/Lua/EmmyLua/Turbine
cp Turbine.lua /tmp/Turbine.final.lua
(cd ../../../../lotro-docs && perl ripdocs.pl)          # writes the plain generated Turbine.lua
mv Turbine.lua Turbine.lua.orig && cp /tmp/Turbine.final.lua Turbine.lua
diff -u Turbine.lua.orig Turbine.lua > ../../../../lotro-docs/manual-changes.txt; rm Turbine.lua.orig
```
