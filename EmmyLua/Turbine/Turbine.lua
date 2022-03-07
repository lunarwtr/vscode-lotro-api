---The core Turbine API package.
---@class Turbine
---@field Chat Chat This class provides events for when messages are received through the game. This includes player chat, tells, in game messages, and announcements.
---@field ChatType ChatType Defines the type of chat data.
---@field DataScope DataScope Defines the scope of plugin data.
---@field Engine Engine Provides engine level information to user plugins.
---@field Gameplay Gameplay Provides classes for accessing game related information.
---@field Language Language Defines the client languages.
---@field LotroPluginManager LotroPluginManager Provides access to plugin management methods.
---@field Plugin Plugin Provides information about a specific plugin that has been loaded.
---@field PluginData PluginData Provides the ability to save and load plugin data.
---@field PluginManager PluginManager Provides access to plugin management methods.
---@field Shell Shell Provides programmer extensibility to the chat window.
---@field UI UI The core UI package that allows users to create low level controls.
Turbine = {}


---This class provides events for when messages are received through the game. This includes player chat,
---              tells, in game messages, and announcements.
---@class Chat : Object
Chat = {}


---Defines the type of chat data.
---@class ChatType
ChatType = {
	-- Specifies the Undef chat type.
	Undef = 0,
	-- Specifies the Error chat type.
	Error = 1,
	-- Specifies the Admin chat type.
	Admin = 3,
	-- Specifies the Standard chat type.
	Standard = 4,
	-- Specifies the Say chat type.
	Say = 5,
	-- Specifies the Tell chat type.
	Tell = 6,
	-- Specifies the Emote chat type.
	Emote = 7,
	-- Specifies the Fellowship chat type.
	Fellowship = 11,
	-- Specifies the Kinship chat type.
	Kinship = 12,
	-- Specifies the Officer chat type.
	Officer = 13,
	-- Specifies the Advancement chat type.
	Advancement = 14,
	-- Specifies the Trade chat type.
	Trade = 15,
	-- Specifies the LFF chat type.
	LFF = 16,
	-- Specifies the OOC chat type.
	OOC = 18,
	-- Specifies the Regional chat type.
	Regional = 19,
	-- Specifies the Death chat type.
	Death = 20,
	-- Specifies the Quest chat type.
	Quest = 21,
	-- Specifies the Raid chat type.
	Raid = 23,
	-- Specifies the Unfiltered chat type.
	Unfiltered = 25,
	-- Specifies the Roleplay chat type.
	Roleplay = 27,
	-- Specifies the UserChat1 chat type.
	UserChat1 = 28,
	-- Specifies the UserChat2 chat type.
	UserChat2 = 29,
	-- Specifies the UserChat3 chat type.
	UserChat3 = 30,
	-- Specifies the UserChat4 chat type.
	UserChat4 = 31,
	-- Specifies the Tribe chat type.
	Tribe = 32,
	-- Specifies the Player Combat chat type.
	PlayerCombat = 34,
	-- Specifies the Enemy Combat chat type.
	EnemyCombat = 35,
	-- Specifies the Self Loot chat type.
	SelfLoot = 36,
	-- Specifies the Fellow Loot chat type.
	FellowLoot = 37,
	-- Specifies the World chat type.
	World = 38,
	-- Specifies the UserChat5 chat type.
	UserChat5 = 39,
	-- Specifies the UserChat6 chat type.
	UserChat6 = 40,
	-- Specifies the UserChat7 chat type.
	UserChat7 = 41,
	-- Specifies the UserChat8 chat type.
	UserChat8 = 42,
}


---Defines the scope of plugin data.
---@class DataScope
DataScope = {
	-- Specifies account plugin data.
	Account = 1,
	-- Specifies server plugin data.
	Server = 2,
	-- Specifies character plugin data.
	Character = 3,
}


---Provides engine level information to user plugins.
---@class Engine
Engine = {}

---Gets the current callstack.
---@vararg any
---@return string #The current callstack.
Engine.GetCallStack = function (...) end

---Gets the current date.
---@return Object #Returns a table containing information about the current date. The following fields are available: Year, Month, Day, Hour, Minute, Second, DayOfWeek, DayOfYear, and IsDST.
Engine.GetDate = function () end

---Gets the current relative game time.
---@return number #Returns a relative game time in seconds.
Engine.GetGameTime = function () end

---Gets the language the client is using.
---@return number #The language the client is using.
Engine.GetLanguage = function () end

---Gets the number of seconds since 1/1/1970.
---@return number #The number of seconds since 1/1/1970.
Engine.GetLocalTime = function () end

---Gets a string identify the locale the application is set to.
---@return string #The locale identifier.
Engine.GetLocale = function () end

---Gets the major and minor versions numbers for the Lua script system.
---@return number #
---@return number #
Engine.GetScriptVersion = function () end

---Logs a message to the script log.
---@param message string The message to log.
Engine.ScriptLog = function (message) end


---Provides classes for accessing game related information.
---@class Gameplay
---@field ActiveSkill ActiveSkill Information about an active player's skill.
---@field Actor Actor Base class for any entity that interacts in the world.
---@field Alignment Alignment The alignment of a player.
---@field Attributes Attributes Provides classes for accessing game related information.
---@field Backpack Backpack Provides access to a player's backpack.
---@field Bank Bank A container of items that are only accessible at designated bank locations.
---@field BasicMount BasicMount A basic mount.
---@field Class Class The Class of a player.
---@field ClassAttributes ClassAttributes Base class for class information.
---@field CombatMount CombatMount A mount that can be used in combat.
---@field CraftTier CraftTier A crafting tier.
---@field Effect Effect Represents an effect that can be applied to an entity.
---@field EffectCategory EffectCategory Describes the category of an effect.
---@field EffectList EffectList A utility class used by Actors to hold the list of effects.
---@field Entity Entity Base class for any entity in the game.
---@field EntityReference EntityReference 
---@field Equipment Equipment Provides access to a player's equipment.
---@field GambitSkill GambitSkill Information about a gambit skill.
---@field GambitSkillInfo GambitSkillInfo Information about a gambit skill.
---@field Item Item An item that a user can have.
---@field ItemCategory ItemCategory Describes the category of an item.
---@field ItemDurability ItemDurability Describes the durability of an item.
---@field ItemInfo ItemInfo Container for various item information.
---@field ItemQuality ItemQuality Describes the quality of an item.
---@field ItemWearState ItemWearState Describes the current wear state of an item.
---@field LocalPlayer LocalPlayer A class that represents the local player.
---@field Mount Mount Class representing an in game mount.
---@field Party Party This class provides access to party information. This is either your fellowship or your tribe depending on your alliance.
---@field PartyMember PartyMember 
---@field Pet Pet A pet is an actor that a player owns and controls.
---@field Player Player A class that represents a player in the game.
---@field Profession Profession A profession a free people player can have.
---@field ProfessionInfo ProfessionInfo Information about a profession.
---@field PropertyHandler PropertyHandler 
---@field Race Race The Race of a player.
---@field ReadyState ReadyState The ready state of a player.
---@field Recipe Recipe Information about a recipe.
---@field RecipeIngredient RecipeIngredient Information about a recipe ingredient.
---@field SharedStorage SharedStorage A bank that represents the player's shared storage. This storage is available to all characters on the same account.
---@field Skill Skill Information about a skill.
---@field SkillInfo SkillInfo Information about a skill.
---@field SkillList SkillList A list of skills.
---@field SkillType SkillType A type of skill.
---@field UntrainedSkill UntrainedSkill Information about a skill the player has not trained yet.
---@field Vault Vault A bank that represents the player's vault storage. This storage is only available to the current logged in character.
---@field Vocation Vocation The vocation of a free people player.
---@field Wallet Wallet Provides access to a player's wallet.
---@field WalletItem WalletItem An item that is contained in a user's wallet.
Gameplay = {}


---Information about an active player's skill.
---@class ActiveSkill : Skill
ActiveSkill = {}

---Gets the base cooldown of the skill.
---@return number #The base cooldown of the skill in seconds.
function ActiveSkill:GetBaseCooldown() end

---Gets the cooldown of the skill.
---@return number #The cooldown of the skill in seconds.
function ActiveSkill:GetCooldown() end

---Gets the time that the skill will come off of cooldown.
---@return number #The base cooldown of the skill in seconds.
function ActiveSkill:GetResetTime() end

---Gets if the skill is currently usable.
---@return boolean #
function ActiveSkill:IsUsable() end


---Base class for any entity that interacts in the world.
---@class Actor : Entity
Actor = {}

---Gets the base max morale of the actor.
---@return number #The base max morale of the actor.
function Actor:GetBaseMaxMorale() end

---Gets the base max power of the actor.
---@return number #The base max power of the actor.
function Actor:GetBaseMaxPower() end

---Gets the effects on the actor.
---@return EffectList #The list of effects.
function Actor:GetEffects() end

---Gets the level of the actor.
---@return number #The level of the actor.
function Actor:GetLevel() end

---Gets the max morale of the actor.
---@return number #The max morale of the actor.
function Actor:GetMaxMorale() end

---Gets the max power of the actor.
---@return number #The max power of the actor.
function Actor:GetMaxPower() end

---Gets the maximum temporary morale of the actor.
---@return number #The maximum temporary morale of the actor.
function Actor:GetMaxTemporaryMorale() end

---Gets the max temporary power of the actor.
---@return number #The max temporary power of the actor.
function Actor:GetMaxTemporaryPower() end

---Gets the current morale of the actor.
---@return number #The current morale of the actor.
function Actor:GetMorale() end

---Gets the current power of the actor.
---@return number #The current power of the actor.
function Actor:GetPower() end

---Gets the actor's target.
---@return Entity #The target.
function Actor:GetTarget() end

---Gets the temporary morale of the actor.
---@return number #The temporary morale of the actor.
function Actor:GetTemporaryMorale() end

---Gets the temporary power of the actor.
---@return number #The temporary power of the actor.
function Actor:GetTemporaryPower() end


---The alignment of a player.
---@class Alignment
Alignment = {
	-- An undefined alignment.
	Undefined = 0,
	-- A player aligned with the Free People.
	FreePeople = 1,
	-- A monster player.
	MonsterPlayer = 2,
}


---Provides classes for accessing game related information.
---@class Attributes : PropertyHandler
Attributes = {}


---Provides access to a player's backpack.
---@class Backpack : Object
Backpack = {}

---Gets an item from the player's backpack.
---@param index number The index of the item to get.
---@return Item #Either nil if there is no item there or the index is invalid, or the Item that is in the given index.
function Backpack:GetItem(index) end

---Gets the size of the player's backpack.
---@return number #The size of the player's backpack.
function Backpack:GetSize() end

---Function to handle moving or swapping an item in our inventory. This DOES NOT handle dragging items from any of the character banks or housing hooks. For that functionality please use "PerformShortcutDrop.".
---@param item Item The LuaItem representing the item you are trying to move
---@param destinationIndex number The index into the backpack where you are trying to place the item
---@param split boolean Whether or not we want to split the item's stack while dragging it
function Backpack:PerformItemDrop(item, destinationIndex, split) end

---Function to handle dropping any kind of item into the backpack. If the item is already in the backpack or is coming from a housing hook, it will perform a swap with anything at the destination index.
---@param shortcut Shortcut The LuaShortcut containing the item info needed for handling drag and drop. This MUST be generated by a valid drag and drop message or moving things from the vaults and housing hooks will generate errors!
---@param destinationIndex number The index into the backpack where you are trying to drop the item
---@param split boolean Whether or not we want to split the item's stack while dragging it
function Backpack:PerformShortcutDrop(shortcut, destinationIndex, split) end


---A container of items that are only accessible at designated bank locations.
---@class Bank : Object
Bank = {}

---Gets the number of items that the bank can hold.
---@return number #The number of items that the bank can hold.
function Bank:GetCapacity() end

---Gets the number of chest that are available.
---@return number #The number of chest that are available.
function Bank:GetChestCount() end

---Gets the name of a chest.
---@param chestType string
---@return string #The name of the specified chest.
function Bank:GetChestName(chestType) end

---Gets the numbers of items in the bank.
---@return number #The number of items in the bank.
function Bank:GetCount() end

---Gets and item from the player's bank.
---@param index number The index of the item to get.
---@return Item #Either nil if there is no item there or the index is invalid, or the Item that is in the given index.
function Bank:GetItem(index) end

---Gets a flag indicating if the bank is currently available.
---@return boolean #
function Bank:IsAvailable() end

---Handles the dropping of items into a bank.
---@param shortcut Shortcut The shortcut information that was generated as part of a drag and drop event that should contain an item to perform an action on.
---@param targetChest any The target chest the drop should occur into.
---@param split boolean Flag indicating if the item split dialog should be displayed for the operation.
function Bank:PerformShortcutDrop(shortcut, targetChest, split) end


---A basic mount.
---@class BasicMount : Mount
BasicMount = {}

---Gets the max morale of a basic mount.
---@return number #The max morale of a basic mount.
function BasicMount:GetMaxMorale() end

---Gets the morale of a basic mount.
---@return number #The morale of a basic mount.
function BasicMount:GetMorale() end


---The Class of a player.
---@class Class
Class = {
	-- An undefined Class.
	Undefined = 0,
	-- Guardian class.
	Guardian = 23,
	-- Captain class.
	Captain = 24,
	-- Minstrel class.
	Minstrel = 31,
	-- Burglar class.
	Burglar = 40,
	-- WarLeader class.
	WarLeader = 52,
	-- Reaver class.
	Reaver = 71,
	-- Stalker class.
	Stalker = 126,
	-- Weaver class.
	Weaver = 127,
	-- Defiler class.
	Defiler = 128,
	-- Hunter class.
	Hunter = 162,
	-- Champion class.
	Champion = 172,
	-- Black Arrow class.
	BlackArrow = 179,
	-- Lore Master class.
	LoreMaster = 185,
	-- Troll class.
	Troll = 190,
	-- Ranger class.
	Ranger = 191,
	-- Chicken class.
	Chicken = 192,
	-- Rune-Keeper class.
	RuneKeeper = 193,
	-- Warden class.
	Warden = 194,
	-- Beorning class.
	Beorning = 214,
}


---Base class for class information.
---@class ClassAttributes : Attributes
ClassAttributes = {}


---A mount that can be used in combat.
---@class CombatMount : Mount
CombatMount = {}

---Gets the modified agility of the player.
---@return number #The modified agility of the player.
function CombatMount:GetAgility() end

---Gets the armor value of the mount.
---@return number #The armor value of the mount.
function CombatMount:GetArmor() end

---Gets the unmodified agility of the mount.
---@return number #The unmodified agility of the mount.
function CombatMount:GetBaseAgility() end

---Gets the base armor value of the mount.
---@return number #The base armor value of the mount.
function CombatMount:GetBaseArmor() end

---Gets the base max morale of the mount.
---@return number #The base max morale of the mount.
function CombatMount:GetBaseMaxMorale() end

---Gets the base max power of the mount.
---@return number #The base max power of the mount.
function CombatMount:GetBaseMaxPower() end

---Gets the unmodified strength of the mount.
---@return number #The unmodified strength of the mount.
function CombatMount:GetBaseStrength() end

---Gets the current fury of the combat horse.
---@return number #The current fury of the combat horse.
function CombatMount:GetFury() end

---Gets the max fury of the combat horse.
---@return number #The max fury of the combat horse.
function CombatMount:GetMaxFury() end

---Gets the max morale of the mount.
---@return number #The max morale of the mount.
function CombatMount:GetMaxMorale() end

---Gets the max power of the mount.
---@return number #The max power of the mount.
function CombatMount:GetMaxPower() end

---Gets the maximum temporary morale of the mount.
---@return number #The maximum temporary morale of the mount.
function CombatMount:GetMaxTemporaryMorale() end

---Gets the max temporary power of the mount.
---@return number #The max temporary power of the mount.
function CombatMount:GetMaxTemporaryPower() end

---Gets the current morale of the mount.
---@return number #The current morale of the mount.
function CombatMount:GetMorale() end

---Gets the current power of the mount.
---@return number #The current power of the mount.
function CombatMount:GetPower() end

---Gets the modified strength of the player.
---@return number #The modified strength of the player.
function CombatMount:GetStrength() end

---Gets the temporary morale of the mount.
---@return number #The temporary morale of the mount.
function CombatMount:GetTemporaryMorale() end

---Gets the temporary power of the mount.
---@return number #The temporary power of the mount.
function CombatMount:GetTemporaryPower() end


---A crafting tier.
---@class CraftTier
CraftTier = {
	-- An undefined profession.
	Undefined = 0,
	-- Apprentice level.
	Apprentice = 1,
	-- Journeyman level.
	Journeyman = 2,
	-- Expert level.
	Expert = 3,
	-- Artisan level.
	Artisan = 4,
	-- Master level.
	Master = 5,
	-- Supreme level.
	Supreme = 6,
	-- Westfold level.
	Westfold = 7,
	-- Eastemnet level.
	Eastemnet = 8,
	-- Westemnet level.
	Westemnet = 8,
}


---Represents an effect that can be applied to an entity.
---@class Effect : Object
Effect = {}

---Gets the category of the effect.
---@return number #
function Effect:GetCategory() end

---Gets the description of the effect.
---@return string #Thedescription of the effect.
function Effect:GetDescription() end

---Gets the duration of the effect.
---@return number #The duration of the effect.
function Effect:GetDuration() end

---Gets a unique ID for the effect.
---@return number #A unique ID for the effect.
function Effect:GetID() end

---Gets the icon for the effect.
---@return number #The icon id for the effect.
function Effect:GetIcon() end

---Gets the name of the effect.
---@return string #The name of the effect.
function Effect:GetName() end

---Gets the time the effect started.
---@return number #The time the effect started.
function Effect:GetStartTime() end

---Gets a flag indicating if the effect is a curable.
---@return boolean #True if the effect is curable.
function Effect:IsCurable() end

---Gets a flag indicating if the effect is a debuff.
---@return boolean #True if the effect is curable.
function Effect:IsDebuff() end

---Gets a flag indicating if the effect is a dispellable effect.
---@return boolean #True if the effect is dispellable.
function Effect:IsDispellable() end


