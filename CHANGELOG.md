# Change Log

## [1.0.11] - 2022-05-07
### Added
- Improvement: Initial work for rendering skins in a webview (work in progress)
- Improvement: Added configuration for pointing at skinning asset folder
- Improvement: display images that are ID based if they are derived from Skinning Assets.

## [1.0.10] - 2022-04-21
### Added
- Improvement: Adding hover display of images in SkinDefinition.xml files
- Improvement: Adding hover display of images in .plugin files
- Improvement: Adding hover display of images in .lua files
![](https://github.com/lunarwtr/vscode-lotro-api/raw/main/img/imageview.gif)

## [1.0.9] - 2022-04-16
### Added
- Improvement: Adding support for  `.skincompendium`, `.musiccompendium`  xml files 
- Improvement: Adding options `<StartupScript>` tag to compendium xsds
- Improvement: Adding TGA image file support dependency

## [1.0.8] - 2022-03-30
### Added
- Improvement: Adding support for deprecated lua function from 5.1
- Improvement: Adding Attributes stance enum classes
- Improvement: Adding undocumented IsA function to base Turbine.Object class
- Improvement: In editor color display and color picker for Turbine.UI.Color classes
    ![](https://github.com/lunarwtr/vscode-lotro-api/raw/main/img/color2.gif)

## [1.0.7] - 2022-03-27
### Added
- Improvement: Added support for UI Skinning files (xml schema + snippets)
    ![](https://github.com/lunarwtr/vscode-lotro-api/raw/main/img/skinning.gif)
- Improvement: Turbine.UI.Color documentation references small images of colors.
    ![](https://github.com/lunarwtr/vscode-lotro-api/raw/main/img/color.gif)
- Improvement: Documented several "table" types in lotro api.
- Improvement: Documented callback functions for sorting and filtering in UI components

## [1.0.6] - 2022-03-19
### Added
- Improvement: Added more snippets for lua files
- Improvement: Hyperlinks to hosted lua documentation
- Improvement: Usage GIFs of features
- Improvement: Centralized settings to workspace

## [1.0.5] - 2022-03-16
### Added
- Fix: file association now fixed for new .plugin & .plugincompendium files
- Improvement: Adding snippets for .plugin & .plugincompendium files
- Improvement: Added snippets for lua files

## [1.0.4] - 2022-03-15
### Added
- Improvement: Constructors on extended Turbine classes are now recognized
- Improvement: .plugin files are now supported
- Improvement: .plugincompendium files are now supported

## [1.0.3] - 2022-03-14
### Added
- Improvement: better support for opening plugin root folder as workspace
- Improvement: added documentation for event arguements
- Improvement: added undocumented BankItem class & functions
- Improvement: added undocument SkillList events SkillAdded & SkillRemoved
- Fix: Correct Turbine class name collisions during class detection

## [1.0.2] - 2022-03-10
### Added
- Improvement: Fix in namespace import erroring in some instances
- Improvement: Added additional 30 functions found in dump but not HTML documentation
- Improvement: Added global variables for currently loaded plugin(s)
- Fix: Added detection of "extending" a Turbine component.  Correctly identifies typing now.

## [1.0.1] - 2022-03-09
### Added
- Improvement: added most of Turbine.Gameplay.Attributes classes
- Improvement: Undocumented Stretch mode added
- Improvement: Missing GetWearState method added to Item class
- Fix: GetMoney* functions so they return multi value returns
- Fix: import should correctly create package namespaces

## [1.0.0] - 2022-03-06
### Initial release