---Describes the category of an effect.
---@class EffectCategory
EffectCategory = {
	-- An undefined category.
	Undefined = 0,
	-- A disease effect.
	Disease = 2,
	-- A physical effect.
	Physical = 4,
	-- A wound effect.
	Wound = 8,
	-- A cry effect.
	Cry = 16,
	-- A song effect.
	Song = 32,
	-- A fear effect.
	Fear = 64,
	-- A poison effect.
	Poison = 128,
	-- An elemental effect.
	Elemental = 512,
	-- A corruption effect.
	Corruption = 1024,
	-- A dispellable effect.
	Dispellable = 1226,
}


---A utility class used by Actors to hold the list of effects.
---@class EffectList : Object
EffectList = {}

---Test if the list contains the specified effect.
---@param value Effect The effect to test for.
---@return boolean #True if the effects list contains the effect.
function EffectList:Contains(value) end

---Gets an effect.
---@param index number The index of the effect to get.
---@return Effect #The effect at th specified index.
function EffectList:Get(index) end

---Gets the number of effects in the list.
---@return number #The number of effects in the list
function EffectList:GetCount() end

---Gets the index of an effect in the list.
---@param value Effect The effect to get the index of.
---@return number #The index of the effect or -1 if it is not in the list.
function EffectList:IndexOf(value) end


---Base class for any entity in the game.
---@class Entity : PropertyHandler
Entity = {}

---Gets the name of the entity.
---@return string #The name of the entity.
function Entity:GetName() end

---Returns true if this entity is the local player entity. (Deprecated).
---@return boolean #Whether this is the local player entity or not.
function Entity:IsLocalPlayer() end


---@class EntityReference : Object
EntityReference = {}


---Provides access to a player's equipment.
---@class Equipment : Object
Equipment = {
	-- An undefined equipment slot.
	Undefined = 0,
	-- The head equipment slot.
	Head = 1,
	-- The chest equipment slot.
	Chest = 2,
	-- The legs equipment slot.
	Legs = 3,
	-- The gloves equipment slot.
	Gloves = 4,
	-- The boots equipment slot.
	Boots = 5,
	-- The shoulder equipment slot.
	Shoulder = 6,
	-- The back equipment slot.
	Back = 7,
	-- The bracelet 1 equipment slot.
	Bracelet1 = 8,
	-- The bacelet 2 equipment slot.
	Bracelet2 = 9,
	-- The necklace equipment slot.
	Necklace = 10,
	-- The ring 1 equipment slot.
	Ring1 = 11,
	-- The ring 2 equipment slot.
	Ring2 = 12,
	-- The earring 1 equipment slot.
	Earring1 = 13,
	-- The earring 2 equipment slot.
	Earring2 = 14,
	-- The pocket equipment slot.
	Pocket = 15,
	-- The primary weapon equipment slot.
	PrimaryWeapon = 16,
	-- The secondary weapon equipment slot.
	SecondaryWeapon = 17,
	-- The shield equipment slot.
	Shield = 17,
	-- The instrument equipment slot.
	Instrument = 18,
	-- The ranged weapon equipment slot.
	RangedWeapon = 18,
	-- The craft tool equipment slot.
	CraftTool = 19,
	-- The class equipment slot.
	Class = 20,
}

---Gets and item from the player's backpack.
---@param index number The index of the item to get.
---@return Item #Either nil if there is no item there or the index is invalid, or the Item that is in the given index.
function Equipment:GetItem(index) end

---Gets the number of items that can be equipped.
---@return number #The number of items that can be equipped.
function Equipment:GetSize() end


---Information about a gambit skill.
---@class GambitSkill : Skill
GambitSkill = {}


---Information about a gambit skill.
---@class GambitSkillInfo : SkillInfo
GambitSkillInfo = {}

---Gets the required gambit at the specified index.
---@param index number 
---@return number #The required gambit at the specified index.
function GambitSkillInfo:GetGambit(index) end

---Gets the number of gambits required to use the gambit skill.
---@return number #The number of gambits required to use the gambit skill.
function GambitSkillInfo:GetGambitCount() end


---An item that a user can have.
---@class Item : Entity
Item = {}

---Gets information about the item.
---@return ItemInfo #Information about the item.
function Item:GetItemInfo() end


---Describes the category of an item.
---@class ItemCategory
ItemCategory = {
	-- An undefined category.
	Undefined = 0,
	-- Category for a bow.
	Bow = 1,
	-- Category for a treasure.
	Treasure = 2,
	-- Category for a chest.
	Chest = 3,
	-- Category for a minstrel item.
	Minstrel = 4,
	-- Category for equipment for the hands.
	Hands = 5,
	-- Category for shoulder equipment.
	Shoulders = 6,
	-- Category for equipment for the head.
	Head = 7,
	-- Category for mounts.
	Mounts = 8,
	-- Category for a pennant.
	Pennant = 9,
	-- Category for a dagger.
	Dagger = 10,
	-- Category for an instrument.
	Instrument = 11,
	-- Category for an axe.
	Axe = 12,
	-- Category for a captain item.
	Captain = 13,
	-- Category for an oil.
	Oil = 14,
	-- Category for equipment for the legs.
	Legs = 15,
	-- Category for an effect.
	Effect = 16,
	-- Category for a hunter item.
	Hunter = 17,
	-- Category for an armor item.
	Armor = 18,
	-- Category for a loremaster item.
	Loremaster = 19,
	-- Category for a trap.
	Trap = 20,
	-- Category for a decoration.
	Decoration = 21,
	-- Category for a champion item.
	Champion = 22,
	-- Category for foot equipment.
	Feet = 23,
	-- Category for a hammer.
	Hammer = 24,
	-- Category for a healing item.
	Healing = 25,
	-- Category for a guardian item.
	Guardian = 26,
	-- Category for a quest item.
	Quest = 27,
	-- Category for a potion.
	Potion = 28,
	-- Category for a crossbow.
	Crossbow = 29,
	-- Category for a mace.
	Mace = 30,
	-- Category for a key.
	Key = 31,
	-- Category for a tool.
	Tool = 32,
	-- Category for a shield.
	Shield = 33,
	-- Category for a staff.
	Staff = 34,
	-- Category for a crafting item.
	Crafting = 35,
	-- Category for a halberd.
	Halberd = 36,
	-- Category for a recipe component.
	Component = 37,
	-- Category for an ingredient.
	Ingredient = 38,
	-- Category for clothing.
	Clothing = 39,
	-- Category for a club.
	Club = 40,
	-- Category for a dye.
	Dye = 41,
	-- Category for a weapon.
	Weapon = 42,
	-- Category for a kinship charter.
	KinshipCharter = 43,
	-- Category for a sword.
	Sword = 44,
	-- Category for equipment for the back.
	Back = 45,
	-- Category for a spear.
	Spear = 46,
	-- Category for a trophy.
	Trophy = 47,
	-- Category for a burglar item.
	Burglar = 48,
	-- Category for a Jewelry item.
	Jewelry = 49,
	-- Category for a device.
	Device = 50,
	-- Category for a relic.
	Relic = 51,
	-- Category for a book.
	Book = 52,
	-- Category for a non-inventory item.
	NonInventory = 53,
	-- Category for a thrown item.
	Thrown = 54,
	-- Category for food.
	Food = 55,
	-- Category for a resource.
	Resource = 56,
	-- Category for a scroll.
	Scroll = 57,
	-- Category for an apprentice tailor scroll.
	ApprenticeTailorScroll = 58,
	-- Category for an apprentice jeweller scroll.
	ApprenticeJewellerScroll = 59,
	-- Category for an apprentice prospecting scroll.
	ApprenticeProspectingScroll = 60,
	-- Category for an apprentice farmer scroll.
	ApprenticeFarmerScroll = 61,
	-- Category for an apprentice scholar scroll.
	ApprenticeScholarScroll = 62,
	-- Category for an apprentice forestry scroll.
	ApprenticeForestryScroll = 63,
	-- Category for an apprentice metalwork scroll.
	ApprenticeMetalworkScroll = 64,
	-- Category for an apprentice cook scroll.
	ApprenticeCookScroll = 65,
	-- Category for an apprentice weaponsmith scroll.
	ApprenticeWeaponsmithScroll = 66,
	-- Category for an apprentice woodwork scroll.
	ApprenticeWoodworkScroll = 67,
	-- Category for a music decoration item.
	MusicDecoration = 82,
	-- Category for a surface paint decoration.
	SurfacePaintDecoration = 83,
	-- Category for a trophy decoration.
	TrophyDecoration = 84,
	-- Category for furniture decorations.
	FurnitureDecoration = 85,
	-- Category for floor decorations.
	FloorDecoration = 86,
	-- Category for a yard decoration.
	YardDecoration = 87,
	-- Category for a wall decoration.
	WallDecoration = 88,
	-- Category for a reputation item.
	Reputation = 89,
	-- Category for an implement.
	Implement = 91,
	-- Category for cosmetic held items.
	CosmeticHeld = 96,
	-- Category for cosmetic equipment for the back.
	CosmeticBack = 97,
	-- Category for special decorations.
	SpecialDecoration = 98,
	-- Category for ceiling decorations.
	CeilingDecoration = 99,
	-- Category for fishing bait.
	FishingBait = 100,
	-- Category for other fishing items.
	FishingOther = 101,
	-- Category for a fish.
	Fish = 102,
	-- Category for a fishing pole.
	FishingPole = 103,
	-- Category for an orb.
	Orb = 104,
	-- Category for a warden item.
	Warden = 105,
	-- Category for a runekeeper item.
	Runekeeper = 106,
	-- Category for a legendary weapon experience item.
	LegendaryWeaponExperience = 107,
	-- Category for a legendary weapon reset item.
	LegendaryWeaponReset = 108,
	-- Category for a deconstructable item.
	Deconstructable = 109,
	-- Category for a javelin.
	Javelin = 110,
	-- Category for a guardian belt.
	GuardianBelt = 111,
	-- Category for a journeyman cook scroll.
	JourneymanCookScroll = 113,
	-- Category for an expert cook scroll.
	ExpertCookScroll = 114,
	-- Category for an artisan cook scroll.
	ArtisanCookScroll = 115,
	-- Category for a master cook scroll.
	MasterCookScroll = 116,
	-- Category for a supreme cook scroll.
	SupremeCookScroll = 117,
	-- Category for a master woodwork scroll.
	MasterWoodworkScroll = 118,
	-- Category for a master weaponsmith scroll.
	MasterWeaponsmithScroll = 119,
	-- Category for an artisan tailor scroll.
	ArtisanTailorScroll = 120,
	-- Category for an expert farmer scroll.
	ExpertFarmerScroll = 121,
	-- Category for a journeyman forestry scroll.
	JourneymanForestryScroll = 122,
	-- Category for a supreme woodwork scroll.
	SupremeWoodworkScroll = 123,
	-- Category for a supreme weaponsmith scroll.
	SupremeWeaponsmithScroll = 124,
	-- Category for a master tailor scroll.
	MasterTailorScroll = 125,
	-- Category for an artisan farmer scroll.
	ArtisanFarmerScroll = 126,
	-- Category for an expert forestry scroll.
	ExpertForestryScroll = 127,
	-- Category for a supreme tailor scroll.
	SupremeTailorScroll = 128,
	-- Category for a master farmer scroll.
	MasterFarmerScroll = 129,
	-- Category for an artisan forestry scroll.
	ArtisanForestryScroll = 130,
	-- Category for a supreme farmer scroll.
	SupremeFarmerScroll = 131,
	-- Category for a master forestry scroll.
	MasterForestryScroll = 132,
	-- Category for a supreme forestry scroll.
	SupremeForestryScroll = 133,
	-- Category for a journeyman prospecting scroll.
	JourneymanProspectingScroll = 134,
	-- Category for an expert prospecting scroll.
	ExpertProspectingScroll = 135,
	-- Category for an artisan prospecting scroll.
	ArtisanProspectingScroll = 136,
	-- Category for a master prospecting scroll.
	MasterProspectingScroll = 137,
	-- Category for a supreme prospecting scroll.
	SupremeProspectingScroll = 138,
	-- Category for a journeyman scholar scroll.
	JourneymanScholarScroll = 139,
	-- Category for an expert scholar scroll.
	ExpertScholarScroll = 140,
	-- Category for a journeyman metalwork scroll.
	JourneymanMetalworkScroll = 141,
	-- Category for an artisan scholar scroll.
	ArtisanScholarScroll = 142,
	-- Category for a journeyman jeweller scroll.
	JourneymanJewellerScroll = 143,
	-- Category for an expert metalwork scroll.
	ExpertMetalworkScroll = 144,
	-- Category for a master scholar scroll.
	MasterScholarScroll = 145,
	-- Category for an expert jeweller scroll.
	ExpertJewellerScroll = 146,
	-- Category for a journeyman woodwork scroll.
	JourneymanWoodworkScroll = 147,
	-- Category for a journeyman weaponsmith scroll.
	JourneymanWeaponsmithScroll = 148,
	-- Category for an artisan metalwork scroll.
	ArtisanMetalworkScroll = 149,
	-- Category for a supreme scholar scroll.
	SupremeScholarScroll = 150,
	-- Category for an artisan jeweller scroll.
	ArtisanJewellerScroll = 151,
	-- Category for an expert woodwork scroll.
	ExpertWoodworkScroll = 152,
	-- Category for an expert weaponsmith scroll.
	ExpertWeaponsmithScroll = 153,
	-- Category for a master metalwork scroll.
	MasterMetalworkScroll = 154,
	-- Category for a journeyman tailor scroll.
	JourneymanTailorScroll = 155,
	-- Category for a master jeweller scroll.
	MasterJewellerScroll = 156,
	-- Category for an artisan woodwork scroll.
	ArtisanWoodworkScroll = 157,
	-- Category for an artisan weaponsmith scroll.
	ArtisanWeaponsmithScroll = 158,
	-- Category for a supreme metalwork scroll.
	SupremeMetalworkScroll = 159,
	-- Category for an expert tailor scroll.
	ExpertTailorScroll = 160,
	-- Category for a supreme jeweller scroll.
	SupremeJewellerScroll = 161,
	-- Category for a journeyman farmer scroll.
	JourneymanFarmerScroll = 162,
	-- Category for a minstrel book.
	MinstrelBook = 163,
	-- Category for a misc item.
	Misc = 164,
	-- Category for a legendary weapon replace legacy item.
	LegendaryWeaponReplaceLegacy = 166,
	-- Category for a legendary weapon increase max level item.
	LegendaryWeaponIncreaseMaxLevel = 167,
	-- Category for a legendary weapon upgrade legacy item.
	LegendaryWeaponUpgradeLegacy = 168,
	-- Category for a crafting trophy.
	CraftingTrophy = 170,
	-- Category for loremaster food items.
	LoremasterFood = 171,
	-- Category for a special trophy.
	SpecialTrophy = 172,
	-- Category for special item.
	Special = 173,
	-- Category for a social item.
	Social = 174,
	-- Category for a map.
	Map = 175,
	-- Category for a legendary weapon increase item level item.
	LegendaryWeaponIncreaseItemLevel = 176,
	-- Category for a skirmish item.
	Skirmish = 177,
	-- Category for a barter item.
	Barter = 178,
	-- Category for a shieldspike.
	Shieldspike = 179,
	-- Category for cosmetic equipment for the feet.
	CosmeticFeet = 180,
	-- Category for cosmetic equipment for the shoulders.
	CosmeticShoulders = 181,
	-- Category for cosmetic equipment for the chest.
	CosmeticChest = 182,
	-- Category for cosmetic equipment for the head.
	CosmeticHead = 183,
	-- Category for cosmetic equipment for the hands.
	CosmeticHands = 184,
	-- Category for cosmetic equipment for the legs.
	CosmeticLegs = 185,
	-- Category for a horn.
	Horn = 187,
	-- Category for an optional ingredient.
	OptionalIngredient = 188,
	-- Category for a perk.
	Perk = 189,
	-- Category for a tome.
	Tome = 190,
	-- Category for a travel.
	Travel = 191,
	-- Category for cosmetic equipment for a class.
	CosmeticClass = 192,
	-- Category for a legendary weapon legacy reveal item.
	LegendaryWeaponLegacyReveal = 193,
	-- Category for a legendary weapon unslot relics item.
	LegendaryWeaponUnslotRelics = 194,
	-- Category for a Westfold metalwork scroll.
	WestfoldMetalworkScroll = 195,
	-- Category for a Westfold jeweller scroll.
	WestfoldJewellerScroll = 196,
	-- Category for a Westfold woodwork scroll.
	WestfoldWoodworkScroll = 197,
	-- Category for a Westfold weaponsmith scroll.
	WestfoldWeaponsmithScroll = 198,
	-- Category for a Westfold tailor scroll.
	WestfoldTailorScroll = 199,
	-- Category for a Westfold farmer scroll.
	WestfoldFarmerScroll = 200,
	-- Category for a Westfold forestry scroll.
	WestfoldForestryScroll = 201,
	-- Category for a Westfold prospecting scroll.
	WestfoldProspectingScroll = 202,
	-- Category for a Westfold cook scroll.
	WestfoldCookScroll = 203,
	-- Category for a Westfold scholar scroll.
	WestfoldScholarScroll = 204,
	-- Category for a festival item.
	Festival = 205,
	-- Category for a legendary weapon add legacy item.
	LegendaryWeaponAddLegacy = 206,
}


---Describes the durability of an item.
---@class ItemDurability
ItemDurability = {
	-- An undefined durability.
	Undefined = 0,
	-- An item that is of substantial durability.
	Substantial = 1,
	-- An item that is of brittle durability.
	Brittle = 2,
	-- An item that is of average durability.
	Normal = 3,
	-- An item that is of tough durability.
	Tough = 4,
	-- An item that is flimsy durability.
	Flimsy = 5,
	-- An item that is indestructible.
	Indestructible = 6,
	-- An item that is durability.
	Weak = 7,
}


---Container for various item information.
---@class ItemInfo : Object
ItemInfo = {}

---Gets the image ID for the background of the item.
---@return number #
function ItemInfo:GetBackgroundImageID() end

---Gets the category of the item.
---@return number #The category of the item.
function ItemInfo:GetCategory() end

---Gets the description of the item.
---@return string #The description of the item.
function ItemInfo:GetDescription() end

---Gets the durability of the item.
---@return number #A value from ItemDurability representing the durability of the item.
function ItemInfo:GetDurability() end

---Gets the image ID for the icon of the item.
---@return number #
function ItemInfo:GetIconImageID() end

---Gets the maximum number of instances that can be contained at one time.
---@return number #The maximum number of instances that can be contained at one time.
function ItemInfo:GetMaxQuantity() end

---Gets the maximum number of instances that can be stacked together.
---@return number #The maximum number of instances that can be stacked together.
function ItemInfo:GetMaxStackSize() end

---Gets the name of the item.
---@return string #The name of the item.
function ItemInfo:GetName() end

---Gets the name of the item including quantity information.
---@param quantity number 
---@return string #The name of the item including quantity information.
function ItemInfo:GetNameWithQuantity(quantity) end

---Gets the quality of the item.
---@return number #A value from ItemQuality representing the quality of the item.
function ItemInfo:GetQuality() end

---Gets the image ID for the quality of the item.
---@return number #
function ItemInfo:GetQualityImageID() end

---Gets the image ID for the shadow of the item.
---@return number #
function ItemInfo:GetShadowImageID() end

---Gets the image ID for the underlay of the item.
---@return number #
function ItemInfo:GetUnderlayImageID() end

---Gets a flag indicating if the item is considered magical.
---@return boolean #A flag indicating if the item is considered magical.
function ItemInfo:IsMagic() end

---Gets a flag indicating if the item is unique.
---@return boolean #A flag indicating if the item is unique.
function ItemInfo:IsUnique() end


---Describes the quality of an item.
---@class ItemQuality
ItemQuality = {
	-- An item with no defined quality.
	Undefined = 0,
	-- An item that is legendary.
	Legendary = 1,
	-- An item that is rare.
	Rare = 2,
	-- An item that is incomparable.
	Incomparable = 3,
	-- An item that is uncommon.
	Uncommon = 4,
	-- An item that is common.
	Common = 5,
}


---Describes the current wear state of an item.
---@class ItemWearState
ItemWearState = {
	-- An unknown wear state.
	Undefined = 0,
	-- A damaged wear state.
	Damaged = 1,
	-- A pristine wear state.
	Pristine = 2,
	-- A broken wear state.
	Broken = 3,
	-- A worn wear state.
	Worn = 4,
}


---A class that represents the local player.
---@class LocalPlayer : Player
LocalPlayer = {}

---Gets the general attributes of a player.
---@return Attributes #
function LocalPlayer:GetAttributes() end

---Gets the player's backpack.
---@return Backpack #The player's backpack.
function LocalPlayer:GetBackpack() end

---Gets attribute information specific to a class.
---@return Attributes #Attributes specified to the class.
function LocalPlayer:GetClassAttributes() end

---Gets the player's equipment.
---@return Equipment #The player's backpack.
function LocalPlayer:GetEquipment() end

---Gets the instance of the Local Player.
---@return LocalPlayer #The instance of the Local Player.
LocalPlayer.GetInstance = function () end

---Gets the player's mount.
---@return Mount #A reference to the player's current mount of nil if the player is not riding a mount.
function LocalPlayer:GetMount() end

---Gets attribute information specific to a race.
---@return Attributes #Attributes specified to the race.
function LocalPlayer:GetRaceAttributes() end

---Gets the ready state of a player based on the result of a ready check.
---@return number #Returns a value indicating the ready state of a player based on a ready check.
function LocalPlayer:GetReadyState() end

---Gets the player's shared storage.
---@return SharedStorage #The player's shared storage.
function LocalPlayer:GetSharedStorage() end

---Gets the list of trained skills.
---@return SkillList #The list of the trained skills.
function LocalPlayer:GetTrainedSkills() end

---Gets the list of untrained skills.
---@return SkillList #The list of the trained skills.
function LocalPlayer:GetUntrainedSkills() end

---Gets the player's vault.
---@return Vault #The player's vault.
function LocalPlayer:GetVault() end

---Gets the player's wallet.
---@return Wallet #The player's wallet.
function LocalPlayer:GetWallet() end

---Gets a flag indicating if the player is in combat.
---@return boolean #True if the player is in combat.
function LocalPlayer:IsInCombat() end

---Gets a flag indicating if the player is disconnected.
---@return boolean #A flag indicating if the player is disconnected. If this is ever true and the current player is the local player, please consult a physician, or a zombie master.
function LocalPlayer:IsLinkDead() end

---Gets a flag indicating if the player has voice communication enabled.
---@return boolean #A flag indicating if the player has voice communication enabled.
function LocalPlayer:IsVoiceEnabled() end


---Class representing an in game mount.
---@class Mount : Entity
Mount = {}

---Gets the name of the entity.
---@return string #The name of the entity.
function Mount:GetName() end


---This class provides access to party information. This is either your fellowship or your tribe depending on your alliance.
---@class Party : Object
Party = {}

---Gets the specified assist target.
---@param index number The index of the assist target to get.
---@return Player #The assist target at the specified index.
function Party:GetAssistTarget(index) end

---Gets the number of assist targets for the party.
---@return number #Returns the numbers of assist targets for the party.
function Party:GetAssistTargetCount() end

---Gets the leader of the fellowship.
---@return Player #The leader of the fellowship.
function Party:GetLeader() end

---Gets the specified member.
---@param index number The index of the member to get.
---@return Player #The member at the specified index.
function Party:GetMember(index) end

---Gets the number of members in the party.
---@return number #Returns the numbers of members in the party.
function Party:GetMemberCount() end

---Test if the given play is an assist target of this party.
---@param player Player The player to test.
---@return boolean #True if the player is an assist target of this party.
function Party:IsAssistTarget(player) end

---Test if the given play is a member of this party.
---@param player Player The player to test.
---@return boolean #True if the player is a member of this party.
function Party:IsMember(player) end


---@class PartyMember : Player
PartyMember = {}

---Gets the class of the player.
---@return number #The class of the player.
function PartyMember:GetClass() end

---Gets the level of the actor.
---@return number #The level of the actor. If this information is not available, an error will be raised.
function PartyMember:GetLevel() end

---Gets the name of the entity.
---@return string #The name of the entity.
function PartyMember:GetName() end

---Gets the party the player is a member of.
---@return Party #Returns the party the player is a member of. If the player is not currently in a party this will return nil.
function PartyMember:GetParty() end

---Gets the raid the player is a member of.
---@return Party #Returns the raid the player is a member of. If the player is not currently in a raid this will return nil.
function PartyMember:GetRaid() end

---Gets the ready state of a player based on the result of a ready check.
---@return number #Returns a value indicating the ready state of a player based on a ready check.
function PartyMember:GetReadyState() end

---Gets a flag indicating if the player is disconnected.
---@return boolean #A flag indicating if the player is disconnected. If this is ever true and the current player is the local player, please consult a physician, or a zombie master.
function PartyMember:IsLinkDead() end

---Gets a flag indicating if the player has voice communication enabled.
---@return boolean #A flag indicating if the player has voice communication enabled.
function PartyMember:IsVoiceEnabled() end


---A pet is an actor that a player owns and controls.
---@class Pet : Actor
Pet = {}


---A class that represents a player in the game.
---@class Player : Actor
Player = {}

---Gets the alignment of the player.
---@return number #The alignment of the player.
function Player:GetAlignment() end

---Gets the class of the player.
---@return number #The class of the player.
function Player:GetClass() end

---Gets the party the player is a member of.
---@return Party #Returns the party the player is a member of. If the player is not currently in a party this will return nil.
function Player:GetParty() end

---Gets the pet of the player.
---@return Pet #The player's pet.
function Player:GetPet() end

---Gets the race of the player.
---@return number #The race of the player.
function Player:GetRace() end

---Gets the ready state of a player based on the result of a ready check.
---@return number #Returns a value indicating the ready state of a player based on a ready check.
function Player:GetReadyState() end

---Gets a flag indicating if the player is disconnected.
---@return boolean #A flag indicating if the player is disconnected. If this is ever true and the current player is the local player, please consult a physician, or a zombie master.
function Player:IsLinkDead() end

---Gets a flag indicating if the player is currently transmitting voice data.
---@return boolean #A flag indicating if the player is currently transmitting voice data.
function Player:IsVoiceActive() end

---Gets a flag indicating if the player has voice communication enabled.
---@return boolean #A flag indicating if the player has voice communication enabled.
function Player:IsVoiceEnabled() end


---A profession a free people player can have.
---@class Profession
Profession = {
	-- An undefined profession.
	Undefined = 0,
	-- A metalsmith.
	Metalsmith = 1,
	-- A forester.
	Forester = 2,
	-- A scholar.
	Scholar = 3,
	-- A jeweller.
	Jeweller = 4,
	-- A tailor.
	Tailor = 5,
	-- A weaponsmith.
	Weaponsmith = 6,
	-- A propspector.
	Prospector = 7,
	-- A woodworker.
	Woodworker = 8,
	-- A farmer.
	Farmer = 9,
	-- A cook.
	Cook = 10,
}


---Information about a profession.
---@class ProfessionInfo : Object
ProfessionInfo = {}

---Gets the current mastery experience earned for the profession.
---@return number #The current mastery experience earned for the profession.
function ProfessionInfo:GetMasteryExperience() end

---Gets the target mastery experience for the profession.
---@return number #The target mastery experience for the profession.
function ProfessionInfo:GetMasteryExperienceTarget() end

---Gets the current mastery level of the profession.
---@return number #The current mastery level of the profession.
function ProfessionInfo:GetMasteryLevel() end

---Gets the current mastery title of the profession.
---@return string #The current mastery title of the profession.
function ProfessionInfo:GetMasteryTitle() end

---Gets the name of the profession.
---@return string #The name of the profession.
function ProfessionInfo:GetName() end

---Gets the current proficiency experience earned for the profession.
---@return number #The current proficiency experience earned for the profession.
function ProfessionInfo:GetProficiencyExperience() end

---Gets the target proficiency experience for the profession.
---@return number #The target proficiency experience for the profession.
function ProfessionInfo:GetProficiencyExperienceTarget() end

---Gets the current proficiency level of the profession.
---@return number #The current proficiency level of the profession.
function ProfessionInfo:GetProficiencyLevel() end

---Gets the current proficiency title of the profession.
---@return string #The current proficiency title of the profession.
function ProfessionInfo:GetProficiencyTitle() end

---Gets the specified recipes for this profession.
---@param index number 
---@return Recipe #The specified recipes for this profession.
function ProfessionInfo:GetRecipe(index) end

---Gets the number of recipes the player knows for this profession.
---@return number #The number of recipes the player knows for this profession.
function ProfessionInfo:GetRecipeCount() end


---@class PropertyHandler : EntityReference
PropertyHandler = {}


---The Race of a player.
---@class Race
Race = {
	-- An undefined Race.
	Undefined = 0,
	-- Man race.
	Man = 23,
	-- Elf race.
	Elf = 65,
	-- Dwarf race.
	Dwarf = 73,
	-- Hobbit race.
	Hobbit = 81,
	-- Beorning race.
	Beorning = 114,
	-- High Elf race.
	HighElf = 117,
	-- Dwarf Stout-axe race.
	StoutAxe = 120,
}


---The ready state of a player.
---@class ReadyState
ReadyState = {
	-- An unset set.
	Unset = 0,
	-- Ready state.
	Ready = 1,
	-- Not ready state.
	NotReady = 2,
}


---Information about a recipe.
---@class Recipe : Object
Recipe = {}

---Gets the base chance to crit when crafting this recipe.
---@return number #The base chance to crit when crafting this recipe.
function Recipe:GetBaseCriticalSuccessChance() end

---Gets the category of the recipe.
---@return number #The category of the recipe.
function Recipe:GetCategory() end

---Gets the name of category of the recipe.
---@return string #The name of category of the recipe.
function Recipe:GetCategoryName() end

---Gets the cooldown between using this recipe.
---@return number #The cooldown between using this recipe.
function Recipe:GetCooldown() end

---Gets the item information for the item crafted by this recipe when the player crits.
---@return ItemInfo #The item information for the item crafted by this recipe when the player crits.
function Recipe:GetCriticalResultItemInfo() end

---Gets the quantity of the critical result item actually crafted when the player crits.
---@return number #The quantity of the critical result item actually crafted when the player crits.
function Recipe:GetCriticalResultItemQuantity() end

---Gets the amount of crafting experience rewarded for crafting this recipe.
---@return number #The amount of crafting experience rewarded for crafting this recipe.
function Recipe:GetExperienceReward() end

---Gets the information for the specified ingredient.
---@param index number The index of the ingredient to get the information of.
---@return RecipeIngredient #The information for the specified ingredient.
function Recipe:GetIngredient(index) end

---Gets the number of ingredients required for the recipe.
---@return number #The number of ingredients required for the recipe.
function Recipe:GetIngredientCount() end

---Gets the recipe ingredient information for an ingredient pack that can be used instead of the recipe ingredients.
---@return RecipeIngredient #The recipe ingredient information for an ingredient pack that can be used instead of the recipe ingredients.
function Recipe:GetIngredientPack() end

---Gets the name of the recipe.
---@return string #The name of the recipe.
function Recipe:GetName() end

---Gets the information for the specified optional ingredient.
---@param index number The index of the optional ingredient to get the information of.
---@return RecipeIngredient #The information for the specified optional ingredient.
function Recipe:GetOptionalIngredient(index) end

---Gets the number of optional ingredients for the recipe.
---@return number #The number of optional ingredients for the recipe.
function Recipe:GetOptionalIngredientCount() end

---Gets the profession of the recipe.
---@return number #The profession of the recipe.
function Recipe:GetProfession() end

---Gets the item information for the item crafted by this recipe.
---@return ItemInfo #The item information for the item crafted by this recipe.
function Recipe:GetResultItemInfo() end

---Gets the quantity of the result item actually crafted.
---@return number #The quantity of the result item actually crafted.
function Recipe:GetResultItemQuantity() end

---Gets the tier of the recipe.
---@return number #The tier of the recipe.
function Recipe:GetTier() end

---Gets if the recipe supports critical result items.
---@return boolean #True if the recipe supports critical result items.
function Recipe:HasCriticalResultItem() end

---Gets a flag indicating if the recipe is a single use recipe.
---@return boolean #True if the recipe is a single use recipe.
function Recipe:IsSingleUse() end


---Information about a recipe ingredient.
---@class RecipeIngredient : Object
RecipeIngredient = {}

---Gets the critical chance this ingredient adds when used as part of a recipe.
---@return number #The critical chance this ingredient adds when used as part of a recipe.
function RecipeIngredient:GetCriticalChanceBonus() end

---Gets the item information for the ingredient.
---@return ItemInfo #The item information for the ingredient.
function RecipeIngredient:GetItemInfo() end

---Gets the quantity required for the recipe.
---@return number #The quantity required for the recipe.
function RecipeIngredient:GetRequiredQuantity() end


---A bank that represents the player's shared storage. This storage is available to all characters on the same account.
---@class SharedStorage : Bank
SharedStorage = {}


---Information about a skill.
---@class Skill : Object
Skill = {}

---Gets information about the skill.
---@return SkillInfo #Information about the skill.
function Skill:GetSkillInfo() end


---Information about a skill.
---@class SkillInfo : Object
SkillInfo = {}

---Gets the description of the item.
---@return string #The description of the item.
function SkillInfo:GetDescription() end

---Gets the image ID for the icon of the item.
---@return number #The ID for the skill icon.
function SkillInfo:GetIconImageID() end

---Gets the name of the item.
---@return string #The name of the item.
function SkillInfo:GetName() end

---Gets the type of the skill.
---@return number #The type of the skill.
function SkillInfo:GetType() end


---A list of skills.
---@class SkillList : Object
SkillList = {}

---Gets the number of skills in the list.
---@return number #The number of skills in the list.
function SkillList:GetCount() end

---Gets a skill from the list.
---@param index number The index of the skill to get.
---@return Skill #The skill at the specified index.
function SkillList:GetItem(index) end


---A type of skill.
---@class SkillType
SkillType = {
	-- A standard skill.
	Normal = 0,
	-- A mount skill.
	Mount = 1,
	-- A gambit skill.
	Gambit = 2,
}


---Information about a skill the player has not trained yet.
---@class UntrainedSkill : Skill
UntrainedSkill = {}

---Gets the cost to purchase the skill.
---@return number #The cost to purchase the skill.
function UntrainedSkill:GetPrice() end

---Gets the required level necessary to purchase the skill.
---@return number #The required level necessary to purchase the skill.
function UntrainedSkill:GetRequiredLevel() end

---Gets the required rank necessary to purchase the skill.
---@return number #The required rank necessary to purchase the skill.
function UntrainedSkill:GetRequiredRank() end


---A bank that represents the player's vault storage. This storage is only available to the current logged in character.
---@class Vault : Bank
Vault = {}


---The vocation of a free people player.
---@class Vocation
Vocation = {
	-- No vocation.
	None = 0,
	-- An explorer.
	Explorer = 1,
	-- A tinker.
	Tinker = 2,
	-- A yeoman.
	Yeoman = 3,
	-- A historian.
	Historian = 4,
	-- An armsman.
	Armsman = 5,
	-- A woodsman.
	Woodsman = 6,
	-- An armorer.
	Armorer = 7,
}


---Provides access to a player's wallet.
---@class Wallet : Object
Wallet = {}

---Gets a wallet item from the player's wallet.
---@param index number The index of the item to get.
---@return WalletItem #The WalletItem at the specified index..
function Wallet:GetItem(index) end

---Gets the number of items in the player's wallet.
---@return number #The number of items in the player's wallet.
function Wallet:GetSize() end


---An item that is contained in a user's wallet.
---@class WalletItem : Object
WalletItem = {}

---Gets the description of the wallet item.
---@return string #The description of the wallet item.
function WalletItem:GetDescription() end

---Gets the image used to identity the wallet item.
---@return any #The image used to identity the wallet item.
function WalletItem:GetImage() end

---Gets the maximum quantity of this wallet item that a player can have.
---@return number #The maximum quantity of this wallet item that a player can have.
function WalletItem:GetMaxQuantity() end

---Gets the name of the wallet item.
---@return string #The name of the wallet item.
function WalletItem:GetName() end

---Gets the quantity of the wallet item that the player has.
---@return number #The quantity of the wallet item that the player has.
function WalletItem:GetQuantity() end

---Gets the small image used to identity the wallet item.
---@return any #The small image used to identity the wallet item.
function WalletItem:GetSmallImage() end

---Gets a flag indicating if the item is shared across all characters of an account.
---@return boolean #A flag indicating if the item is shared across all characters of an account.
function WalletItem:IsAccountItem() end


---Defines the client languages.
---@class Language
Language = {
	-- Invalid.
	Invalid = 0,
	-- English.
	English = 2,
	-- English GB.
	EnglishGB = 268435457,
	-- French.
	French = 268435459,
	-- German.
	German = 268435460,
	-- Russian - deprecated.
	Russian = 268435463,
}


---Provides access to plugin management methods.
---@class LotroPluginManager : PluginManager
LotroPluginManager = {}

---Displays the options panel for the specified plugin.
---@param plugin Plugin 
LotroPluginManager.ShowOptions = function (plugin) end


---The base object class for API classes.
---@class Object
Object = {}

---Initializes a new Object
---`Object()` : Initializes a new Object
---@return Object
Turbine.Object = function () end


---Provides information about a specific plugin that has been loaded.
---@class Plugin : Object
Plugin = {}

---Gets the author of the plugin.
---@return string #The author of the plugin.
function Plugin:GetAuthor() end

---Gets the plugin configuration information.
---@return Object #The plugin's configuration.
function Plugin:GetConfiguration() end

---Gets the name of the plugin.
---@return string #The name of the plugin.
function Plugin:GetName() end

---Gets the version of the plugin.
---@return string #The version of the plugin.
function Plugin:GetVersion() end


---Provides the ability to save and load plugin data.
---@class PluginData
PluginData = {}

---Loads plugin data from a given key.
---@param dataScope number The scope of the data. Data scope can be specified to an Account, a Server, or to a specific Character.
---@param key string The key the data is stored under.
---@param dataLoadEventHandler Object A function that is called when the data loaded.
---@return Object #The loaded data. If the data does not exist, this will simply return nil.
PluginData.Load = function (dataScope, key, dataLoadEventHandler) end

---Saves plugin data under a given key.
---@param dataScope number The scope of the data. This specifies the level of availability of this data when loading. Data scope can be specified to an Account, a Server, or to a specific Character.
---@param key string The key to store the data under.
---@param data Object The data to save.
---@param saveCompleteEventHandler Object Event handler called when the data is saved. It has two arguments, the first specifies if the save succeeded and the second is a message if it failed.
PluginData.Save = function (dataScope, key, data, saveCompleteEventHandler) end


---Provides access to plugin management methods.
---@class PluginManager
PluginManager = {}

---Gets the plugins that are currently available.
---@return Object #Returns a table containing the plugins that are currently available.
PluginManager.GetAvailablePlugins = function () end

---Gets the plugins that are currently loaded.
---@return Object #Returns a table containing the currently loaded plugins
PluginManager.GetLoadedPlugins = function () end

---Loads the plugin that is requested.
---@param pluginName string The name of the plugin to load as specified in its plugin definition file.
PluginManager.LoadPlugin = function (pluginName) end

---Refreshes the list of available plugins.
PluginManager.RefreshAvailablePlugins = function () end

---Unloads the script state specified.
---@param scriptState string The name of the script state to be unloaded.
PluginManager.UnloadScriptState = function (scriptState) end


---Provides programmer extensibility to the chat window.
---@class Shell
Shell = {}

---Adds a command that can be executed.
---@param name string The name of the command that can be execute. Multiple names can be specified by separating them using a semicolon ';'.
---@param shellCommand ShellCommand The shell command to bind to the names.
---@return number #The number of names from the name argument that were successful registered.
Shell.AddCommand = function (name, shellCommand) end

---Gets the list of commands available by the shell.
---@return string #The list of available commands that can be executed.
Shell.GetCommands = function () end

---Test if the specified name is a registered shell command.
---@param name string The name of the command to check for the existence of.
---@return boolean #True if the command is registered.
Shell.IsCommand = function (name) end

---Removes a command that has been added using AddCommand.
---@param shellCommand ShellCommand The shell command to unregister. This removes the registration from all the names that use the shell command.
---@return number #
Shell.RemoveCommand = function (shellCommand) end

---Writes a line of text to the chat window.
---@param text string The text to display.
Shell.WriteLine = function (text) end


---A command that can be register for use in the chat window.
---@class ShellCommand
ShellCommand = {}

---Initializes a new ShellCommand
---`ShellCommand()` : Initializes a new ShellCommand
---@return ShellCommand
Turbine.ShellCommand = function () end

---Executes the command.
---@param argumentText string The arguments string passed along with the command.
function ShellCommand:Execute(argumentText) end

---Gets the help information for the command.
---@return string #The help information for the command.
function ShellCommand:GetHelp() end

---Gets a short help string for the command.
---@return string #A short help string for the command.
function ShellCommand:GetShortHelp() end


---The core UI package that allows users to create low level controls.
---@class UI
---@field BlendMode BlendMode Specifies a blending method.
---@field ContentAlignment ContentAlignment Specifies the alignment of content within a region.
---@field Display Display Provides display information.
---@field DragDropInfo DragDropInfo Container for information about drag drop events.
---@field FontStyle FontStyle Specifies styles that can be applied to fonts.
---@field HorizontalLayout HorizontalLayout Specifies how to perform horizontal layouts.
---@field Lotro Lotro The Lord of the Rings UI package.
---@field MouseButton MouseButton Defines one of the mouse buttons.
---@field Orientation Orientation Specifies orientation of objects.
---@field VerticalLayout VerticalLayout Specifies how to perform vertical layouts.
UI = {}


---Specifies a blending method.
---@class BlendMode
BlendMode = {
	-- Performs a blend between a new color generated by applying the hue and saturation of the source and the color value of the destination. The new color and the destination color are then interpolated between using the source alpha.
	Color = 1,
	-- Uses the source color value.
	Normal = 2,
	-- Computes a new color by multiplying each color channel by the source color channel and then interpolating between the new color and the destination color based on the source alpha. Multiply will never brighten a pixel.
	Multiply = 3,
	-- Overlays the source over the destination using the source alpha to interpolate between the source and destination colors.
	AlphaBlend = 4,
	-- Overlays the source over the destination. If the source alpha is zero destination color will remain unchanged, for any other alpha value the source color replaces the destination.
	Overlay = 5,
	-- Compute a new color by copying the max of R,G, and B to all three color channels. This new color is then blended with the destination color based on the source alpha.
	Grayscale = 6,
	-- Compute a new color by multiplying the inverses of each color channel by the inverse of the source color channel and then inverting the result. The new color is then blended with the destination color based on the source alpha. Screen will never darken a pixel.
	Screen = 7,
	-- None.
	None = 8,
	-- Specifies no blending.
	Undefined = 8,
}


---A simple button control.
---@class Button : Label
Button = {}

---Initializes a new Button
---`Button()` : Initializes a new Button
---@return Button
Turbine.UI.Button = function () end


---A control used to indicate a boolean state.
---@class CheckBox : Label
CheckBox = {}

---Initializes a new CheckBox
---`CheckBox()` : Initializes a new CheckBox
---@return CheckBox
Turbine.UI.CheckBox = function () end

---Gets the alignment of the check within the check box.
---@return number #The alignment of the check in the check box.
function CheckBox:GetCheckAlignment() end

---Gets a flag indicating if the check box is checked.
---@return boolean #True if the check box is checked.
function CheckBox:IsChecked() end

---Sets the alignment of the check within the check box.
---@param value number The alignment of the check in the check box.
function CheckBox:SetCheckAlignment(value) end

---Sets a flag indicating if the check box is checked.
---@param value boolean True to check the check box.
function CheckBox:SetChecked(value) end


---Represents a 4 channel color with red, green, blue, and alpha.
---@class Color : Object
---@field AliceBlue Color `Turbine.UI.Color(1,0.94099998474121,0.97299998998642,1)`
---@field AntiqueWhite Color `Turbine.UI.Color(1,0.98000001907349,0.92199999094009,0.84299999475479)`
---@field Aqua Color `Turbine.UI.Color(1,0,1,1)`
---@field Aquamarine Color `Turbine.UI.Color(1,0.49799999594688,1,0.8309999704361)`
---@field Azure Color `Turbine.UI.Color(1,0.94099998474121,1,1)`
---@field Beige Color `Turbine.UI.Color(1,0.96100002527237,0.96100002527237,0.8629999756813)`
---@field Bisque Color `Turbine.UI.Color(1,1,0.89399999380112,0.76899999380112)`
---@field Black Color `Turbine.UI.Color(1,0,0,0)`
---@field BlanchedAlmond Color `Turbine.UI.Color(1,1,0.92199999094009,0.80400002002716)`
---@field Blue Color `Turbine.UI.Color(1,0,0,1)`
---@field BlueViolet Color `Turbine.UI.Color(1,0.54100000858307,0.16899999976158,0.88599997758865)`
---@field Brown Color `Turbine.UI.Color(1,0.64700001478195,0.16500000655651,0.16500000655651)`
---@field BurlyWood Color `Turbine.UI.Color(1,0.87099999189377,0.72200000286102,0.52899998426437)`
---@field CadetBlue Color `Turbine.UI.Color(1,0.37299999594688,0.62000000476837,0.62699997425079)`
---@field Chartreuse Color `Turbine.UI.Color(1,0.49799999594688,1,0)`
---@field Chocolate Color `Turbine.UI.Color(1,0.82400000095367,0.41200000047684,0.11800000071526)`
---@field Constructor Color `Turbine.UI.Color(,,,)`
---@field Coral Color `Turbine.UI.Color(1,1,0.49799999594688,0.31400001049042)`
---@field CornflowerBlue Color `Turbine.UI.Color(1,0.391999989748,0.58399999141693,0.92900002002716)`
---@field Cornsilk Color `Turbine.UI.Color(1,1,0.97299998998642,0.8629999756813)`
---@field Crimson Color `Turbine.UI.Color(1,0.8629999756813,0.078000001609325,0.23499999940395)`
---@field Cyan Color `Turbine.UI.Color(1,0,1,1)`
---@field DarkBlue Color `Turbine.UI.Color(1,0,0,0.5450000166893)`
---@field DarkCyan Color `Turbine.UI.Color(1,0,0.5450000166893,0.5450000166893)`
---@field DarkGoldenrod Color `Turbine.UI.Color(1,0.72200000286102,0.52499997615814,0.043000001460314)`
---@field DarkGray Color `Turbine.UI.Color(1,0.66299998760223,0.66299998760223,0.66299998760223)`
---@field DarkGreen Color `Turbine.UI.Color(1,0,0.391999989748,0)`
---@field DarkKhaki Color `Turbine.UI.Color(1,0.74099999666214,0.71799999475479,0.41999998688698)`
---@field DarkMagenta Color `Turbine.UI.Color(1,0.5450000166893,0,0.5450000166893)`
---@field DarkOliveGreen Color `Turbine.UI.Color(1,0.33300000429153,0.41999998688698,0.18400000035763)`
---@field DarkOrange Color `Turbine.UI.Color(1,1,0.54900002479553,0)`
---@field DarkOrchid Color `Turbine.UI.Color(1,0.60000002384186,0.195999994874,0.80000001192093)`
---@field DarkRed Color `Turbine.UI.Color(1,0.5450000166893,0,0)`
---@field DarkSalmon Color `Turbine.UI.Color(1,0.91399997472763,0.58799999952316,0.47799998521805)`
---@field DarkSeaGreen Color `Turbine.UI.Color(1,0.56099998950958,0.73699998855591,0.5450000166893)`
---@field DarkSlateBlue Color `Turbine.UI.Color(1,0.28200000524521,0.23899999260902,0.5450000166893)`
---@field DarkSlateGray Color `Turbine.UI.Color(1,0.18400000035763,0.31000000238419,0.31000000238419)`
---@field DarkTurquoise Color `Turbine.UI.Color(1,0,0.80800002813339,0.81999999284744)`
---@field DarkViolet Color `Turbine.UI.Color(1,0.5799999833107,0,0.82700002193451)`
---@field DeepPink Color `Turbine.UI.Color(1,1,0.078000001609325,0.57599997520447)`
---@field DeepSkyBlue Color `Turbine.UI.Color(1,0,0.7490000128746,1)`
---@field DimGray Color `Turbine.UI.Color(1,0.41200000047684,0.41200000047684,0.41200000047684)`
---@field DodgerBlue Color `Turbine.UI.Color(1,0.11800000071526,0.56499999761581,1)`
---@field Firebrick Color `Turbine.UI.Color(1,0.69800001382828,0.1330000013113,0.1330000013113)`
---@field FloralWhite Color `Turbine.UI.Color(1,1,0.98000001907349,0.94099998474121)`
---@field ForestGreen Color `Turbine.UI.Color(1,0.1330000013113,0.5450000166893,0.1330000013113)`
---@field Fuchsia Color `Turbine.UI.Color(1,1,0,1)`
---@field Gainsboro Color `Turbine.UI.Color(1,0.8629999756813,0.8629999756813,0.8629999756813)`
---@field GhostWhite Color `Turbine.UI.Color(1,0.97299998998642,0.97299998998642,1)`
---@field Gold Color `Turbine.UI.Color(1,1,0.84299999475479,0)`
---@field Goldenrod Color `Turbine.UI.Color(1,0.85500001907349,0.64700001478195,0.125)`
---@field Gray Color `Turbine.UI.Color(1,0.50199997425079,0.50199997425079,0.50199997425079)`
---@field Green Color `Turbine.UI.Color(1,0,0.50199997425079,0)`
---@field GreenYellow Color `Turbine.UI.Color(1,0.67799997329712,1,0.18400000035763)`
---@field Honeydew Color `Turbine.UI.Color(1,0.94099998474121,1,0.94099998474121)`
---@field HotPink Color `Turbine.UI.Color(1,1,0.41200000047684,0.7059999704361)`
---@field IndianRed Color `Turbine.UI.Color(1,0.80400002002716,0.36100000143051,0.36100000143051)`
---@field Indigo Color `Turbine.UI.Color(1,0.29399999976158,0,0.50999999046326)`
---@field IsA Color `Turbine.UI.Color(,,,)`
---@field Ivory Color `Turbine.UI.Color(1,1,1,0.94099998474121)`
---@field Khaki Color `Turbine.UI.Color(1,0.94099998474121,0.90200001001358,0.54900002479553)`
---@field Lavender Color `Turbine.UI.Color(1,0.90200001001358,0.90200001001358,0.98000001907349)`
---@field LavenderBlush Color `Turbine.UI.Color(1,1,0.94099998474121,0.96100002527237)`
---@field LawnGreen Color `Turbine.UI.Color(1,0.48600000143051,0.9879999756813,0)`
---@field LemonChiffon Color `Turbine.UI.Color(1,1,0.98000001907349,0.80400002002716)`
---@field LightBlue Color `Turbine.UI.Color(1,0.67799997329712,0.84700000286102,0.90200001001358)`
---@field LightCoral Color `Turbine.UI.Color(1,0.94099998474121,0.50199997425079,0.50199997425079)`
---@field LightCyan Color `Turbine.UI.Color(1,0.87800002098083,1,1)`
---@field LightGoldenrodYellow Color `Turbine.UI.Color(1,0.98000001907349,0.98000001907349,0.82400000095367)`
---@field LightGray Color `Turbine.UI.Color(1,0.82700002193451,0.82700002193451,0.82700002193451)`
---@field LightGreen Color `Turbine.UI.Color(1,0.56499999761581,0.93300002813339,0.56499999761581)`
---@field LightPink Color `Turbine.UI.Color(1,1,0.71399998664856,0.75700002908707)`
---@field LightSalmon Color `Turbine.UI.Color(1,1,0.62699997425079,0.47799998521805)`
---@field LightSeaGreen Color `Turbine.UI.Color(1,0.125,0.69800001382828,0.66699999570847)`
---@field LightSkyBlue Color `Turbine.UI.Color(1,0.52899998426437,0.80800002813339,0.98000001907349)`
---@field LightSlateGray Color `Turbine.UI.Color(1,0.46700000762939,0.53299999237061,0.60000002384186)`
---@field LightSteelBlue Color `Turbine.UI.Color(1,0.68999999761581,0.76899999380112,0.87099999189377)`
---@field LightYellow Color `Turbine.UI.Color(1,1,1,0.87800002098083)`
---@field Lime Color `Turbine.UI.Color(1,0,1,0)`
---@field LimeGreen Color `Turbine.UI.Color(1,0.195999994874,0.80400002002716,0.195999994874)`
---@field Linen Color `Turbine.UI.Color(1,0.98000001907349,0.94099998474121,0.90200001001358)`
---@field Magenta Color `Turbine.UI.Color(1,1,0,1)`
---@field Maroon Color `Turbine.UI.Color(1,0.50199997425079,0,0)`
---@field MediumAquamarine Color `Turbine.UI.Color(1,0.40000000596046,0.80400002002716,0.66699999570847)`
---@field MediumBlue Color `Turbine.UI.Color(1,0,0,0.80400002002716)`
---@field MediumOrchid Color `Turbine.UI.Color(1,0.72899997234344,0.33300000429153,0.82700002193451)`
---@field MediumPurple Color `Turbine.UI.Color(1,0.57599997520447,0.43900001049042,0.85900002717972)`
---@field MediumSeaGreen Color `Turbine.UI.Color(1,0.23499999940395,0.70200002193451,0.44299998879433)`
---@field MediumSlateBlue Color `Turbine.UI.Color(1,0.48199999332428,0.40799999237061,0.93300002813339)`
---@field MediumSpringGreen Color `Turbine.UI.Color(1,0,0.98000001907349,0.60399997234344)`
---@field MediumTurquoise Color `Turbine.UI.Color(1,0.28200000524521,0.81999999284744,0.80000001192093)`
---@field MediumVioletRed Color `Turbine.UI.Color(1,0.77999997138977,0.082000002264977,0.52200001478195)`
---@field MidnightBlue Color `Turbine.UI.Color(1,0.097999997437,0.097999997437,0.43900001049042)`
---@field MintCream Color `Turbine.UI.Color(1,0.96100002527237,1,0.98000001907349)`
---@field MistyRose Color `Turbine.UI.Color(1,1,0.89399999380112,0.88200002908707)`
---@field Moccasin Color `Turbine.UI.Color(1,1,0.89399999380112,0.70999997854233)`
---@field NavajoWhite Color `Turbine.UI.Color(1,1,0.87099999189377,0.67799997329712)`
---@field Navy Color `Turbine.UI.Color(1,0,0,0.50199997425079)`
---@field OldLace Color `Turbine.UI.Color(1,0.99199998378754,0.96100002527237,0.90200001001358)`
---@field Olive Color `Turbine.UI.Color(1,0.50199997425079,0.50199997425079,0)`
---@field OliveDrab Color `Turbine.UI.Color(1,0.41999998688698,0.55699998140335,0.13699999451637)`
---@field Orange Color `Turbine.UI.Color(1,1,0.64700001478195,0)`
---@field OrangeRed Color `Turbine.UI.Color(1,1,0.27099999785423,0)`
---@field Orchid Color `Turbine.UI.Color(1,0.85500001907349,0.43900001049042,0.83899998664856)`
---@field PaleGoldenrod Color `Turbine.UI.Color(1,0.93300002813339,0.91000002622604,0.66699999570847)`
---@field PaleGreen Color `Turbine.UI.Color(1,0.59600001573563,0.98400002717972,0.59600001573563)`
---@field PaleTurquoise Color `Turbine.UI.Color(1,0.68599998950958,0.93300002813339,0.93300002813339)`
---@field PaleVioletRed Color `Turbine.UI.Color(1,0.85900002717972,0.43900001049042,0.57599997520447)`
---@field PapayaWhip Color `Turbine.UI.Color(1,1,0.93699997663498,0.83499997854233)`
---@field PeachPuff Color `Turbine.UI.Color(1,1,0.85500001907349,0.72500002384186)`
---@field Peru Color `Turbine.UI.Color(1,0.80400002002716,0.52200001478195,0.24699999392033)`
---@field Pink Color `Turbine.UI.Color(1,1,0.75300002098083,0.7960000038147)`
---@field Plum Color `Turbine.UI.Color(1,0.86699998378754,0.62699997425079,0.86699998378754)`
---@field PowderBlue Color `Turbine.UI.Color(1,0.68999999761581,0.87800002098083,0.90200001001358)`
---@field Purple Color `Turbine.UI.Color(1,0.50199997425079,0,0.50199997425079)`
---@field Red Color `Turbine.UI.Color(1,1,0,0)`
---@field RosyBrown Color `Turbine.UI.Color(1,0.73699998855591,0.56099998950958,0.56099998950958)`
---@field RoyalBlue Color `Turbine.UI.Color(1,0.25499999523163,0.41200000047684,0.88200002908707)`
---@field SaddleBrown Color `Turbine.UI.Color(1,0.5450000166893,0.27099999785423,0.075000002980232)`
---@field Salmon Color `Turbine.UI.Color(1,0.98000001907349,0.50199997425079,0.44699999690056)`
---@field SandyBrown Color `Turbine.UI.Color(1,0.95700001716614,0.64300000667572,0.3759999871254)`
---@field SeaGreen Color `Turbine.UI.Color(1,0.18000000715256,0.5450000166893,0.34099999070168)`
---@field SeaShell Color `Turbine.UI.Color(1,1,0.96100002527237,0.93300002813339)`
---@field Sienna Color `Turbine.UI.Color(1,0.62699997425079,0.32199999690056,0.17599999904633)`
---@field Silver Color `Turbine.UI.Color(1,0.75300002098083,0.75300002098083,0.75300002098083)`
---@field SkyBlue Color `Turbine.UI.Color(1,0.52899998426437,0.80800002813339,0.92199999094009)`
---@field SlateBlue Color `Turbine.UI.Color(1,0.41600000858307,0.35299998521805,0.80400002002716)`
---@field SlateGray Color `Turbine.UI.Color(1,0.43900001049042,0.50199997425079,0.56499999761581)`
---@field Snow Color `Turbine.UI.Color(1,1,0.98000001907349,0.98000001907349)`
---@field SpringGreen Color `Turbine.UI.Color(1,0,1,0.49799999594688)`
---@field SteelBlue Color `Turbine.UI.Color(1,0.27500000596046,0.50999999046326,0.7059999704361)`
---@field Tan Color `Turbine.UI.Color(1,0.82400000095367,0.7059999704361,0.54900002479553)`
---@field Teal Color `Turbine.UI.Color(1,0,0.50199997425079,0.50199997425079)`
---@field Thistle Color `Turbine.UI.Color(1,0.84700000286102,0.7490000128746,0.84700000286102)`
---@field Tomato Color `Turbine.UI.Color(1,1,0.38800001144409,0.27799999713898)`
---@field Transparent Color `Turbine.UI.Color(0,1,1,1)`
---@field Turquoise Color `Turbine.UI.Color(1,0.2509999871254,0.87800002098083,0.81599998474121)`
---@field Violet Color `Turbine.UI.Color(1,0.93300002813339,0.50999999046326,0.93300002813339)`
---@field Wheat Color `Turbine.UI.Color(1,0.96100002527237,0.87099999189377,0.70200002193451)`
---@field White Color `Turbine.UI.Color(1,1,1,1)`
---@field WhiteSmoke Color `Turbine.UI.Color(1,0.96100002527237,0.96100002527237,0.96100002527237)`
---@field Yellow Color `Turbine.UI.Color(1,1,1,0)`
---@field YellowGreen Color `Turbine.UI.Color(1,0.60399997234344,0.80400002002716,0.195999994874)`
Color = {}

---Initializes a new color.
---`Color()` : Initializes a new color.
---`Color(r, g, b)` : Initializes a new color from r, g, b components.
---`Color(a, r, g, b)` : Initializes a new color from a, r, g, b components.
---@overload fun():Color
---@overload fun(r:number, g:number, b:number):Color
---@param r number The red component.
---@param g number The green component.
---@param b number The blue component.
---@param a number The alpha component.
---@return Color
Turbine.UI.Color = function (a, r, g, b) end


---Specifies the alignment of content within a region.
---@class ContentAlignment
ContentAlignment = {
	-- Undefined positioning.
	Undefined = 0,
	-- Position content at the top left of the region.
	TopLeft = 1,
	-- Position content at the top center of the region.
	TopCenter = 2,
	-- Position content at the top right of the region.
	TopRight = 3,
	-- Position content at the middle left of the region.
	MiddleLeft = 4,
	-- Position content at the middle center of the region.
	MiddleCenter = 5,
	-- Position content at the middle right of the region.
	MiddleRight = 6,
	-- Position content at the bottom left of the region.
	BottomLeft = 7,
	-- Position content at the bottom center of the region.
	BottomCenter = 8,
	-- Position content at the bottom right of the region.
	BottomRight = 9,
}


---Defines a menu that can be displayed to the user.
---@class ContextMenu : Object
ContextMenu = {}

---Initializes a new ContextMenu
---`ContextMenu()` : Initializes a new ContextMenu
---@return ContextMenu
Turbine.UI.ContextMenu = function () end

---Closes the menu if it is displayed.
function ContextMenu:Close() end

---Gets the menu items collection.
---@return MenuItemList #Returns the menu items collection.
function ContextMenu:GetItems() end

---Displays the menu.
function ContextMenu:ShowMenu() end

---Displays the menu.
---@param x number The x coordinate to display the menu at.
---@param y number The y coordinate to display the menu at.
function ContextMenu:ShowMenuAt(x, y) end


---The base control class for all available user interface elements.
---@class Control : Object
Control = {}

---Initializes a new Control
---`Control()` : Initializes a new Control
---@return Control
Turbine.UI.Control = function () end

---Request that the control take focus.
function Control:Focus() end

---Gets if the control supports drop operations from drag and drop.
---@return boolean #True if the control will handle drag and drop events.
function Control:GetAllowDrop() end

---Gets the solid background color of the control.
---@return Color #Returns a color table containing the current control background color.
function Control:GetBackColor() end

---Gets the blend mode applied to the background color.
---@return number #Returns one of the values from BlendMode that describes how to blend the background color.
function Control:GetBackColorBlendMode() end

---Gets the background graphic of the control.
---@return Graphic #The background graphic of the control..
function Control:GetBackground() end

---Gets the blend mode applied to the background image.
---@return number #Returns one of the values from BlendMode that describes how to blend the background image.
function Control:GetBlendMode() end

---Gets the list of child controls.
---@return ControlList #The list of child controls.
function Control:GetControls() end

---Gets the height of the control.
---@return number #The height of the control.
function Control:GetHeight() end

---Gets the left coordinate of the control.
---@return number #The left position of the window.
function Control:GetLeft() end

---Gets the mouse position relative to this control.
---@return number #The mouse position relative to this control.
---@return number #
function Control:GetMousePosition() end

---Gets the opacity of the window.
---@return number #A value of 0 to 1 indicating how transparent the window is.
function Control:GetOpacity() end

---Gets the parent of the control.
---@return Control #The parent of the control.
function Control:GetParent() end

---Gets the position of the control.
---@return number #List of two elements containing the left and top positions of the control.
---@return number #
function Control:GetPosition() end

---Gets the size of the control.
---@return number #The width and height as a pair of integers.
---@return number #
function Control:GetSize() end

---Gets the top coordinate of the window.
---@return number #The top position of the window.
function Control:GetTop() end

---Gets a flag indicating if the control wants to receive key events.
---@return boolean #True if the control wants to receive key events.
function Control:GetWantsKeyEvents() end

---Gets the flag indicating if the control wants to receive Update notifications.
---@return boolean #True if the control is receiving update notifications.
function Control:GetWantsUpdates() end

---Gets the width of the control.
---@return number #The width of the control.
function Control:GetWidth() end

---Gets the Z ordering index of the control.
---@return number #The current Z order of the control.
function Control:GetZOrder() end

---Returns true if the control has focus.
---@return boolean #Returns true if the control has focus.
function Control:HasFocus() end

---Test if the alt key is pressed.
---@return boolean #True if the alt key is pressed.
Control.IsAltKeyDown = function () end

---Test if the control key is pressed.
---@return boolean #True if the control key is pressed.
Control.IsControlKeyDown = function () end

---Gets a flag indicating if the control is displayed.
---@return boolean #True if the control is displayed.
function Control:IsDisplayed() end

---Gets a flag indicating if the control is enabled.
---@return boolean #True if the control is enabled.
function Control:IsEnabled() end

---Gets a flag indicating if the mouse will see this control.
---@return boolean #True if the control processing mouse messages.
function Control:IsMouseVisible() end

---Test if the shift key is pressed.
---@return boolean #True if the shift key is pressed.
Control.IsShiftKeyDown = function () end

---Gets a flag indicating if the control is visible.
---@return boolean #True if the control is visible.
function Control:IsVisible() end

---Converts a coordinate from control space to screen space.
---@param x number The X coordinate.
---@param y number The Y coordinate.
---@return number #The control coordinate for the screen coordinate specified.
---@return number #
function Control:PointToClient(x, y) end

---Converts a coordinate from control space to screen space.
---@param x number The X coordinate.
---@param y number The Y coordinate.
---@return number #The screen coordinate for the control coordinate specified.
---@return number #
function Control:PointToScreen(x, y) end

---Sets if the control supports drop operations from drag and drop.
---@param value boolean True if the control will handle drag and drop events.
function Control:SetAllowDrop(value) end

---Sets the background color of the control.
---@param value Color The new background color for the control.
function Control:SetBackColor(value) end

---Sets the blend mode applied to the background color.
---@param value number The new background color blend mode.
function Control:SetBackColorBlendMode(value) end

---Sets the background image of the control.
---@param backgroundImage any The path or id of the image to set the background of the control to.
function Control:SetBackground(backgroundImage) end

---Sets the blend mode applied to the background image.
---@param value number The new background blend mode.
function Control:SetBlendMode(value) end

---Sets a flag indicating if the control is enabled.
---@param value boolean True if the control is to be enabled, false to disable.
function Control:SetEnabled(value) end

---Sets the height of the control.
---@param value number The height of the control.
function Control:SetHeight(value) end

---Sets the left coordinate of the window.
---@param value number The left position of the window.
function Control:SetLeft(value) end

---Gets a flag indicating if the mouse will see this control.
---@param value boolean True if the control should process mouse messages.
function Control:SetMouseVisible(value) end

---Sets the opacity of the window.
---@param value number 
function Control:SetOpacity(value) end

---Sets the parent of the control.
---@param value Control The desired parent. If this is nil, the control will be unparented.
function Control:SetParent(value) end

---Sets the position of the control.
---@param left number The left position of the control.
---@param top number The top position of the control.
function Control:SetPosition(left, top) end

---Sets the size of the control.
---@param width number The desired width.
---@param height number The desired height.
function Control:SetSize(width, height) end

---Sets the top coordinate of the window.
---@param value number The top position of the window.
function Control:SetTop(value) end

---Sets the visible flag of a control.
---@param value boolean The new visibility state. True to show, false to hide.
function Control:SetVisible(value) end

---Sets a flag indicating if the control wants to receive key events.
---@param value boolean True if the control wants to receive key events.
function Control:SetWantsKeyEvents(value) end

---Sets the flag indicating if the cotnrol wants to receive update notifications.
---@param value boolean True to enable update calls.
function Control:SetWantsUpdates(value) end

---Sets the width of the control.
---@param value number The width of the control.
function Control:SetWidth(value) end

---Sets the Z order of the control.
---@param value number The new Z order of the control.
function Control:SetZOrder(value) end


---Defines a list of controls.
---@class ControlList : Object
ControlList = {}

---Initializes a new ControlList
---`ControlList()` : Initializes a new ControlList
---@return ControlList
Turbine.UI.ControlList = function () end

---Adds a menu item.
---@param item Control The menu item to add.
function ControlList:Add(item) end

---Clears the items from the list.
function ControlList:Clear() end

---Test is the list contains a specific menu item.
---@param item Control The item to check for.
---@return boolean #True if the item is contained in the list.
function ControlList:Contains(item) end

---Gets the item at the specified index.
---@param index number The index of the item to retrieve.
---@return Control #The menu item at the specified index.
function ControlList:Get(index) end

---Gets the number of menu items.
---@return number #The number of menu items.
function ControlList:GetCount() end

---Gets the index of a menu item in the list.
---@param item Control The item to get the index of.
---@return number #The index of the item in the list or -1 if it does not exist in the list.
function ControlList:IndexOf(item) end

---Inserts a menu item at a given index.
---@param index number The index to insert the item at.
---@param item Control The menu item to insert.
function ControlList:Insert(index, item) end

---Removes a menu item from the list.
---@param item Control The item to remove.
function ControlList:Remove(item) end

---Removes a menu item at the specified index.
---@param index number The index of the item to remove.
function ControlList:RemoveAt(index) end

---Sets the menu item at the specified index.
---@param index number The index of the menu item to set.
---@param item Control The item to set.
function ControlList:Set(index, item) end


---Provides display information.
---@class Display
Display = {}

---Gets the height of the display.
---@return number #The display height.
Display.GetHeight = function () end

---Gets the position of the mouse.
---@return number #The position of the mouse in screen coordinates.
---@return number #
Display.GetMousePosition = function () end

---Gets the X position of the mouse.
---@return number #The X position of the mouse in screen coordinates.
Display.GetMouseX = function () end

---Gets the Y position of the mouse.
---@return number #The Y position of the mouse in screen coordinates.
Display.GetMouseY = function () end

---Gets the size of the display window for the game.
---@return number #The horizontal and vertical resolution as two values.
---@return number #
Display.GetSize = function () end

---Gets the width of the display.
---@return number #The display width.
Display.GetWidth = function () end


---Container for information about drag drop events.
---@class DragDropInfo : Object
DragDropInfo = {}

---@return boolean #True if the drag drop was successful.
function DragDropInfo:IsSuccessful() end

---@param value boolean True if the drag drop was successful.
function DragDropInfo:SetSuccessful(value) end


---Specifies styles that can be applied to fonts.
---@class FontStyle
FontStyle = {
	-- No font styles.
	None = 0,
	-- Outlines the font.
	Outline = 8,
}


---Represents a graphic resources that is loaded from the DAT files or from disk.
---@class Graphic : Object
Graphic = {}

---Constructs an empty graphics.
---`Graphic()` : Constructs an empty graphics.
---`Graphic(dataId)` : Constructs a graphic from a game asset by its ID.
---`Graphic(filename)` : Constructs a graphic from a file.
---@overload fun():Graphic
---@overload fun(dataId:number):Graphic
---@param dataId number Game asset ID
---@param filename string
---@return Graphic
Turbine.UI.Graphic = function (filename) end


---Specifies how to perform horizontal layouts.
---@class HorizontalLayout
HorizontalLayout = {
	-- Layout starting at the left and working right.
	LeftToRight = 0,
	-- Layout starting at the right and working left.
	RightToLeft = 1,
}


---A simple label for displaying text.
---@class Label : ScrollableControl
Label = {}

---Initializes a new Label
---`Label()` : Initializes a new Label
---@return Label
Turbine.UI.Label = function () end

---Appends text to the end of the label.
---@param value string The text to append.
function Label:AppendText(value) end

---Deselects all the text in the control.
function Label:DeselectAll() end

---Gets the current font.
---@return number #The current font.
function Label:GetFont() end

---Gets the font style.
---@return number #The current font style.
function Label:GetFontStyle() end

---Gets the foreground color.
---@return Color #The color used for drawing the text.
function Label:GetForeColor() end

---Gets the text outline color.
---@return Color #The color used for outlining the text.
function Label:GetOutlineColor() end

---Gets the selected text of the label.
---@return string #The selected text of the label.
function Label:GetSelectedText() end

---Gets the length of the selected text.
---@return number #The length of the selected text.
function Label:GetSelectionLength() end

---Gets the position of the selection start.
---@return number #The position of the selection start.
function Label:GetSelectionStart() end

---Gets the text of the label.
---@return string #The text of the label.
function Label:GetText() end

---Gets the alignment of the text within the label.
---@return number #The alignment of the text.
function Label:GetTextAlignment() end

---Gets the length of the text of the label.
---@return number #The length of the text of the label.
function Label:GetTextLength() end

---Inserts text into the label at the current cursor position.
---@param value string The text to insert.
function Label:InsertText(value) end

---Gets a flag indicating if markup is enabled for the label.
---@return boolean #True if text markup is enabled.
function Label:IsMarkupEnabled() end

---Gets if the label is set to display multiple lines.
---@return boolean #True if the label will display on multiple lines.
function Label:IsMultiline() end

---Gets a flag indicating if the text in the label is selectable.
---@return boolean #True if the text in the label is selectable.
function Label:IsSelectable() end

---Selects all the text in the control.
function Label:SelectAll() end

---Sets the current font.
---@param value number The desired font.
function Label:SetFont(value) end

---Sets the font style.
---@param value number The desired font style.
function Label:SetFontStyle(value) end

---Sets the foreground color.
---@param value Color The color used for drawing the text.
function Label:SetForeColor(value) end

---Sets a flag indicating if markup is enabled for the label.
---@param value boolean Flag indicating if markup should be enabled.
function Label:SetMarkupEnabled(value) end

---Sets if the label should display on multiple lines.
---@param value boolean True to make the label multiline.
function Label:SetMultiline(value) end

---Sets the text outline color.
---@param value Color The color used for outlining the text.
function Label:SetOutlineColor(value) end

---Sets a flag indicating if the text in the label can be selected.
---@param value boolean True to enable selection of text in the label.
function Label:SetSelectable(value) end

---Replaces the selected text.
---@param value string The text to replace the selected text with.
function Label:SetSelectedText(value) end

---Sets the selected text.
---@param start number The starting position to select.
---@param length number The length of text to select.
function Label:SetSelection(start, length) end

---Sets the length of the selected text.
---@param value number The length of the selected text.
function Label:SetSelectionLength(value) end

---Sets the position of the selection start.
---@param value number The position of the selection start.
function Label:SetSelectionStart(value) end

---Sets the text of the label.
---@param value string The text of the label.
function Label:SetText(value) end

---Sets the alignment of the text within the label.
---@param value number The alignment of the text.
function Label:SetTextAlignment(value) end


---A simple list box for laying out child controls in a list.
---@class ListBox : ScrollableControl
ListBox = {}

---Initializes a new ListBox
---`ListBox()` : Initializes a new ListBox
---@return ListBox
Turbine.UI.ListBox = function () end

---Adds an item to the list box.
---@param item Control The item to add.
function ListBox:AddItem(item) end

---Clears all the items from the listbox.
function ListBox:ClearItems() end

---Test is the list box contains an item.
---@param item Control The item to check for.
---@return boolean #True if the list box contains the specified item.
function ListBox:ContainsItem(item) end

---Ensures that the specified item is visible.
---@param index number The one-based index of the item to scroll into view.
function ListBox:EnsureVisible(index) end

---Gets the flag indicating that the draw order should be flipped.
---@return boolean #True if flipped layout is enabled.
function ListBox:GetFlippedLayout() end

---Gets the flag indicating that cell alignment is ignored during rendering.
---@return boolean #True if cell alignment is ignored.
function ListBox:GetIgnoreCellAlignment() end

---Gets the item at the specified index.
---@param index number The index of the item to get.
---@return Control #The item at the specified index.
function ListBox:GetItem(index) end

---Gets the item at the specified position.
---@param x number 
---@param y number 
---@return Control #The item at the specified location in the list box otherwise if no item is there this will return nil.
function ListBox:GetItemAt(x, y) end

---Gets the number of items in the list box.
---@return number #The number of items in the list box.
function ListBox:GetItemCount() end

---Gets the maximum number of columns a listbox can display.
---@return number #The maximum number of columns a listbox can display per row.
function ListBox:GetMaxColumns() end

---Gets the maximum number of items per line. NOTE: Deprecated - Use GetMaxColumns() and GetMaxRows() instead.
---@return number #The maximum number of elements per line.
function ListBox:GetMaxItemsPerLine() end

---Gets the maximum number of rows a listbox can display.
---@return number #The maximum number of rows a listbox can display.
function ListBox:GetMaxRows() end

---Gets the orientation of elements in the listbox.
---@return number #Returns either Horizontal or Vertical, indicating which direction elements are arranged in the listbox.
function ListBox:GetOrientation() end

---Gets the flag indicating if the listbox should fill in reverse.
---@return boolean #True if reverse fill is enabled.
function ListBox:GetReverseFill() end

---Gets the selected index.
---@return number #The currently selected index or 0 if no item is selected.
function ListBox:GetSelectedIndex() end

---Gets the currently selected item.
---@return Control #The currently selected item.
function ListBox:GetSelectedItem() end

---Gets the number of pixels to indent wrapped rows in a horizontal listbox or wrapped columns in a vertical listbox.
---@return number #The number of pixels to indent wrapped rows or columns.
function ListBox:GetWrapIndentAmount() end

---Gets the index of an item in the list box.
---@param item Control The item to get the index of.
---@return number #The index of the item if it is in the list box otherwise -1.
function ListBox:IndexOfItem(item) end

---Inserts an item to the list box.
---@param index number The index to insert the item at.
---@param item Control The item to insert.
function ListBox:InsertItem(index, item) end

---Removes an item from the list box.
---@param item Control The item to remove.
function ListBox:RemoveItem(item) end

---Removes an item at the specified index.
---@param index number The index of the item to remove.
function ListBox:RemoveItemAt(index) end

---Sets the flag indicating that the draw order should be flipped.
---@param value boolean True to enable layout flipping.
function ListBox:SetFlippedLayout(value) end

---Sets the flag indicating that cell alignment is ignored during rendering.
---@param value boolean True to ignore cell alignment.
function ListBox:SetIgnoreCellAlignment(value) end

---Sets the item at the specified index.
---@param index number The index of the item to set.
---@param item Control The item to set at the specified index.
function ListBox:SetItem(index, item) end

---Sets the maximum number of columns a listbox can display.
---@param value number The maximum number of columns to display.
function ListBox:SetMaxColumns(value) end

---Sets the maximum number of items per line. NOTE: Deprecated - Use SetMaxColumns( i_value ) and SetMaxRows( i_value ) instead.
---@param value number The maximum number of elements per line.
function ListBox:SetMaxItemsPerLine(value) end

---Sets the maximum number of rows a listbox can display.
---@param value number The maximum number of rows to display.
function ListBox:SetMaxRows(value) end

---Sets the orientation of elements in the listbox.
---@param value number Sets the direction in which elements are laid out in the listbox.
function ListBox:SetOrientation(value) end

---Sets the flag indicating that the listbox should fill in reverse.
---@param value boolean True to enable reverse fill.
function ListBox:SetReverseFill(value) end

---Sets the selected index.
---@param index number The index to select.
function ListBox:SetSelectedIndex(index) end

---Sets the currently selected item.
---@param item Control The item to select.
function ListBox:SetSelectedItem(item) end

---Sets the number of pixels to indent wrapped rows in a horizontal listbox or wrapped columns in a vertical listbox.
---@param value number The number of pixels to indent wrapped rows or columns.
function ListBox:SetWrapIndentAmount(value) end

---Sorts the elements in the list box.
---@param sortMethod Object The function used to sort the elements in the list box.
function ListBox:Sort(sortMethod) end


---The Lord of the Rings UI package.
---@class Lotro
---@field Action Action List available actions that can be interpretted.
---@field BaseItemControl BaseItemControl Base item control for Lotro interface item classes.
---@field DragDropInfo LotroDragDropInfo Container for information about drag drop events.
---@field Font Font The list of available fonts.
---@field LotroUI LotroUI Provides access to the built in game UIs.
---@field LotroUIElement LotroUIElement The list of UIs that can be enabled or disabled.
---@field ShortcutType ShortcutType Defines one of the shortcut types.
Lotro = {}


---List available actions that can be interpretted.
---@class Action
Action = {
	-- An undefined action.
	Undefined = 0,
	-- Camera Instance Mouse Look.
	CameraInstantMouseLook = 92,
	-- Capture Screenshot.
	CaptureScreenshot = 116,
	-- The escape key being pressed.
	Escape = 145,
	-- Quickbar 3 Visibility.
	Quickbar3Visibility = 268435458,
	-- Quickslot 63 (Extra bar 2).
	Quickslot_63 = 268435459,
	-- Quickslot 47 (Shift bar).
	Quickslot_47 = 268435460,
	-- Quickslot 30 (Alt bar).
	Quickslot_30 = 268435461,
	-- Quickslot Lock.
	ToggleQuickslotLock = 268435462,
	-- Toggle Vendor Full Stack Display.
	VendorFullStack = 268435463,
	-- Select Fellow Five.
	SelectFellowFive = 268435464,
	-- Quickslot 64 (Extra bar 2).
	Quickslot_64 = 268435465,
	-- Quickslot 48 (Shift bar).
	Quickslot_48 = 268435466,
	-- Quickslot 31 (Alt bar).
	Quickslot_31 = 268435467,
	-- Select Assist.
	SelectionAssist = 268435468,
	-- Select Nearest Player.
	SelectionNearestPlayer = 268435469,
	-- Quickslot 65 (Extra bar 2).
	Quickslot_65 = 268435470,
	-- Quickslot 49 (Extra bar 1).
	Quickslot_49 = 268435471,
	-- Quickslot 32 (Alt bar).
	Quickslot_32 = 268435472,
	-- Quickslot 20 (Control bar).
	Quickslot_20 = 268435473,
	-- Select Previous Attack.
	PreviousAttacker = 268435474,
	-- Select Next Player.
	SelectionNextPlayer = 268435475,
	-- Toggle Radar.
	ToggleRadar = 268435476,
	-- Toggle Status Bar.
	ToggleStatusbarPanel = 268435477,
	-- Toggle the display of the first inventory bag.
	ToggleBag1 = 268435478,
	-- Quickslot 66 (Extra bar 2).
	Quickslot_66 = 268435479,
	-- Quickslot 33 (Alt bar).
	Quickslot_33 = 268435480,
	-- Quickslot 21 (Control bar).
	Quickslot_21 = 268435481,
	-- Detach tooltip.
	Tooltip_Detach = 268435482,
	-- Toggle Skill Panel.
	ToggleSkillPanel = 268435483,
	-- Quickbar 4 Visibility.
	Quickbar4Visibility = 268435485,
	-- Toggle the display of the second inventory bag.
	ToggleBag2 = 268435486,
	-- Quickslot 67 (Extra bar 2).
	Quickslot_67 = 268435487,
	-- Quickslot 50 (Extra bar 1).
	Quickslot_50 = 268435488,
	-- Quickslot 34 (Alt bar).
	Quickslot_34 = 268435489,
	-- Quickslot 22 (Control bar).
	Quickslot_22 = 268435490,
	-- Select Previous Foe.
	SelectionPreviousFoe = 268435491,
	-- Toggle the display of the third inventory bag.
	ToggleBag3 = 268435493,
	-- Quickslot 68 (Extra bar 2).
	Quickslot_68 = 268435494,
	-- Quickslot 51 (Extra bar 1).
	Quickslot_51 = 268435495,
	-- Quickslot 35 (Alt bar).
	Quickslot_35 = 268435496,
	-- Quickslot 23 (Control bar).
	Quickslot_23 = 268435497,
	-- Quickslot 1 (Main bar).
	Quickslot_1 = 268435498,
	-- Select Fellow One.
	SelectFellowOne = 268435500,
	-- Toggle the display of the fourth inventory bag.
	ToggleBag4 = 268435501,
	-- Quickslot 69 (Extra bar 2).
	Quickslot_69 = 268435502,
	-- Quickslot 52 (Extra bar 1).
	Quickslot_52 = 268435503,
	-- Quickslot 36 (Alt bar).
	Quickslot_36 = 268435504,
	-- Quickslot 24 (Control bar).
	Quickslot_24 = 268435505,
	-- Quickslot 2 (Main bar).
	Quickslot_2 = 268435506,
	-- Select Previous Creature.
	SelectionPreviousCreature = 268435507,
	-- Select Self.
	SelectionSelf = 268435508,
	-- Toggle Social Panel.
	ToggleSocialPanel = 268435509,
	-- Toggle Trait Panel.
	ToggleTraitPanel = 268435510,
	-- Toggle Options Panel.
	ToggleOptionsPanel = 268435512,
	-- Toggle the display of the fifth inventory bag.
	ToggleBag5 = 268435513,
	-- Quickslot Chat.
	QuickSlot_Chat = 268435514,
	-- Quickslot 53 (Extra bar 1).
	Quickslot_53 = 268435515,
	-- Quickslot 37 (Shift bar).
	Quickslot_37 = 268435516,
	-- Quickslot 25 (Alt bar).
	Quickslot_25 = 268435517,
	-- Quickslot 3 (Main bar).
	Quickslot_3 = 268435518,
	-- Select Previous Item.
	SelectionPreviousItem = 268435519,
	-- Toggle Crafting Panel.
	ToggleCraftingPanel = 268435520,
	-- Toggle Map Panel.
	MapPanel = 268435521,
	-- Select Fellow Six.
	SelectFellowSix = 268435523,
	-- Quickslot 54 (Extra bar 1).
	Quickslot_54 = 268435524,
	-- Quickslot 38 (Shift bar).
	Quickslot_38 = 268435525,
	-- Quickslot 26 (Alt bar).
	Quickslot_26 = 268435526,
	-- Quickslot 4 (Main bar).
	Quickslot_4 = 268435527,
	-- Toggle Titles Panel.
	TitlesPanel = 268435528,
	-- Toggle Quest Journal Panel.
	ToggleJournalPanel = 268435529,
	-- Toggle Quest Panel.
	ToggleQuestPanel = 268435530,
	-- Quickslot 55 (Extra bar 1).
	Quickslot_55 = 268435532,
	-- Quickslot 39 (Shift bar).
	Quickslot_39 = 268435533,
	-- Quickslot 27 (Alt bar).
	Quickslot_27 = 268435534,
	-- Quickslot 10 (Main bar).
	Quickslot_10 = 268435535,
	-- Quickslot 5 (Main bar).
	Quickslot_5 = 268435536,
	-- Select Fellow Three.
	SelectFellowThree = 268435538,
	-- Quickbar 5 Visibility.
	Quickbar5Visibility = 268435539,
	-- Quickslot 56 (Extra bar 1).
	Quickslot_56 = 268435540,
	-- Quickslot 28 (Alt bar).
	Quickslot_28 = 268435541,
	-- Quickslot 11 (Main bar).
	Quickslot_11 = 268435542,
	-- Quickslot 6 (Main bar).
	Quickslot_6 = 268435543,
	-- Select Nearest Fellow.
	SelectionNearestFellow = 268435544,
	-- Chat Reply.
	ChatModeReply = 268435546,
	-- Quickslot 57 (Extra bar 1).
	Quickslot_57 = 268435548,
	-- Quickslot 29 (Alt bar).
	Quickslot_29 = 268435549,
	-- Quickslot 12 (Main bar).
	Quickslot_12 = 268435550,
	-- Quickslot 7 (Main bar).
	Quickslot_7 = 268435551,
	-- Logout.
	Logout = 268435552,
	-- Toggle Combo UI.
	ToggleComboUI = 268435553,
	-- Chat Talk (Voice).
	VoiceChat_Talk = 268435555,
	-- Quickbar 2 Visibility.
	Quickbar2Visibility = 268435556,
	-- Quickslot 58 (Extra bar 1).
	Quickslot_58 = 268435557,
	-- Quickslot 13 (Control bar).
	Quickslot_13 = 268435558,
	-- Quickslot 8 (Main bar).
	Quickslot_8 = 268435559,
	-- Show Damage.
	ShowDamage = 268435561,
	-- Toggle Accomplishment (Deeds) Panel.
	ToggleAccomplishmentPanel = 268435562,
	-- Quickslot 59 (Extra bar 1).
	Quickslot_59 = 268435567,
	-- Quickslot 14 (Control bar).
	Quickslot_14 = 268435568,
	-- Quickslot 9 (Main bar).
	Quickslot_9 = 268435569,
	-- Quickbar 1 Visibility.
	Quickbar1Visibility = 268435575,
	-- Quickslot 15 (Control bar).
	Quickslot_15 = 268435576,
	-- Select Nearest Creature.
	SelectionNearestCreature = 268435577,
	-- Start Command.
	Start_Command = 268435578,
	-- Toggle Hidden Drag Boxes.
	ToggleHiddenDragBoxes = 268435579,
	-- Toggle Input Panel.
	ToggleInputPanel = 268435580,
	-- Toggle Toolbar.
	ToggleToolbar = 268435585,
	-- Quickslot 16 (Control bar).
	Quickslot_16 = 268435586,
	-- Select Previous Fellow.
	SelectionPreviousFellow = 268435587,
	-- Select Next Creature.
	SelectionNextCreature = 268435588,
	-- Use.
	Use = 268435589,
	-- Toggle Item Sell Lock.
	ToggleItemSellLock = 268435590,
	-- Toggle Quest Journal.
	ToggleQuestJournal = 268435591,
	-- Select Fellow Four.
	SelectFellowFour = 268435595,
	-- Select Fellow Two.
	SelectFellowTwo = 268435596,
	-- Quickslot 40 (Shift bar).
	Quickslot_40 = 268435597,
	-- Quickslot 17 (Control bar).
	Quickslot_17 = 268435598,
	-- Select Last.
	PreviousSelection = 268435599,
	-- Toggle Toolbar Panel.
	ToggleToolbarPanel = 268435600,
	-- Toggle the display of all inventory bags.
	ToggleBags = 268435604,
	-- Quickslot 41 (Shift bar).
	Quickslot_41 = 268435605,
	-- Quickslot 18 (Control bar).
	Quickslot_18 = 268435606,
	-- Select Nearest Foe.
	SelectionNearestFoe = 268435607,
	-- Select Previous Player.
	SelectionPreviousPlayer = 268435608,
	-- Fellowship Top Manoeuvre.
	TopFellowshipManoeuvre = 268435609,
	-- Quickslot 70 (Extra bar 2).
	Quickslot_70 = 268435612,
	-- Quickslot 42 (Shift bar).
	Quickslot_42 = 268435613,
	-- Quickslot 19 (Control bar).
	Quickslot_19 = 268435614,
	-- Fellowship Bottom Manoeuvre.
	BottomFellowshipManoeuvre = 268435615,
	-- Quickslot 71 (Extra bar 2).
	Quickslot_71 = 268435618,
	-- Quickslot 43 (Shift bar).
	Quickslot_43 = 268435619,
	-- Select Off.
	SelectionOff = 268435620,
	-- Select Next Fellow.
	SelectionNextFellow = 268435621,
	-- Select Next Foe.
	SelectionNextFoe = 268435622,
	-- Fellowship Left Manoeuvre.
	LeftFellowshipManoeuvre = 268435624,
	-- Quickslot 72 (Extra bar 2).
	Quickslot_72 = 268435627,
	-- Quickslot 60 (Extra bar 1).
	Quickslot_60 = 268435628,
	-- Quickslot 44 (Shift bar).
	Quickslot_44 = 268435629,
	-- Fellowship Right Manoeuvre.
	RightFellowshipManoeuvre = 268435630,
	-- Quickslot 61 (Extra bar 2).
	Quickslot_61 = 268435631,
	-- Quickslot 45 (Shift bar).
	Quickslot_45 = 268435632,
	-- Select Nearest Item.
	SelectionNearestItem = 268435633,
	-- Select Next Item.
	SelectionNextItem = 268435634,
	-- Toggle UI.
	UI_Toggle = 268435635,
	-- Chat Mode.
	EnterChatMode = 268435636,
	-- Toggle Assistance Panel.
	ToggleAssistancePanel = 268435637,
	-- Quickslot Skill Mode.
	QuickSlot_SkillMode = 268435639,
	-- Quickslot 62 (Extra bar 2).
	Quickslot_62 = 268435640,
	-- Quickslot 46 (Shift bar).
	Quickslot_46 = 268435641,
	-- Show Names.
	Show_Names = 268435642,
	-- Toggle Dressing Room Panel.
	DressingRoom = 268435643,
	-- Auto Loot All.
	AutoLootAll = 268435645,
	-- Music note Ab4.
	Music_Ab4 = 268435646,
	-- Music note Bb2.
	Music_Bb2 = 268435647,
	-- Music note Bb3.
	Music_Bb3 = 268435648,
	-- Music note B2.
	Music_B2 = 268435649,
	-- Music note Bb4.
	Music_Bb4 = 268435650,
	-- Music note B3.
	Music_B3 = 268435651,
	-- Music note G2.
	Music_G2 = 268435652,
	-- Music note B4.
	Music_B4 = 268435653,
	-- Music note G3.
	Music_G3 = 268435654,
	-- Music note G4.
	Music_G4 = 268435655,
	-- Music note Db2.
	Music_Db2 = 268435656,
	-- Music note Db3.
	Music_Db3 = 268435657,
	-- Music note Db4.
	Music_Db4 = 268435658,
	-- Music note A2.
	Music_A2 = 268435659,
	-- Music note A3.
	Music_A3 = 268435660,
	-- Music note F2.
	Music_F2 = 268435661,
	-- Music note Eb2.
	Music_Eb2 = 268435662,
	-- Music note A4.
	Music_A4 = 268435663,
	-- Music note F3.
	Music_F3 = 268435664,
	-- Music note Eb3.
	Music_Eb3 = 268435665,
	-- Music note D2.
	Music_D2 = 268435666,
	-- Music note F4.
	Music_F4 = 268435667,
	-- Music note Eb4.
	Music_Eb4 = 268435668,
	-- Music note D3.
	Music_D3 = 268435669,
	-- Music note D4.
	Music_D4 = 268435670,
	-- Music note Gb2.
	Music_Gb2 = 268435671,
	-- Music note Gb3.
	Music_Gb3 = 268435672,
	-- Music note Gb4.
	Music_Gb4 = 268435673,
	-- Music note E2.
	Music_E2 = 268435674,
	-- Music note E3.
	Music_E3 = 268435675,
	-- Music note C2.
	Music_C2 = 268435676,
	-- Music note E4.
	Music_E4 = 268435677,
	-- Music note C3.
	Music_C3 = 268435678,
	-- Music note C4.
	Music_C4 = 268435679,
	-- Music note Ab2.
	Music_Ab2 = 268435680,
	-- Music note C5.
	Music_C5 = 268435681,
	-- Music note Ab3.
	Music_Ab3 = 268435682,
	-- Music toggle mode.
	ToggleMusicMode = 268435683,
	-- Select Next Tracked.
	SelectionNextTracked = 268435684,
	-- Select Previous Tracked.
	SelectionPreviousTracked = 268435685,
	-- Fellowship Skill Assist.
	FellowshipSkillAssist = 268435686,
	-- Assist Fellow Three.
	AssistFellowThree = 268435688,
	-- Assist Fellow Two.
	AssistFellowTwo = 268435689,
	-- Assist Fellow Six.
	AssistFellowSix = 268435690,
	-- Assist Fellow Five.
	AssistFellowFive = 268435691,
	-- Assist Fellow Four.
	AssistFellowFour = 268435692,
	-- Music end song.
	MusicEndSong = 268435695,
	-- Toggle Reputation Panel.
	ReputationPanel = 268435696,
	-- Mark Target Spear.
	SpearMark = 268435697,
	-- Mark Target Arrow.
	ArrowMark = 268435698,
	-- Mark Target Sun.
	SunMark = 268435699,
	-- Mark Target Sword.
	SwordsMark = 268435700,
	-- Mark Target Moon.
	MoonMark = 268435701,
	-- Mark Target Star.
	StarMark = 268435702,
	-- Mark Target Claw.
	ClawMark = 268435703,
	-- Mark Target Skull.
	SkullMark = 268435704,
	-- Mark Target Leaf.
	LeafMark = 268435705,
	-- Mark Target Shield.
	ShieldMark = 268435706,
	-- Toggle Housing Panel.
	HousingPanel = 268435707,
	-- Outfit Selection 1.
	PresentOutfit1 = 268435708,
	-- Outfit Selection 2.
	PresentOutfit2 = 268435709,
	-- Outfit Selection Main.
	PresentMainInventory = 268435710,
	-- Toggle Item Advancement Panel.
	ToggleItemAdvancementPanel = 268435754,
	-- Toggle Gambit Panel.
	ToggleGambitPanel = 268435807,
	-- Chat Link Item.
	ItemLinkToChat = 268435808,
	-- Toggle Vendor Quantity Display.
	VendorQuantity = 268435835,
	-- Toggle Vendor Stack Display.
	ToggleStackDisplay = 268435836,
	-- Toggle Threat Tracker.
	ToggleThreatTrackerPanel = 268435853,
	-- Toggle Skirmish Panel.
	ToggleSkirmishPanel = 268435854,
	-- Toggle World Join (Instance Finder).
	ToggleWorldJoin = 268435888,
	-- Toggle Web Store.
	ToggleWebStore = 268435889,
	-- Toggle Start Menu.
	MainMenu = 268435899,
	-- Toggle System Menu.
	SystemMenu = 268435900,
	-- Toggle Mounts Panel.
	ToggleMountsPanel = 268435901,
	-- Toggle Crafting Proficiency 2 Panel.
	ToggleCraftingProf2Panel = 268435902,
	-- Toggle Crafting Proficiency 1 Panel.
	ToggleCraftingProf1Panel = 268435903,
	-- Toggle Crafting Proficiency 3 Panel.
	ToggleCraftingProf3Panel = 268435904,
	-- Toggle Social Kinship Panel.
	KinshipPanel = 268435905,
	-- Toggle Social Group Stage Panel.
	GroupStagePanel = 268435906,
	-- Toggle Social Fellowing Panel.
	ToggleSocialFellowingPanel = 268435907,
	-- Toggle Social Raid Panel.
	RaidPanel = 268435908,
	-- Toggle Social Friends Panel.
	FriendsPanel = 268435909,
	-- Toggle Hobby Panel.
	HobbyPanel = 268435910,
	-- Toggle Destiny Perks Panel.
	DestinyPointPerksPanel = 268435913,
	-- Dismount Remount.
	DismountRemount = 268435916,
	-- Toggle Wallet.
	TogglePaperItemPanel = 268435917,
	-- Clear All Filters.
	ClearAllFilters = 268435918,
	-- Toggle PVP Panel.
	TogglePVPPanel = 268435919,
	-- Toggle Bio Panel.
	ToggleBioPanel = 268435920,
	-- Outfit Selection 3.
	PresentOutfit3 = 268435921,
	-- Outfit Selection 4.
	PresentOutfit4 = 268435922,
	-- Outfit Selection 5.
	PresentOutfit5 = 268435923,
	-- Toggle Instance Finder Panel.
	ToggleInstanceFinderPanel = 268435924,
	-- Outfit Selection 6.
	PresentOutfit6 = 268435925,
	-- Outfit Selection 7.
	PresentOutfit7 = 268435926,
	-- Toggle Plugin Manager UI.
	TogglePluginManagerUI = 268435927,
	-- Toggle Plugin Manager.
	TogglePluginManager = 268435928,
	-- Track Nearby Quests.
	TrackNearbyQuests = 268435929,
	-- Toggle the display of the sixth inventory bag.
	ToggleBag6 = 268436015,
	-- Toggle Mounted Combat UI.
	ToggleMountedCombatUI = 268436016,
	-- Show Remote Quests.
	ShowRemoteQuestActions = 268436019,
	-- Quickslot Page Down.
	QuickslotPageDown = 268436021,
	-- Quickslot Page Up.
	QuickslotPageUp = 268436022,
	-- Toggle Pending Loot.
	TogglePendingLoot = 268436023,
	-- Toggle Mithril Coin Menu.
	ToggleMithrilCoinsMenu = 268436024,
	-- Toggle Auction Panel.
	ToggleMithrilCoinsAuctionUI = 268436026,
	-- Toggle Mounted XP UI.
	ToggleMountedXpUI = 268436028,
	-- Selection Follow.
	FollowSelection = 268436029,
	-- Find Items.
	FindItems = 268436030,
	-- Toggle Alert Overflow.
	ToggleAlertOverflow = 268436031,
	-- Toggle Item Reward UI.
	ToggleRandomItemRewardUI = 268436032,
	-- Toggle Big Battles UI.
	ToggleBigBattlesUI = 268436033,
	-- Toggle Mail UI.
	ToggleMailUI = 268436034,
	-- Toggle Collections UI.
	ToggleCollectionUI = 268436035,
	-- Multi-use Item.
	MultiUseItem = 268436036,
	-- Toggle Filter UI.
	ToggleFilterUI = 268436037,
	-- Outfit Selection 8.
	PresentOutfit8 = 268436038,
}


---Base item control for Lotro interface item classes.
---@class BaseItemControl : Control
BaseItemControl = {}


---A standard Lord of the Rings silver button.
---@class LotroButton : Button
LotroButton = {}

---Initializes a new Button
---`Button()` : Initializes a new Button
---@return LotroButton
Turbine.UI.Lotro.Button = function () end


---A standard Lord of the Rings check box.
---@class LotroCheckBox : CheckBox
LotroCheckBox = {}

---Initializes a new CheckBox
---`CheckBox()` : Initializes a new CheckBox
---@return LotroCheckBox
Turbine.UI.Lotro.CheckBox = function () end


---Container for information about drag drop events.
---@class LotroDragDropInfo : DragDropInfo
LotroDragDropInfo = {}

---Gets the shortcut from the drag drop event.
---@return Shortcut #Any shortcut information available from the drag drop event.
function LotroDragDropInfo:GetShortcut() end


---Provides a control for displaying an effect indicator.
---@class EffectDisplay : Control
EffectDisplay = {}

---Initializes a new EffectDisplay
---`EffectDisplay()` : Initializes a new EffectDisplay
---@return EffectDisplay
Turbine.UI.Lotro.EffectDisplay = function () end

---Gets the effect displayed by the control.
---@return Effect #The effect the control is displaying.
function EffectDisplay:GetEffect() end

---Sets the effect displayed by the control.
---@param value Effect The effect the control is displaying.
function EffectDisplay:SetEffect(value) end


---A control for providing standard entity selection and context sensitive menu support.
---@class EntityControl : Control
EntityControl = {}

---Initializes a new EntityControl
---`EntityControl()` : Initializes a new EntityControl
---@return EntityControl
Turbine.UI.Lotro.EntityControl = function () end


---A EquipmentSlot button for for equipping items.
---@class EquipmentSlot : BaseItemControl
EquipmentSlot = {}

---Initializes a new EquipmentSlot
---`EquipmentSlot()` : Initializes a new EquipmentSlot
---@return EquipmentSlot
Turbine.UI.Lotro.EquipmentSlot = function () end

---Gets the equipment slot visualized by this UI equipment slot.
---@return number #The equipment slot visualized by this UI equipment slot.
function EquipmentSlot:GetEquipmentSlot() end

---Sets the equipment slot visualized by this UI equipment slot.
---@param value number The equipment slot visualized by this UI equipment slot.
function EquipmentSlot:SetEquipmentSlot(value) end


---The list of available fonts.
---@class Font
Font = {
	-- An undefined font.
	Undefined = 0,
	-- Trajan Pro 20 point.
	TrajanPro20 = 1107296256,
	-- Verdana 14 point.
	Verdana14 = 1107296257,
	-- Trajan Pro 13 point.
	TrajanPro13 = 1107296258,
	-- Trajan Pro 15 point.
	TrajanPro15 = 1107296263,
	-- Verdana 12 point.
	Verdana12 = 1107296264,
	-- Trajan Pro 18 point.
	TrajanPro18 = 1107296265,
	-- Trajan Pro 21 point.
	TrajanPro21 = 1107296266,
	-- Trajan Pro 16 point.
	TrajanPro16 = 1107296267,
	-- Trajan Pro 14 point.
	TrajanPro14 = 1107296268,
	-- Trajan Pro 23 point.
	TrajanPro23 = 1107296269,
	-- BookAntiqua 20 point.
	BookAntiqua20 = 1107296270,
	-- BookAntiqua Bold 22 point.
	BookAntiquaBold22 = 1107296271,
	-- BookAntiqua Bold 24 point.
	BookAntiquaBold24 = 1107296272,
	-- Trajan Pro Bold 30 point.
	TrajanProBold30 = 1107296273,
	-- Trajan Pro Bold 25 point.
	TrajanProBold25 = 1107296274,
	-- Trajan Pro Bold 22 point.
	TrajanProBold22 = 1107296275,
	-- Trajan Pro Bodl 36 point.
	TrajanProBold36 = 1107296276,
	-- Trajan Pro 24 point.
	TrajanPro24 = 1107296277,
	-- Verdana 20 point.
	Verdana20 = 1107296278,
	-- Verdana 10 point.
	Verdana10 = 1107296279,
	-- Verdana 16 point.
	Verdana16 = 1107296280,
	-- Verdana 18 point.
	Verdana18 = 1107296281,
	-- Verdana 22 point.
	Verdana22 = 1107296282,
	-- Verdana 23 point.
	Verdana23 = 1107296283,
	-- Trajan Pro Bold 24 point.
	TrajanProBold24 = 1107296292,
	-- Trajan Pro 26 point.
	TrajanPro26 = 1107296293,
	-- Trajan Pro 28 point.
	TrajanPro28 = 1107296294,
	-- FixedSys 15 point.
	FixedSys15 = 1107296295,
	-- LucidaConsole.
	LucidaConsole12 = 1107296296,
	-- Arial 12 point.
	Arial12 = 1107296297,
	-- Trajan Pro Bold 16 point.
	TrajanProBold16 = 1107296298,
	-- Trajan Pro 19 point.
	TrajanPro19 = 1107296309,
	-- BookAntiqua Bold 14 point.
	BookAntiquaBold14 = 1107296496,
	-- BookAntiqua 22 point.
	BookAntiqua22 = 1107296497,
	-- BookAntiqua Bold 18 point.
	BookAntiquaBold18 = 1107296498,
	-- BookAntiqua Bold 12 point.
	BookAntiquaBold12 = 1107296499,
	-- BookAntiqua 24 point.
	BookAntiqua24 = 1107296500,
	-- BookAntiqua Bold 19 point.
	BookAntiquaBold19 = 1107296501,
	-- BookAntiqua 12 point.
	BookAntiqua12 = 1107296502,
	-- Trajan Pro 25 point.
	TrajanPro25 = 1107296503,
	-- BookAntiqua 16 point.
	BookAntiqua16 = 1107296504,
	-- BookAntiqua 14 point.
	BookAntiqua14 = 1107296505,
	-- BookAntiqua 18 point.
	BookAntiqua18 = 1107296506,
	-- Verdana Bold 16 point.
	VerdanaBold16 = 1107296509,
	-- BookAntiqua 28 point.
	BookAntiqua28 = 1107296616,
	-- BookAntiqua 26 point.
	BookAntiqua26 = 1107296617,
	-- BookAntiqua 32 point.
	BookAntiqua32 = 1107296618,
	-- BookAntiqua 36 point.
	BookAntiqua36 = 1107296619,
}


---A standard Lord of the Rings gold button.
---@class GoldButton : LotroButton
GoldButton = {}

---Initializes a new GoldButton
---`GoldButton()` : Initializes a new GoldButton
---@return GoldButton
Turbine.UI.Lotro.GoldButton = function () end


---A standard Lord of the Rings gold window.
---@class GoldWindow : LotroWindow
GoldWindow = {}

---Initializes a new GoldWindow
---`GoldWindow()` : Initializes a new GoldWindow
---@return GoldWindow
Turbine.UI.Lotro.GoldWindow = function () end


---Provides a control for displaying an item.
---@class ItemControl : BaseItemControl
ItemControl = {}

---Initializes a new ItemControl
---`ItemControl()` : Initializes a new ItemControl
---@return ItemControl
Turbine.UI.Lotro.ItemControl = function () end

---Gets the item displayed by the control.
---@return Item #The item the control is displaying.
function ItemControl:GetItem() end

---Sets the item displayed by the control.
---@param value Item The item the control is displaying.
function ItemControl:SetItem(value) end


---Provides a control for displaying item information.
---@class ItemInfoControl : BaseItemControl
ItemInfoControl = {}

---Initializes a new ItemInfoControl
---`ItemInfoControl()` : Initializes a new ItemInfoControl
---@return ItemInfoControl
Turbine.UI.Lotro.ItemInfoControl = function () end

---Gets the item displayed by the control.
---@return ItemInfo #The item the control is displaying.
function ItemInfoControl:GetItemInfo() end

---Gets the quantity displayed.
---@return number #The quantity displayed.
function ItemInfoControl:GetQuantity() end

---Sets the item displayed by the control.
---@param value ItemInfo The item the control is displaying.
function ItemInfoControl:SetItemInfo(value) end

---Gets the quantity displayed.
---@param value number The quantity displayed.
function ItemInfoControl:SetQuantity(value) end


---Provides access to the built in game UIs.
---@class LotroUI : Object
LotroUI = {}

---Gets a flag indicating if a game UI element is enabled.
---@param hudElement number The element to check the enabled state of.
---@return boolean #
LotroUI.IsEnabled = function (hudElement) end

---Gets the position of an existing game UI element.
LotroUI.Reset = function () end

---Sets a flag indicating if a game UI element is enabled.
---@param hudElement number The element to get the enabled state of.
---@param value boolean The enabled state to set.
LotroUI.SetEnabled = function (hudElement, value) end


---The list of UIs that can be enabled or disabled.
---@class LotroUIElement
LotroUIElement = {
	-- Identifies the plugins manager panel.
	PluginsManager = 268435457,
	-- Identifies the fellowship or warband panel.
	Party = 268435458,
	-- Identifies the first backpack.
	Backpack1 = 268435459,
	-- Identifies the second backpack.
	Backpack2 = 268435460,
	-- Identifies the third backpack.
	Backpack3 = 268435461,
	-- Identifies the fourth backpack.
	Backpack4 = 268435462,
	-- Identifies the fifth backpack.
	Backpack5 = 268435463,
	-- Identifies the sixth backpack.
	Backpack6 = 268435464,
	-- Identifies the player vitals.
	Vitals = 268435465,
	-- Identifies the target info.
	Target = 268435467,
}


---A quickslot button for using skills or items.
---@class Quickslot : Control
Quickslot = {}

---Initializes a new Quickslot
---`Quickslot()` : Initializes a new Quickslot
---@return Quickslot
Turbine.UI.Lotro.Quickslot = function () end

---Gets the shortcut on the quickslot.
---@return Shortcut #The shortcut info for the quickslot.
function Quickslot:GetShortcut() end

---Gets whether right clicks will activate the quickslot.
---@return boolean #True if right mouse clicks will activate the quickslot.
function Quickslot:IsUseOnRightClick() end

---Sets the shortcut on the quickslot.
---@param value Shortcut The new shortcut infor to set the quickslot to use.
function Quickslot:SetShortcut(value) end

---Sets whether right clicks will activate the quickslot.
---@param value boolean True if right mouse clicks will activate the quickslot.
function Quickslot:SetUseOnRightClick(value) end


---A standard Lord of the Rings scroll bar.
---@class LotroScrollBar : ScrollBar
LotroScrollBar = {}

---Initializes a new ScrollBar
---`ScrollBar()` : Initializes a new ScrollBar
---@return LotroScrollBar
Turbine.UI.Lotro.ScrollBar = function () end


---Encapsulates information about a short cut.
---@class Shortcut : Object
Shortcut = {}

---Initializes a new shortcut.
---`Shortcut()` : Initializes a new shortcut.
---`Shortcut(item)` : Initializes a new shortcut.
---`Shortcut(type, data)` : Initializes a new shortcut.
---@overload fun():Shortcut
---@overload fun(item:Item):Shortcut
---@param item Item The item to create the shortcut from.
---@param type ShortcutType The type of shortcut that will be created.
---@param data string the data string associated with this shortcut.
---@return Shortcut
Turbine.UI.Lotro.Shortcut = function (type, data) end

---Gets the data associated with the shortcut.
---@return string #The shortcut data.
function Shortcut:GetData() end

---Converts a Shortcut to an Item.
---@return Item #The Item that was create from the shortcut or NIL if the shortcut was not a valid Item.
function Shortcut:GetItem() end

---Gets the type of the shortcut.
---@return ShortcutType #The shortcut type.
function Shortcut:GetType() end

---Sets the data associated with the shortcut.
---@param value string The shortcut data.
function Shortcut:SetData(value) end

---Sets the type of the shortcut.
---@param value ShortcutType The new shortcut type.
function Shortcut:SetType(value) end


---Defines one of the shortcut types.
---@class ShortcutType
ShortcutType = {
	-- Specifies an undefined shortcut.
	Undefined = 0,
	-- Specifies an item shortcut.
	Item = 2,
	-- Specifies an alias shortcut.
	Alias = 4,
	-- Specifies a skill shortcut.
	Skill = 6,
	-- Specifies a pet shortcut.
	Pet = 7,
	-- Specifies a hobby shortcut.
	Hobby = 9,
}


---A standard Lord of the Rings text box.
---@class LotroTextBox : TextBox
LotroTextBox = {}

---Initializes a new TextBox
---`TextBox()` : Initializes a new TextBox
---@return LotroTextBox
Turbine.UI.Lotro.TextBox = function () end


---A standard Lord of the Rings silver window.
---@class LotroWindow : Window
LotroWindow = {}

---Initializes a new Window
---`Window()` : Initializes a new Window
---@return LotroWindow
Turbine.UI.Lotro.Window = function () end

---Gets if the window is resizable.
---@return boolean #True if the window can be resized.
function LotroWindow:IsResizable() end

---Sets if the window is resizable.
---@param value boolean True if the window can be resized.
function LotroWindow:SetResizable(value) end

---Sets the text of the window.
---@param value string The text of the window.
function LotroWindow:SetText(value) end


---Defines a menu item.
---@class MenuItem : Object
MenuItem = {}

---Constructs a new menu item.
---`MenuItem(text)` : Constructs a new menu item.
---`MenuItem(text, enabled)` : Constructs a new menu item.
---`MenuItem(text, enabled, checked)` : Constructs a new menu item.
---@overload fun(text:string):MenuItem
---@overload fun(text:string, enabled:boolean):MenuItem
---@param text string The text to use for the menu item.
---@param enabled boolean Flag indicating if the menu item is enabled.
---@param checked boolean Flag indicating if the menu item is checked.
---@return MenuItem
Turbine.UI.MenuItem = function (text, enabled, checked) end

---Gets the text of the menu item.
---@return string #The text displayed for the item.
function MenuItem:GetText() end

---Gets a flag indicating if the menu item is checked.
---@return boolean #True if the menu item is checked.
function MenuItem:IsChecked() end

---Gets a flag indicating if the menu item is enabled.
---@return boolean #True if the menu item is enabled.
function MenuItem:IsEnabled() end

---Sets a flag indicating if the menu item is checked.
---@param value boolean True if the menu item is checked.
function MenuItem:SetChecked(value) end

---Sets a flag indicating if the menu item is enabled.
---@param value boolean True if the menu item is enabled.
function MenuItem:SetEnabled(value) end

---Sets the text of the menu item.
---@param value string The text displayed for the item.
function MenuItem:SetText(value) end


---Defines a list of menu items.
---@class MenuItemList : Object
MenuItemList = {}

---Initializes a new MenuItemList
---`MenuItemList()` : Initializes a new MenuItemList
---@return MenuItemList
Turbine.UI.MenuItemList = function () end

---Adds a menu item.
---@param item MenuItem The menu item to add.
function MenuItemList:Add(item) end

---Clears the items from the list.
function MenuItemList:Clear() end

---Test is the list contains a specific menu item.
---@param item MenuItem The item to check for.
---@return boolean #True if the item is contained in the list.
function MenuItemList:Contains(item) end

---Gets the item at the specified index.
---@param index number The index of the item to retrieve.
---@return MenuItem #The menu item at the specified index.
function MenuItemList:Get(index) end

---Gets the number of menu items.
---@return number #The number of menu items.
function MenuItemList:GetCount() end

---Gets the index of a menu item in the list.
---@param item MenuItem The item to get the index of.
---@return number #The index of the item in the list or -1 if it does not exist in the list.
function MenuItemList:IndexOf(item) end

---Inserts a menu item at a given index.
---@param index number The index to insert the item at.
---@param item MenuItem The menu item to insert.
function MenuItemList:Insert(index, item) end

---Removes a menu item from the list.
---@param item MenuItem The item to remove.
function MenuItemList:Remove(item) end

---Removes a menu item at the specified index.
---@param index number The index of the item to remove.
function MenuItemList:RemoveAt(index) end

---Sets the menu item at the specified index.
---@param index number The index of the menu item to set.
---@param item MenuItem The item to set.
function MenuItemList:Set(index, item) end


---Defines one of the mouse buttons.
---@class MouseButton
MouseButton = {
	-- Specifies the left button.
	Left = 1,
	-- Specifies the right button.
	Right = 2,
	-- Specifies the middle button.
	Middle = 4,
}


---Specifies orientation of objects.
---@class Orientation
Orientation = {
	-- Specifies a horizontal layout.
	Horizontal = 0,
	-- Specifies a vertical layout.
	Vertical = 1,
}


---A control for scrolling contents.
---@class ScrollBar : Control
ScrollBar = {}

---Initializes a new ScrollBar
---`ScrollBar()` : Initializes a new ScrollBar
---@return ScrollBar
Turbine.UI.ScrollBar = function () end

---Gets the button that is used to decrement the value.
---@return Object #The button to decrement the value.
function ScrollBar:GetDecrementButton() end

---Gets the button that is used to increment the value.
---@return Object #The button to increment the value.
function ScrollBar:GetIncrementButton() end

---Gets the large change value of the scrollbar.
---@return number #The large change value of the scroll bar.
function ScrollBar:GetLargeChange() end

---Gets the maximum value of the scrollbar.
---@return number #The maximum value of the scroll bar.
function ScrollBar:GetMaximum() end

---Gets the minimum value of the scrollbar.
---@return number #The minimum value of the scroll bar.
function ScrollBar:GetMinimum() end

---Gets the orientation of the scroll bar.
---@return number #The current orientation of the scrollbar.
function ScrollBar:GetOrientation() end

---Gets the small change value of the scrollbar.
---@return number #The small change value of the scroll bar.
function ScrollBar:GetSmallChange() end

---Gets the thumb button.
---@return Object #The button to drag the value.
function ScrollBar:GetThumbButton() end

---Gets the current value of the scrollbar.
---@return number #The current value of the scroll bar.
function ScrollBar:GetValue() end

---Sets the button that is used to decrement the value.
---@param value Object The button to decrement the value.
function ScrollBar:SetDecrementButton(value) end

---Sets the button that is used to increment the value.
---@param value Object The button to increment the value.
function ScrollBar:SetIncrementButton(value) end

---Sets the large change value of the scrollbar.
---@param value number The large change value of the scroll bar.
function ScrollBar:SetLargeChange(value) end

---Sets the maximum value of the scrollbar.
---@param value number The maximum value of the scroll bar.
function ScrollBar:SetMaximum(value) end

---Sets the minimum value of the scrollbar.
---@param value number The minimum value of the scroll bar.
function ScrollBar:SetMinimum(value) end

---Sets the orientation of the scroll bar.
---@param value number The orientation of the scrollbar.
function ScrollBar:SetOrientation(value) end

---Sets the small change value of the scrollbar.
---@param value number The small change value of the scroll bar.
function ScrollBar:SetSmallChange(value) end

---Sets the thumb button.
---@param value Object The button to drag the value.
function ScrollBar:SetThumbButton(value) end

---Sets the current value of the scrollbar.
---@param value number The current value of the scroll bar.
function ScrollBar:SetValue(value) end


---Defines a control that can be scrolled.
---@class ScrollableControl : Control
ScrollableControl = {}

---Initializes a new ScrollableControl
---`ScrollableControl()` : Initializes a new ScrollableControl
---@return ScrollableControl
Turbine.UI.ScrollableControl = function () end

---Gets the horizontal scroll bar.
---@return Object #The horizontal scroll bar.
function ScrollableControl:GetHorizontalScrollBar() end

---Gets the vertical scroll bar.
---@return Object #The vertical scroll bar.
function ScrollableControl:GetVerticalScrollBar() end

---Sets the horizontal scroll bar.
---@param value Object The horizontal scroll bar to use.
function ScrollableControl:SetHorizontalScrollBar(value) end

---Sets the vertical scroll bar.
---@param value Object The vertical scroll bar to use.
function ScrollableControl:SetVerticalScrollBar(value) end


---A control for inputting text.
---@class TextBox : Label
TextBox = {}

---Initializes a new TextBox
---`TextBox()` : Initializes a new TextBox
---@return TextBox
Turbine.UI.TextBox = function () end

---Gets a flag indicating if the text in the control is read only.
---@return boolean #True if the control is read only.
function TextBox:IsReadOnly() end

---Sets a flag indicating if the text in the control is read only.
---@param value boolean True to set the control to read only.
function TextBox:SetReadOnly(value) end


---The base for any element that will be part of a tree view control.
---@class TreeNode : Control
TreeNode = {}

---Initializes a new TreeNode
---`TreeNode()` : Initializes a new TreeNode
---@return TreeNode
Turbine.UI.TreeNode = function () end

---Collapses the node.
function TreeNode:Collapse() end

---Collapses all the child tree nodes.
function TreeNode:CollapseAll() end

---Ensures that the node is visible within its tree.
function TreeNode:EnsureVisible() end

---Expands the node.
function TreeNode:Expand() end

---Expands all the child tree nodes.
function TreeNode:ExpandAll() end

---Gets the child nodes list.
---@return TreeNodeList #The list of child nodes.
function TreeNode:GetChildNodes() end

---Gets the parent node of this node.
---@return TreeNode #The parent TreeNode for this node. If this is a root node this will return nil.
function TreeNode:GetParentNode() end

---Gets a flag indicating if this node is currently expanded.
---@return boolean #True if this node is currently expanded.
function TreeNode:IsExpanded() end

---Return true if this node is currently selected.
---@return boolean #True if this node is currently selected.
function TreeNode:IsSelected() end

---Sets the flag indicating if this node is currently expanded.
---@param value boolean True if this node should be expanded.
function TreeNode:SetExpanded(value) end


---Defines a list of controls.
---@class TreeNodeList : Object
TreeNodeList = {}

---Initializes a new TreeNodeList
---`TreeNodeList()` : Initializes a new TreeNodeList
---@return TreeNodeList
Turbine.UI.TreeNodeList = function () end

---Adds a tree node.
---@param node TreeNode The tree node to add.
function TreeNodeList:Add(node) end

---Clears the nodes from the list.
function TreeNodeList:Clear() end

---Test is the list contains a specific tree node.
---@param node TreeNode The node to check for.
---@return boolean #True if the node is contained in the list.
function TreeNodeList:Contains(node) end

---Gets the node at the specified index.
---@param index number The index of the node to retrieve.
---@return TreeNode #The tree node at the specified index.
function TreeNodeList:Get(index) end

---Gets the number of tree nodes.
---@return number #The number of tree nodes.
function TreeNodeList:GetCount() end

---Gets the index of a tree node in the list.
---@param node TreeNode The node to get the index of.
---@return number #The index of the node in the list or -1 if it does not exist in the list.
function TreeNodeList:IndexOf(node) end

---Removes a tree node from the list.
---@param node TreeNode The node to remove.
function TreeNodeList:Remove(node) end

---Removes a tree node at the specified index.
---@param index number The index of the node to remove.
function TreeNodeList:RemoveAt(index) end


---A control to display data in a tree.
---@class TreeView : ScrollableControl
TreeView = {}

---Initializes a new TreeView
---`TreeView()` : Initializes a new TreeView
---@return TreeView
Turbine.UI.TreeView = function () end

---Collapses all nodes in the tree view.
function TreeView:CollapseAll() end

---Expands all nodes in the tree view.
function TreeView:ExpandAll() end

---Gets a filter used to filter tree items.
---@return Object #The filter used to filter tree items.
function TreeView:GetFilter() end

---Gets the width of the indentation insert prefer nodes at each level in the tree.
---@return number #The width in pixels to indent nested levels of tree nodes.
function TreeView:GetIndentationWidth() end

---Gets the root nodes in the tree view control.
---@return TreeNodeList #The collection of root nodes in the tree view.
function TreeView:GetNodes() end

---Gets the currently selected node.
---@return TreeNode #The currently selected node.
function TreeView:GetSelectedNode() end

---Gets a function that is used to sort tree elements.
---@return Object #The function to sort tree elements.
function TreeView:GetSortMethod() end

---Causes the tree view to refilter and resort.
function TreeView:Refresh() end

---Sets a filter used to filter tree items.
---@param value Object The filter used to filter tree items.
function TreeView:SetFilter(value) end

---Sets the width of the indentation insert prefer nodes at each level in the tree.
---@param value number The width in pixels to indent nested levels of tree nodes.
function TreeView:SetIndentationWidth(value) end

---Sets the currently selected node.
---@param value TreeNode The node to select.
function TreeView:SetSelectedNode(value) end

---Sets a function that is used to sort tree elements. This function needs to enforce consistent ordering or there is a potential for a client crash.
---@param value Object The function to sort tree elements.
function TreeView:SetSortMethod(value) end


---Specifies how to perform vertical layouts.
---@class VerticalLayout
VerticalLayout = {
	-- Layout starting at the top and working down.
	TopToBottom = 0,
	-- Layout starting at the bottom and working up.
	BottomToTop = 1,
}


---A top level window control.
---@class Window : Control
Window = {}

---Initializes a new Window
---`Window()` : Initializes a new Window
---@return Window
Turbine.UI.Window = function () end

---Activates a window, bringing it to the front.
function Window:Activate() end

---Closes the window.
function Window:Close() end

---Gets the maximum height of the window.
---@return number #The maximum height of the window.
function Window:GetMaximumHeight() end

---Gets the maximum size of the window.
---@return number #The maximum width and height as a pair of integers.
---@return number #
function Window:GetMaximumSize() end

---Gets the maximum width of the window.
---@return number #The maximum width of the window.
function Window:GetMaximumWidth() end

---Gets the minimum height of the window.
---@return number #The minimum height of the window.
function Window:GetMinimumHeight() end

---Gets the minimum size of the window.
---@return number #The minimum width and height as a pair of integers.
---@return number #
function Window:GetMinimumSize() end

---Gets the minimum width of the window.
---@return number #The minimum width of the window.
function Window:GetMinimumWidth() end

---Gets the text of the window.
---@return string #The text of the window.
function Window:GetText() end

---Sets the maximum height of the window.
---@param value number The maximum height of the window.
function Window:SetMaximumHeight(value) end

---Sets the maximum size of the window.
---@param width number The desired maximum width.
---@param height number The desired maximum height.
function Window:SetMaximumSize(width, height) end

---Sets the maximum width of the window.
---@param value number The maximum width of the window.
function Window:SetMaximumWidth(value) end

---Sets the minimum height of the window.
---@param value number The minimum height of the window.
function Window:SetMinimumHeight(value) end

---Sets the minimum size of the window.
---@param width number The desired minimum width.
---@param height number The desired minimum height.
function Window:SetMinimumSize(width, height) end

---Sets the minimum width of the window.
---@param value number The minimum width of the window.
function Window:SetMinimumWidth(value) end

---Sets the text of the window.
---@param value string The text of the window.
function Window:SetText(value) end
