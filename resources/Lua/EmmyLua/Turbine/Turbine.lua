---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine.html)
---The core Turbine API package.
---@class Turbine
---@field public Chat Chat This class provides events for when messages are received through the game. This includes player chat, tells, in game messages, and announcements.
---@field public ChatType ChatType Defines the type of chat data.
---@field public DataScope DataScope Defines the scope of plugin data.
---@field public Engine Engine Provides engine level information to user plugins.
---@field public Gameplay Gameplay Provides classes for accessing game related information.
---@field public Language Language Defines the client languages.
---@field public LotroPluginManager LotroPluginManager Provides access to plugin management methods.
---@field public Object Object | function The base object class for API classes.
---@field public Plugin Plugin Provides information about a specific plugin that has been loaded.
---@field public PluginData PluginData Provides the ability to save and load plugin data.
---@field public PluginManager PluginManager Provides access to plugin management methods.
---@field public Shell Shell Provides programmer extensibility to the chat window.
---@field public ShellCommand ShellCommand | function A command that can be register for use in the chat window.
---@field public UI UI The core UI package that allows users to create low level controls.
Turbine = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Chat$Members.html)
---This class provides events for when messages are received through the game. This includes player chat,
---              tells, in game messages, and announcements.
---@class Chat : Object
Chat = {}

---This event is fired whenever a chat message is received.
---@param sender table The event sender.
---@param args EventChatReceivedArgsTable The event arguments
Chat.Received = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_ChatType.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_DataScope.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Engine$Members.html)
---Provides engine level information to user plugins.
---@class Engine
Engine = {}

---Gets the current callstack.
---@vararg any
---@return string #The current callstack.
Engine.GetCallStack = function (...) end

---Gets the current date.
---@return EngineGetDateTable #Returns a table containing information about the current date. The following fields are available: Year, Month, Day, Hour, Minute, Second, DayOfWeek, DayOfYear, and IsDST.
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay.html)
---Provides classes for accessing game related information.
---@class Gameplay
---@field public ActiveSkill ActiveSkill Information about an active player's skill.
---@field public Actor Actor Base class for any entity that interacts in the world.
---@field public Alignment Alignment The alignment of a player.
---@field public Attributes Attributes Provides classes for accessing game related information.
---@field public Backpack Backpack Provides access to a player's backpack.
---@field public Bank Bank A container of items that are only accessible at designated bank locations.
---@field public BasicMount BasicMount A basic mount.
---@field public Class Class The Class of a player.
---@field public ClassAttributes ClassAttributes Base class for class information.
---@field public CombatMount CombatMount A mount that can be used in combat.
---@field public CraftTier CraftTier A crafting tier.
---@field public Effect Effect Represents an effect that can be applied to an entity.
---@field public EffectCategory EffectCategory Describes the category of an effect.
---@field public EffectList EffectList A utility class used by Actors to hold the list of effects.
---@field public Entity Entity Base class for any entity in the game.
---@field public EntityReference EntityReference 
---@field public Equipment Equipment Provides access to a player's equipment.
---@field public GambitSkill GambitSkill Information about a gambit skill.
---@field public GambitSkillInfo GambitSkillInfo Information about a gambit skill.
---@field public Item Item An item that a user can have.
---@field public ItemCategory ItemCategory Describes the category of an item.
---@field public ItemDurability ItemDurability Describes the durability of an item.
---@field public ItemInfo ItemInfo Container for various item information.
---@field public ItemQuality ItemQuality Describes the quality of an item.
---@field public ItemWearState ItemWearState Describes the current wear state of an item.
---@field public LocalPlayer LocalPlayer A class that represents the local player.
---@field public Mount Mount Class representing an in game mount.
---@field public Party Party This class provides access to party information. This is either your fellowship or your tribe depending on your alliance.
---@field public PartyMember PartyMember 
---@field public Pet Pet A pet is an actor that a player owns and controls.
---@field public Player Player A class that represents a player in the game.
---@field public Profession Profession A profession a free people player can have.
---@field public ProfessionInfo ProfessionInfo Information about a profession.
---@field public PropertyHandler PropertyHandler 
---@field public Race Race The Race of a player.
---@field public ReadyState ReadyState The ready state of a player.
---@field public Recipe Recipe Information about a recipe.
---@field public RecipeIngredient RecipeIngredient Information about a recipe ingredient.
---@field public SharedStorage SharedStorage A bank that represents the player's shared storage. This storage is available to all characters on the same account.
---@field public Skill Skill Information about a skill.
---@field public SkillInfo SkillInfo Information about a skill.
---@field public SkillList SkillList A list of skills.
---@field public SkillType SkillType A type of skill.
---@field public UntrainedSkill UntrainedSkill Information about a skill the player has not trained yet.
---@field public Vault Vault A bank that represents the player's vault storage. This storage is only available to the current logged in character.
---@field public Vocation Vocation The vocation of a free people player.
---@field public Wallet Wallet Provides access to a player's wallet.
---@field public WalletItem WalletItem An item that is contained in a user's wallet.
Gameplay = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ActiveSkill$Members.html)
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

---Event fired when the reset time of a skill changes.
---@param sender table The event sender.
---@param args EventActiveSkillResetTimeChangedArgsTable The event arguments
ActiveSkill.ResetTimeChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Actor$Members.html)
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

---Event fired when the actor's base max morale changes.
---@param sender table The event sender.
---@param args EventActorBaseMaxMoraleChangedArgsTable The event arguments
Actor.BaseMaxMoraleChanged = function (sender, args) end

---Event fired when he actor's base max power changes.
---@param sender table The event sender.
---@param args EventActorBaseMaxPowerChangedArgsTable The event arguments
Actor.BaseMaxPowerChanged = function (sender, args) end

---Event fired when the actor's level changes.
---@param sender table The event sender.
---@param args EventActorLevelChangedArgsTable The event arguments
Actor.LevelChanged = function (sender, args) end

---Event fired when the actor's max morale changes.
---@param sender table The event sender.
---@param args EventActorMaxMoraleChangedArgsTable The event arguments
Actor.MaxMoraleChanged = function (sender, args) end

---Event fired when he actor's max power changes.
---@param sender table The event sender.
---@param args EventActorMaxPowerChangedArgsTable The event arguments
Actor.MaxPowerChanged = function (sender, args) end

---Event fired when the actor's max temporary morale changes.
---@param sender table The event sender.
---@param args EventActorMaxTemporaryMoraleChangedArgsTable The event arguments
Actor.MaxTemporaryMoraleChanged = function (sender, args) end

---Event fired when he actor's max temporary power changes.
---@param sender table The event sender.
---@param args EventActorMaxTemporaryPowerChangedArgsTable The event arguments
Actor.MaxTemporaryPowerChanged = function (sender, args) end

---Event fired when the actor's morale changes.
---@param sender table The event sender.
---@param args EventActorMoraleChangedArgsTable The event arguments
Actor.MoraleChanged = function (sender, args) end

---Event fired when he actor's power changes.
---@param sender table The event sender.
---@param args EventActorPowerChangedArgsTable The event arguments
Actor.PowerChanged = function (sender, args) end

---Event fired when the actor's target changes.
---@param sender table The event sender.
---@param args EventActorTargetChangedArgsTable The event arguments
Actor.TargetChanged = function (sender, args) end

---Event fired when the actor's temporary morale changes.
---@param sender table The event sender.
---@param args EventActorTemporaryMoraleChangedArgsTable The event arguments
Actor.TemporaryMoraleChanged = function (sender, args) end

---Event fired when he actor's temporary power changes.
---@param sender table The event sender.
---@param args EventActorTemporaryPowerChangedArgsTable The event arguments
Actor.TemporaryPowerChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Alignment.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes.html)
---Provides classes for accessing game related information.
---@class Attributes : PropertyHandler
---@field public BeorningAttributes BeorningAttributes 
---@field public BlackArrowAttributes BlackArrowAttributes 
---@field public BurglarAttributes BurglarAttributes 
---@field public BurglarStance BurglarStance 
---@field public CaptainAttributes CaptainAttributes 
---@field public ChampionAttributes ChampionAttributes 
---@field public ChampionStance ChampionStance 
---@field public ChickenAttributes ChickenAttributes 
---@field public DefilerAttributes DefilerAttributes 
---@field public DwarfAttributes DwarfAttributes 
---@field public ElfAttributes ElfAttributes 
---@field public FreePeopleAttributes FreePeopleAttributes 
---@field public GuardianAttributes GuardianAttributes 
---@field public GuardianStance GuardianStance 
---@field public HighElfAttributes HighElfAttributes 
---@field public HobbitAttributes HobbitAttributes 
---@field public HunterAttributes HunterAttributes 
---@field public HunterStance HunterStance 
---@field public LoreMasterAttributes LoreMasterAttributes 
---@field public ManAttributes ManAttributes 
---@field public MinstrelAttributes MinstrelAttributes 
---@field public MinstrelStance MinstrelStance 
---@field public MonsterPlayerAttributes MonsterPlayerAttributes 
---@field public RangerAttributes RangerAttributes 
---@field public ReaverAttributes ReaverAttributes 
---@field public RuneKeeperAttributes RuneKeeperAttributes 
---@field public StalkerAttributes StalkerAttributes 
---@field public StoutAxeAttributes StoutAxeAttributes 
---@field public TrollAttributes TrollAttributes 
---@field public WarLeaderAttributes WarLeaderAttributes 
---@field public WardenAttributes WardenAttributes 
---@field public WardenStance WardenStance 
---@field public WeaverAttributes WeaverAttributes 
Attributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_BeorningAttributes$Members.html)
---@class BeorningAttributes : ClassAttributes
BeorningAttributes = {}

---Gets the current wrath amount of a Beorning.
---@return number #The current wrath amount of a Beorning.
function BeorningAttributes:GetWrath() end

---Returns true if the Beorning is in bear form.
---@return boolean #True if the Beorning is in bear form.
function BeorningAttributes:IsInBearForm() end

---Event fired when the form state of the Beorning changes.
---@param sender table The event sender.
---@param args EventBeorningAttributesFormChangedArgsTable The event arguments
BeorningAttributes.FormChanged = function (sender, args) end

---Event fired when the wrath level of a Beorning has changed.
---@param sender table The event sender.
---@param args EventBeorningAttributesWrathChangedArgsTable The event arguments
BeorningAttributes.WrathChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_BlackArrowAttributes$Members.html)
---@class BlackArrowAttributes : ClassAttributes
BlackArrowAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_BurglarAttributes$Members.html)
---@class BurglarAttributes : ClassAttributes
BurglarAttributes = {}

---Gets the current stance.
---@return number #The current stance.
function BurglarAttributes:GetStance() end

---Returns true if the first tier critical skills are usable.
---@return boolean #True if the first tier critical skills are usable.
function BurglarAttributes:IsCriticalTier1Available() end

---Returns true if the second tier critical skills are usable.
---@return boolean #True if the second tier critical skills are usable.
function BurglarAttributes:IsCriticalTier2Available() end

---Event fired when the critical tier 1 availability has changed.
---@param sender table The event sender.
---@param args EventBurglarAttributesIsCriticalTier1ChangedArgsTable The event arguments
BurglarAttributes.IsCriticalTier1Changed = function (sender, args) end

---Event fired when the critical tier 2 availability has changed.
---@param sender table The event sender.
---@param args EventBurglarAttributesIsCriticalTier2ChangedArgsTable The event arguments
BurglarAttributes.IsCriticalTier2Changed = function (sender, args) end

---Event fired when the stance changes.
---@param sender table The event sender.
---@param args EventBurglarAttributesStanceChangedArgsTable The event arguments
BurglarAttributes.StanceChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_BurglarStance.html)
---@class BurglarStance
BurglarStance = {
	-- No stance.
	None = 0,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_CaptainAttributes$Members.html)
---@class CaptainAttributes : ClassAttributes
CaptainAttributes = {}

---Returns true if the champion is ready to respond to defeating an enemy.
---@return boolean #True if the champion is ready to respond to defeating an enemy.
function CaptainAttributes:IsInEnemyDefeatResponse() end

---Returns true if the champion is ready to respond to a fellow being defeated.
---@return boolean #True if the champion is ready to respond to a fellow being defeated.
function CaptainAttributes:IsInFellowDefeatResponse() end

---Returns true if the first tier readied skills are usable.
---@return boolean #True if the first tier readied skills are usable.
function CaptainAttributes:IsReadiedTier1Available() end

---Returns true if the second tier readied skills are usable.
---@return boolean #True if the second tier readied skills are usable.
function CaptainAttributes:IsReadiedTier2Available() end

---Event fired when the enemy defeat response changes.
---@param sender table The event sender.
---@param args EventCaptainAttributesIsInEnemyDefeatResponseChangedArgsTable The event arguments
CaptainAttributes.IsInEnemyDefeatResponseChanged = function (sender, args) end

---Event fired when the fellow defeat response changes.
---@param sender table The event sender.
---@param args EventCaptainAttributesIsInFellowDefeatResponseChangedArgsTable The event arguments
CaptainAttributes.IsInFellowDefeatResponseChanged = function (sender, args) end

---Event fired when the readied tier 1 availability has changed.
---@param sender table The event sender.
---@param args EventCaptainAttributesIsReadiedTier1ChangedArgsTable The event arguments
CaptainAttributes.IsReadiedTier1Changed = function (sender, args) end

---Event fired when the readied tier 2 availability has changed.
---@param sender table The event sender.
---@param args EventCaptainAttributesIsReadiedTier2ChangedArgsTable The event arguments
CaptainAttributes.IsReadiedTier2Changed = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_ChampionAttributes$Members.html)
---@class ChampionAttributes : ClassAttributes
ChampionAttributes = {}

---Gets the current fervor of a champion.
---@return number #The current fervor of a champion.
function ChampionAttributes:GetFervor() end

---Gets the current stance.
---@return number #The current stance.
function ChampionAttributes:GetStance() end

---Event fired when the fervor of a champion has changed.
---@param sender table The event sender.
---@param args EventChampionAttributesFervorChangedArgsTable The event arguments
ChampionAttributes.FervorChanged = function (sender, args) end

---Event fired when the stance changes.
---@param sender table The event sender.
---@param args EventChampionAttributesStanceChangedArgsTable The event arguments
ChampionAttributes.StanceChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_ChampionStance.html)
---@class ChampionStance
ChampionStance = {
	-- No stance.
	None = 0,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_ChickenAttributes$Members.html)
---@class ChickenAttributes : ClassAttributes
ChickenAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_DefilerAttributes$Members.html)
---@class DefilerAttributes : ClassAttributes
DefilerAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_DwarfAttributes$Members.html)
---@class DwarfAttributes : Attributes
DwarfAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_ElfAttributes$Members.html)
---@class ElfAttributes : Attributes
ElfAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_FreePeopleAttributes$Members.html)
---@class FreePeopleAttributes : Attributes
FreePeopleAttributes = {}

---Gets the modified agility of the player.
---@return number #The modified agility of the player.
function FreePeopleAttributes:GetAgility() end

---Gets the armor value of the player.
---@return number #The armor value of the player.
function FreePeopleAttributes:GetArmor() end

---Gets the unmodified agility of the player.
---@return number #The unmodified agility of the player.
function FreePeopleAttributes:GetBaseAgility() end

---Gets the base armor value of the player.
---@return number #The base armor value of the player.
function FreePeopleAttributes:GetBaseArmor() end

---Gets the unmodified fate of the player.
---@return number #The unmodified fate of the player.
function FreePeopleAttributes:GetBaseFate() end

---Gets the unmodified might of the player.
---@return number #The unmodified might of the player.
function FreePeopleAttributes:GetBaseMight() end

---Gets the base resistance of the player.
---@return number #The base resistance of the player.
function FreePeopleAttributes:GetBaseResistance() end

---Gets the unmodified vitality of the player.
---@return number #The unmodified vitality of the player.
function FreePeopleAttributes:GetBaseVitality() end

---Gets the unmodified will of the player.
---@return number #The unmodified will of the player.
function FreePeopleAttributes:GetBaseWill() end

---Gets the destiny points of the player.
---@return number #. The destiny points of the player.
function FreePeopleAttributes:GetDestinyPoints() end

---Gets the disease resistance of the player.
---@return number #The disease resistance of the player.
function FreePeopleAttributes:GetDiseaseResistance() end

---Gets the modified fate of the player.
---@return number #The modified fate of the player.
function FreePeopleAttributes:GetFate() end

---Gets the fear resistance of the player.
---@return number #The fear resistance of the player.
function FreePeopleAttributes:GetFearResistance() end

---Gets the modified might of the player.
---@return number #The modified might of the player.
function FreePeopleAttributes:GetMight() end

---Gets the money of the player in copper.
---@return number #. The money of the player in copper.
function FreePeopleAttributes:GetMoney() end

---Gets the money of the player in copper, silver, gold.
---@return number #copper
---@return number #silver
---@return number #gold
function FreePeopleAttributes:GetMoneyComponents() end

---Gets the poison resistance of the player.
---@return number #The poison resistance of the player.
function FreePeopleAttributes:GetPoisonResistance() end

---Gets information about a player's profession.
---@param profession number 
---@return ProfessionInfo #The profession information for the specified profession if that player has that profession. If the player does not have that profession, nil will be returned.
function FreePeopleAttributes:GetProfessionInfo(profession) end

---Gets the modified vitality of the player.
---@return number #The modified vitality of the player.
function FreePeopleAttributes:GetVitality() end

---Gets the current vocation of the player.
---@return number #The current vocation of the player.
function FreePeopleAttributes:GetVocation() end

---Gets the modified will of the player.
---@return number #The modified will of the player.
function FreePeopleAttributes:GetWill() end

---Gets the wound resistance of the player.
---@return number #The wound resistance of the player.
function FreePeopleAttributes:GetWoundResistance() end

----Get the acid mitigation of the player
---@return number #the acid mitigation of the player
function FreePeopleAttributes:GetAcidMitigation() end

---Get the base critical hit avoidance of the player
---@return number #the base critical hit avoidance of the player
function FreePeopleAttributes:GetBaseCriticalHitAvoidance() end

---Get the base critical hit chance of the player
---@return number #the base critical hit chance of the player
function FreePeopleAttributes:GetBaseCriticalHitChance() end

---Get the block of the player
---@return number #the block of the player
function FreePeopleAttributes:GetBlock() end

---Get the common mitigation of the player
---@return number #the common mitigation of the player
function FreePeopleAttributes:GetCommonMitigation() end

---Get the evade of the player
---@return number #the evade of the player
function FreePeopleAttributes:GetEvade() end

---Get the finesse of the player
---@return number #the finesse of the player
function FreePeopleAttributes:GetFinesse() end

---Get the fire mitigation of the player
---@return number #the fire mitigation of the player
function FreePeopleAttributes:GetFireMitigation() end

---Get the frost mitigation of the player
---@return number #the frost mitigation of the player
function FreePeopleAttributes:GetFrostMitigation() end

---Get the in combat morale regeneration of the player
---@return number #the in combat morale regeneration of the player
function FreePeopleAttributes:GetInCombatMoraleRegeneration() end

---Get the in combat power regeneration of the player
---@return number #the in combat power regeneration of the player
function FreePeopleAttributes:GetInCombatPowerRegeneration() end

---Get the incoming healing of the player
---@return number #the incoming healing of the player
function FreePeopleAttributes:GetIncomingHealing() end

---Get the lightning mitigation of the player
---@return number #the lightning mitigation of the player
function FreePeopleAttributes:GetLightningMitigation() end

---Get the melee critical hit avoidance of the player
---@return number #the melee critical hit avoidance of the player
function FreePeopleAttributes:GetMeleeCriticalHitAvoidance() end

---Get the melee critical hit chance of the player
---@return number #the melee critical hit chance of the player
function FreePeopleAttributes:GetMeleeCriticalHitChance() end

---Get the melee damage of the player
---@return number #the melee damage of the player
function FreePeopleAttributes:GetMeleeDamage() end

---Get the melee defence of the player
---@return number #the melee defence of the player
function FreePeopleAttributes:GetMeleeDefence() end

---Get the out of combat morale regeneration of the player
---@return number #the out of combat morale regeneration of the player
function FreePeopleAttributes:GetOutOfCombatMoraleRegeneration() end

---Get the out of combat power regeneration of the player
---@return number #the out of combat power regeneration of the player
function FreePeopleAttributes:GetOutOfCombatPowerRegeneration() end

---Get the outgoing healing of the player
---@return number #the outgoing healing of the player
function FreePeopleAttributes:GetOutgoingHealing() end

---Get the parry of the player
---@return number #the parry of the player
function FreePeopleAttributes:GetParry() end

---Get the physical mitigation of the player
---@return number #the physical mitigation of the player
function FreePeopleAttributes:GetPhysicalMitigation() end

---Get the range critical hit avoidance of the player
---@return number #the range critical hit avoidance of the player
function FreePeopleAttributes:GetRangeCriticalHitAvoidance() end

---Get the range critical hit chance of the player
---@return number #the range critical hit chance of the player
function FreePeopleAttributes:GetRangeCriticalHitChance() end

---Get the range damage of the player
---@return number #the range damage of the player
function FreePeopleAttributes:GetRangeDamage() end

---Get the range defence of the player
---@return number #the range defence of the player
function FreePeopleAttributes:GetRangeDefence() end

---Get the shadow mitigation of the player
---@return number #the shadow mitigation of the player
function FreePeopleAttributes:GetShadowMitigation() end

---Get the tactical critical hit avoidance of the player
---@return number #the tactical critical hit avoidance of the player
function FreePeopleAttributes:GetTacticalCriticalHitAvoidance() end

---Get the tactical critical hit chance of the player
---@return number #the tactical critical hit chance of the player
function FreePeopleAttributes:GetTacticalCriticalHitChance() end

---Get the tactical damage of the player
---@return number #the tactical damage of the player
function FreePeopleAttributes:GetTacticalDamage() end

---Get the tactical defence of the player
---@return number #the tactical defence of the player
function FreePeopleAttributes:GetTacticalDefence() end

---Get the tactical mitigation of the player
---@return number #the tactical mitigation of the player
function FreePeopleAttributes:GetTacticalMitigation() end

---@return boolean 
function FreePeopleAttributes:CanBlock() end

---@return boolean 
function FreePeopleAttributes:CanEvade() end

---@return boolean 
function FreePeopleAttributes:CanParry() end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_GuardianAttributes$Members.html)
---@class GuardianAttributes : ClassAttributes
GuardianAttributes = {}

---Gets the current stance.
---@return number #The current stance.
function GuardianAttributes:GetStance() end

---Returns true if the first tier block skills are usable.
---@return boolean #True if the first tier block skills are usable.
function GuardianAttributes:IsBlockTier1Available() end

---Returns true if the second tier block skills are usable.
---@return boolean #True if the second tier block skills are usable.
function GuardianAttributes:IsBlockTier2Available() end

---Returns true if the third tier block skills are usable.
---@return boolean #True if the third tier block skills are usable.
function GuardianAttributes:IsBlockTier3Available() end

---Returns true if the first tier parry skills are usable.
---@return boolean #True if the first tier parry skills are usable.
function GuardianAttributes:IsParryTier1Available() end

---Returns true if the second tier parry skills are usable.
---@return boolean #True if the second tier parry skills are usable.
function GuardianAttributes:IsParryTier2Available() end

---Returns true if the third tier parry skills are usable.
---@return boolean #True if the third tier parry skills are usable.
function GuardianAttributes:IsParryTier3Available() end

---Event fired when the block tier 1 availability has changed.
---@param sender table The event sender.
---@param args EventGuardianAttributesIsBlockTier1AvailableChangedArgsTable The event arguments
GuardianAttributes.IsBlockTier1AvailableChanged = function (sender, args) end

---Event fired when the block tier 2 availability has changed.
---@param sender table The event sender.
---@param args EventGuardianAttributesIsBlockTier2AvailableChangedArgsTable The event arguments
GuardianAttributes.IsBlockTier2AvailableChanged = function (sender, args) end

---Event fired when the block tier 2 availability has changed.
---@param sender table The event sender.
---@param args EventGuardianAttributesIsBlockTier3AvailableChangedArgsTable The event arguments
GuardianAttributes.IsBlockTier3AvailableChanged = function (sender, args) end

---Event fired when the parry tier 1 availability has changed.
---@param sender table The event sender.
---@param args EventGuardianAttributesIsParryTier1AvailableChangedArgsTable The event arguments
GuardianAttributes.IsParryTier1AvailableChanged = function (sender, args) end

---Event fired when the parry tier 2 availability has changed.
---@param sender table The event sender.
---@param args EventGuardianAttributesIsParryTier2AvailableChangedArgsTable The event arguments
GuardianAttributes.IsParryTier2AvailableChanged = function (sender, args) end

---Event fired when the parry tier 2 availability has changed.
---@param sender table The event sender.
---@param args EventGuardianAttributesIsParryTier3AvailableChangedArgsTable The event arguments
GuardianAttributes.IsParryTier3AvailableChanged = function (sender, args) end

---Event fired when the stance changes.
---@param sender table The event sender.
---@param args EventGuardianAttributesStanceChangedArgsTable The event arguments
GuardianAttributes.StanceChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_GuardianStance.html)
---@class GuardianStance
GuardianStance = {
	-- No stance.
	None = 0,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_HighElfAttributes$Members.html)
---@class HighElfAttributes : Attributes
HighElfAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_HobbitAttributes$Members.html)
---@class HobbitAttributes : Attributes
HobbitAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_HunterAttributes$Members.html)
---@class HunterAttributes : ClassAttributes
HunterAttributes = {}

---Gets the current focus of a hunter.
---@return number #The current focus of a hunter.
function HunterAttributes:GetFocus() end

---Gets the current stance.
---@return number #The current stance.
function HunterAttributes:GetStance() end

---Event fired when the focus of a hunter has changed.
---@param sender table The event sender.
---@param args EventHunterAttributesFocusChangedArgsTable The event arguments
HunterAttributes.FocusChanged = function (sender, args) end

---Event fired when the stance changes.
---@param sender table The event sender.
---@param args EventHunterAttributesStanceChangedArgsTable The event arguments
HunterAttributes.StanceChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_HunterStance.html)
---@class HunterStance
HunterStance = {
	-- No stance.
	None = 0,
	-- Precision stance.
	Precision = 1,
	-- Strength stance.
	Strength = 2,
	-- Endurance stance.
	Endurance = 3,
}

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_LoreMasterAttributes$Members.html)
---@class LoreMasterAttributes : ClassAttributes
LoreMasterAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_ManAttributes$Members.html)
---@class ManAttributes : Attributes
ManAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_MinstrelAttributes$Members.html)
---@class MinstrelAttributes : ClassAttributes
MinstrelAttributes = {}

---Gets the current stance.
---@return number #The current stance.
function MinstrelAttributes:GetStance() end

---Returns true if the first tier serenade skills are usable.
---@return boolean #True if the first tier serenade skills are usable.
function MinstrelAttributes:IsSerenadeTier1Available() end

---Returns true if the second tier serenade skills are usable.
---@return boolean #True if the second tier serenade skills are usable.
function MinstrelAttributes:IsSerenadeTier2Available() end

---Returns true if the third tier serenade skills are usable.
---@return boolean #True if the third tier serenade skills are usable.
function MinstrelAttributes:IsSerenadeTier3Available() end

---Event fired when the serenade tier 1 availability has changed.
---@param sender table The event sender.
---@param args EventMinstrelAttributesIsSerenadeTier1ChangedArgsTable The event arguments
MinstrelAttributes.IsSerenadeTier1Changed = function (sender, args) end

---Event fired when the serenade tier 2 availability has changed.
---@param sender table The event sender.
---@param args EventMinstrelAttributesIsSerenadeTier2ChangedArgsTable The event arguments
MinstrelAttributes.IsSerenadeTier2Changed = function (sender, args) end

---Event fired when the serenade tier 2 availability has changed.
---@param sender table The event sender.
---@param args EventMinstrelAttributesIsSerenadeTier3ChangedArgsTable The event arguments
MinstrelAttributes.IsSerenadeTier3Changed = function (sender, args) end

---Event fired when the stance changes.
---@param sender table The event sender.
---@param args EventMinstrelAttributesStanceChangedArgsTable The event arguments
MinstrelAttributes.StanceChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_MinstrelStance.html)
---@class MinstrelStance
MinstrelStance = {
	-- No stance.
	None = 0,
	-- WarSpeech stance.
	WarSpeech = 1,
	-- Harmony stance.
	Harmony = 2,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_MonsterPlayerAttributes$Members.html)
---@class MonsterPlayerAttributes : Attributes
MonsterPlayerAttributes = {}

---Gets the destiny points of the player.
---@return number #. The destiny points of the player.
function MonsterPlayerAttributes:GetDestinyPoints() end

---Gets the money of the player in copper.
---@return number #. The money of the player in copper.
function MonsterPlayerAttributes:GetMoney() end

---Gets the money of the player in copper, silver, gold.
---@return number #copper
---@return number #silver
---@return number #gold
function MonsterPlayerAttributes:GetMoneyComponents() end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_RangerAttributes$Members.html)
---@class RangerAttributes : ClassAttributes
RangerAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_ReaverAttributes$Members.html)
---@class ReaverAttributes : ClassAttributes
ReaverAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_RuneKeeperAttributes$Members.html)
---@class RuneKeeperAttributes : ClassAttributes
RuneKeeperAttributes = {}

---Gets the current attunement of a Rune-Keeper.
---@return number #The current attunement of a Rune-Keeper.
function RuneKeeperAttributes:GetAttunement() end

---Returns true if the Rune-Keeper is charged.
---@return boolean #True if the Rune-Keeper is charged.
function RuneKeeperAttributes:IsCharged() end

---Event fired when the attunement of a Rune-Keeper has changed.
---@param sender table The event sender.
---@param args EventRuneKeeperAttributesAttunementChangedArgsTable The event arguments
RuneKeeperAttributes.AttunementChanged = function (sender, args) end

---Event fired when the charge state of the Rune-Keeper changes.
---@param sender table The event sender.
---@param args EventRuneKeeperAttributesIsChargedChangedArgsTable The event arguments
RuneKeeperAttributes.IsChargedChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_StalkerAttributes$Members.html)
---@class StalkerAttributes : ClassAttributes
StalkerAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_StoutAxeAttributes$Members.html)
---@class StoutAxeAttributes : Attributes
StoutAxeAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_TrollAttributes$Members.html)
---@class TrollAttributes : ClassAttributes
TrollAttributes = {}

---Gets the current rampage of a Troll.
---@return number #The current rampage of a Troll.
function TrollAttributes:GetRampage() end

---Event fired when the rampage of a Troll has changed.
---@param sender table The event sender.
---@param args EventTrollAttributesRampageChangedArgsTable The event arguments
TrollAttributes.RampageChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_WarLeaderAttributes$Members.html)
---@class WarLeaderAttributes : ClassAttributes
WarLeaderAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_WardenAttributes$Members.html)
---@class WardenAttributes : ClassAttributes
WardenAttributes = {}

---Gets the active gambit at the specified index.
---@param index number 
---@return number #The active gambit at the specified index.
function WardenAttributes:GetGambit(index) end

---Gets the number of gambits active.
---@return number #The number of gambits active.
function WardenAttributes:GetGambitCount() end

---Gets the maximum gambits the warden can use.
---@return number #The maximum gambits the warden can use.
function WardenAttributes:GetMaxGambitCount() end

---Gets the current stance.
---@return number #The current stance.
function WardenAttributes:GetStance() end

---Gets the list of trained gambits.
---@return SkillList #The list of trained gambits.
function WardenAttributes:GetTrainedGambits() end

---Gets the list of untrained gambits.
---@return SkillList #The list of untrained gambits.
function WardenAttributes:GetUntrainedGambits() end

---Event fired when the gambit has changed.
---@param sender table The event sender.
---@param args EventWardenAttributesGambitChangedArgsTable The event arguments
WardenAttributes.GambitChanged = function (sender, args) end

---Event fired when the number of gambit slots has changed.
---@param sender table The event sender.
---@param args EventWardenAttributesMaxGambitCountChangedArgsTable The event arguments
WardenAttributes.MaxGambitCountChanged = function (sender, args) end

---Event fired when the stance changes.
---@param sender table The event sender.
---@param args EventWardenAttributesStanceChangedArgsTable The event arguments
WardenAttributes.StanceChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_WardenStance.html)
---@class WardenStance
WardenStance = {
	-- No stance.
	None = 0,
	-- Determination stance.
	Determination = 2,
	-- Assailment stance.
	Assailment = 3,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Attributes_WeaverAttributes$Members.html)
---@class WeaverAttributes : ClassAttributes
WeaverAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Backpack$Members.html)
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

---Event fired when an item is added to the backpack.
---@param sender table The event sender.
---@param args EventBackpackItemAddedArgsTable The event arguments
Backpack.ItemAdded = function (sender, args) end

---Event fired when an item is moved in the backpack.
---@param sender table The event sender.
---@param args EventBackpackItemMovedArgsTable The event arguments
Backpack.ItemMoved = function (sender, args) end

---Event fired when an item is removed from the backpack.
---@param sender table The event sender.
---@param args EventBackpackItemRemovedArgsTable The event arguments
Backpack.ItemRemoved = function (sender, args) end

---Event fired when the size of the backpack has changed.
---@param sender table The event sender.
---@param args EventBackpackSizeChangedArgsTable The event arguments
Backpack.SizeChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Bank$Members.html)
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
---@return BankItem #Either nil if there is no item there or the index is invalid, or the Item that is in the given index.
function Bank:GetItem(index) end

---Gets a flag indicating if the bank is currently available.
---@return boolean #
function Bank:IsAvailable() end

---Handles the dropping of items into a bank.
---@param shortcut Shortcut The shortcut information that was generated as part of a drag and drop event that should contain an item to perform an action on.
---@param targetChest any The target chest the drop should occur into.
---@param split boolean Flag indicating if the item split dialog should be displayed for the operation.
function Bank:PerformShortcutDrop(shortcut, targetChest, split) end

---Event fired when the capacity of the bank has changed.
---@param sender table The event sender.
---@param args EventBankCapacityChangedArgsTable The event arguments
Bank.CapacityChanged = function (sender, args) end

---Event fired when the name of a chest has changed.
---@param sender table The event sender.
---@param args EventBankChestNameChangedArgsTable The event arguments
Bank.ChestNameChanged = function (sender, args) end

---Event fired when the count of items in the bank changes.
---@param sender table The event sender.
---@param args EventBankCountChangedArgsTable The event arguments
Bank.CountChanged = function (sender, args) end

---Event fired when the availability of the bank changes.
---@param sender table The event sender.
---@param args EventBankIsAvailableChangedArgsTable The event arguments
Bank.IsAvailableChanged = function (sender, args) end

---Event fired when an item is added to a bank.
---@param sender table The event sender.
---@param args EventBankItemAddedArgsTable The event arguments
Bank.ItemAdded = function (sender, args) end

---Event fired when an item is moved from one chest to another.
---@param sender table The event sender.
---@param args EventBankItemMovedArgsTable The event arguments
Bank.ItemMoved = function (sender, args) end

---Event fired when an item is removed from a bank.
---@param sender table The event sender.
---@param args EventBankItemRemovedArgsTable The event arguments
Bank.ItemRemoved = function (sender, args) end

---Event fired when the contents of the bank has been refreshed.
---@param sender table The event sender.
---@param args EventBankItemsRefreshedArgsTable The event arguments
Bank.ItemsRefreshed = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_BasicMount$Members.html)
---A basic mount.
---@class BasicMount : Mount
BasicMount = {}

---Gets the max morale of a basic mount.
---@return number #The max morale of a basic mount.
function BasicMount:GetMaxMorale() end

---Gets the morale of a basic mount.
---@return number #The morale of a basic mount.
function BasicMount:GetMorale() end

---Event fired when the mount's max morale changes.
---@param sender table The event sender.
---@param args EventBasicMountMaxMoraleChangedArgsTable The event arguments
BasicMount.MaxMoraleChanged = function (sender, args) end

---Event fired when the mount's morale changes.
---@param sender table The event sender.
---@param args EventBasicMountMoraleChangedArgsTable The event arguments
BasicMount.MoraleChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Class.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ClassAttributes$Members.html)
---Base class for class information.
---@class ClassAttributes : Attributes
ClassAttributes = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_CombatMount$Members.html)
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

---Gets the current evasion of the mount.
---@return number #The current evation of the mount.
function CombatMount:GetEvasion() end

---Gets the current turn rate of the mount.
---@return number #The current turn rate of the mount.
function CombatMount:GetTurnRate() end

---Event fired when the mount's base max morale changes.
---@param sender table The event sender.
---@param args EventCombatMountBaseMaxMoraleChangedArgsTable The event arguments
CombatMount.BaseMaxMoraleChanged = function (sender, args) end

---Event fired when he mount's base max power changes.
---@param sender table The event sender.
---@param args EventCombatMountBaseMaxPowerChangedArgsTable The event arguments
CombatMount.BaseMaxPowerChanged = function (sender, args) end

---Event fired when he mount's max temporary power changes.
---@param sender table The event sender.
---@param args EventCombatMountFuryChangedArgsTable The event arguments
CombatMount.FuryChanged = function (sender, args) end

---Event fired when the mount's max morale changes.
---@param sender table The event sender.
---@param args EventCombatMountMaxMoraleChangedArgsTable The event arguments
CombatMount.MaxMoraleChanged = function (sender, args) end

---Event fired when he mount's max power changes.
---@param sender table The event sender.
---@param args EventCombatMountMaxPowerChangedArgsTable The event arguments
CombatMount.MaxPowerChanged = function (sender, args) end

---Event fired when the mount's max temporary morale changes.
---@param sender table The event sender.
---@param args EventCombatMountMaxTemporaryMoraleChangedArgsTable The event arguments
CombatMount.MaxTemporaryMoraleChanged = function (sender, args) end

---Event fired when he mount's max temporary power changes.
---@param sender table The event sender.
---@param args EventCombatMountMaxTemporaryPowerChangedArgsTable The event arguments
CombatMount.MaxTemporaryPowerChanged = function (sender, args) end

---Event fired when the mount's morale changes.
---@param sender table The event sender.
---@param args EventCombatMountMoraleChangedArgsTable The event arguments
CombatMount.MoraleChanged = function (sender, args) end

---Event fired when he mount's power changes.
---@param sender table The event sender.
---@param args EventCombatMountPowerChangedArgsTable The event arguments
CombatMount.PowerChanged = function (sender, args) end

---Event fired when the mount's temporary morale changes.
---@param sender table The event sender.
---@param args EventCombatMountTemporaryMoraleChangedArgsTable The event arguments
CombatMount.TemporaryMoraleChanged = function (sender, args) end

---Event fired when he mount's temporary power changes.
---@param sender table The event sender.
---@param args EventCombatMountTemporaryPowerChangedArgsTable The event arguments
CombatMount.TemporaryPowerChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_CraftTier.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Effect$Members.html)
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

---Event fired when the category changes.
---@param sender table The event sender.
---@param args EventEffectCategoryChangedArgsTable The event arguments
Effect.CategoryChanged = function (sender, args) end

---Event fired when the description changes.
---@param sender table The event sender.
---@param args EventEffectDescriptionChangedArgsTable The event arguments
Effect.DescriptionChanged = function (sender, args) end

---Event fired when the duration changes.
---@param sender table The event sender.
---@param args EventEffectDurationChangedArgsTable The event arguments
Effect.DurationChanged = function (sender, args) end

---Event fired when the icon changes.
---@param sender table The event sender.
---@param args EventEffectIconChangedArgsTable The event arguments
Effect.IconChanged = function (sender, args) end

---Event fired when the curable state changes.
---@param sender table The event sender.
---@param args EventEffectIsCurableChangedArgsTable The event arguments
Effect.IsCurableChanged = function (sender, args) end

---Event fired when the debuff state changes.
---@param sender table The event sender.
---@param args EventEffectIsDebuffChangedArgsTable The event arguments
Effect.IsDebuffChanged = function (sender, args) end

---Event fired when the dispellable state changes.
---@param sender table The event sender.
---@param args EventEffectIsDispellableChangedArgsTable The event arguments
Effect.IsDispellableChanged = function (sender, args) end

---Event fired when the name changes.
---@param sender table The event sender.
---@param args EventEffectNameChangedArgsTable The event arguments
Effect.NameChanged = function (sender, args) end

---Event fired when the start time changes.
---@param sender table The event sender.
---@param args EventEffectStartTimeChangedArgsTable The event arguments
Effect.StartTimeChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_EffectCategory.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_EffectList$Members.html)
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

---Event fired when an effect is added.
---@param sender table The event sender.
---@param args EventEffectListEffectAddedArgsTable The event arguments
EffectList.EffectAdded = function (sender, args) end

---Event fired when an effect is removed.
---@param sender table The event sender.
---@param args EventEffectListEffectRemovedArgsTable The event arguments
EffectList.EffectRemoved = function (sender, args) end

---Event fired when all the effects are cleared.
---@param sender table The event sender.
---@param args EventEffectListEffectsClearedArgsTable The event arguments
EffectList.EffectsCleared = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Entity$Members.html)
---Base class for any entity in the game.
---@class Entity : PropertyHandler
Entity = {}

---Gets the name of the entity.
---@return string #The name of the entity.
function Entity:GetName() end

---Returns true if this entity is the local player entity. (Deprecated).
---@return boolean #Whether this is the local player entity or not.
function Entity:IsLocalPlayer() end

---Event fired when the actor's name changes.
---@param sender table The event sender.
---@param args EventEntityNameChangedArgsTable The event arguments
Entity.NameChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_EntityReference$Members.html)
---@class EntityReference : Object
EntityReference = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Equipment$Members.html)
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

---Event fired when an item is equipped.
---@param sender table The event sender.
---@param args EventEquipmentItemEquippedArgsTable The event arguments
Equipment.ItemEquipped = function (sender, args) end

---Event fired when an item is unequipped.
---@param sender table The event sender.
---@param args EventEquipmentItemUnequippedArgsTable The event arguments
Equipment.ItemUnequipped = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_GambitSkill$Members.html)
---Information about a gambit skill.
---@class GambitSkill : Skill
GambitSkill = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_GambitSkillInfo$Members.html)
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

---Gets the wear state of the item.
---@see ItemWearState
---@return number #the `ItemWearState` of the item
function Item:GetWearState() end

---Gets the image ID for the background of the item.
---@return number #
function Item:GetBackgroundImageID() end

---Gets the category of the item.
---@return number #The category of the item.
function Item:GetCategory() end

---Gets the durability of the item.
---@return number #A value from `ItemDurability` representing the durability of the item.
function Item:GetDurability() end

---Gets the image ID for the icon of the item.
---@return number #
function Item:GetIconImageID() end

---Gets the maximum number of instances that can be stacked together.
---@return number #The maximum number of instances that can be stacked together.
function Item:GetMaxStackSize() end

---Gets the quality of the item.
---@return number #A value from `ItemQuality` representing the quality of the item.
function Item:GetQuality() end

---Gets the image ID for the quality of the item.
---@return number #
function Item:GetQualityImageID() end

---Gets the quantity displayed.
---@return number #The quantity displayed.
function Item:GetQuantity() end

---Gets the image ID for the shadow of the item.
---@return number #
function Item:GetShadowImageID() end

---Gets the image ID for the underlay of the item.
---@return number #
function Item:GetUnderlayImageID() end

---Gets a flag indicating if the item is considered magical.
---@return boolean #A flag indicating if the item is considered magical.
function Item:IsMagic() end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Item$Members.html)
---An item that a user can have.
---@class Item : Entity
Item = {}

---Gets information about the item.
---@return ItemInfo #Information about the item.
function Item:GetItemInfo() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ItemCategory.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ItemDurability.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ItemInfo$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ItemQuality.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ItemWearState.html)
---Describes the current wear state of an item.
---@class ItemWearState
ItemWearState = {
	-- An unknown wear state.
	Undefined = 0,
	-- A damaged wear state. (1% - 20%)
	Damaged = 1,
	-- A pristine wear state. (100%)
	Pristine = 2,
	-- A broken wear state. (0%)
	Broken = 3,
	-- A worn wear state.  (21% - 99%)
	Worn = 4,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_LocalPlayer$Members.html)
---A class that represents the local player.
---@class LocalPlayer : Player
LocalPlayer = {}

---Gets the general attributes of a player.
---@return Attributes | FreePeopleAttributes
function LocalPlayer:GetAttributes() end

---Gets the player's backpack.
---@return Backpack #The player's backpack.
function LocalPlayer:GetBackpack() end

---Gets attribute information specific to a class.
---@return ClassAttributes #Attributes specified to the class.
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

---Event fired when the player's in combat state changes.
---@param sender table The event sender.
---@param args EventLocalPlayerInCombatChangedArgsTable The event arguments
LocalPlayer.InCombatChanged = function (sender, args) end

---Event fired when the player's mount has changed.
---@param sender table The event sender.
---@param args EventLocalPlayerMountChangedArgsTable The event arguments
LocalPlayer.MountChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Mount$Members.html)
---Class representing an in game mount.
---@class Mount : Entity
Mount = {}

---Gets the name of the entity.
---@return string #The name of the entity.
function Mount:GetName() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Party$Members.html)
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

---Event fired when an assist target has been added.
---@param sender table The event sender.
---@param args EventPartyAssistTargetAddedArgsTable The event arguments
Party.AssistTargetAdded = function (sender, args) end

---Event fired when an assist target has been removed.
---@param sender table The event sender.
---@param args EventPartyAssistTargetRemovedArgsTable The event arguments
Party.AssistTargetRemoved = function (sender, args) end

---Event fired when the leader of the fellowship has changed.
---@param sender table The event sender.
---@param args EventPartyLeaderChangedArgsTable The event arguments
Party.LeaderChanged = function (sender, args) end

---Event fired when a member has joined the party.
---@param sender table The event sender.
---@param args EventPartyMemberAddedArgsTable The event arguments
Party.MemberAdded = function (sender, args) end

---Event fired when a member has been removed from the party.
---@param sender table The event sender.
---@param args EventPartyMemberRemovedArgsTable The event arguments
Party.MemberRemoved = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_PartyMember$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Pet$Members.html)
---A pet is an actor that a player owns and controls.
---@class Pet : Actor
Pet = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Player$Members.html)
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

---Event fired when the link dead state of the player has changed.
---@param sender table The event sender.
---@param args EventPlayerIsLinkDeadChangedArgsTable The event arguments
Player.IsLinkDeadChanged = function (sender, args) end

---Event fired when the state of the player transmitting voice data has changed.
---@param sender table The event sender.
---@param args EventPlayerIsVoiceActiveChangedArgsTable The event arguments
Player.IsVoiceActiveChanged = function (sender, args) end

---Event fired when the voice enabled state of the player has changed.
---@param sender table The event sender.
---@param args EventPlayerIsVoiceEnabledChangedArgsTable The event arguments
Player.IsVoiceEnabledChanged = function (sender, args) end

---Event fired when the party of the player has changed.
---@param sender table The event sender.
---@param args EventPlayerPartyChangedArgsTable The event arguments
Player.PartyChanged = function (sender, args) end

---Event fired when the pet of the player has changed.
---@param sender table The event sender.
---@param args EventPlayerPetChangedArgsTable The event arguments
Player.PetChanged = function (sender, args) end

---Event fired when the raid of the player has changed.
---@param sender table The event sender.
---@param args EventPlayerRaidChangedArgsTable The event arguments
Player.RaidChanged = function (sender, args) end

---Event fired when the ready state of the player has changed.
---@param sender table The event sender.
---@param args EventPlayerReadyStateChangedArgsTable The event arguments
Player.ReadyStateChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Profession.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ProfessionInfo$Members.html)
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

---Event fired when the current mastery experience earned for the profession has changed.
---@param sender table The event sender.
---@param args EventProfessionInfoMasteryExperienceChangedArgsTable The event arguments
ProfessionInfo.MasteryExperienceChanged = function (sender, args) end

---Event fired when the target mastery experience for the profession has changed.
---@param sender table The event sender.
---@param args EventProfessionInfoMasteryExperienceTargetChangedArgsTable The event arguments
ProfessionInfo.MasteryExperienceTargetChanged = function (sender, args) end

---Event fired when the current mastery level of the profession has changed.
---@param sender table The event sender.
---@param args EventProfessionInfoMasteryLevelChangedArgsTable The event arguments
ProfessionInfo.MasteryLevelChanged = function (sender, args) end

---Event fired when the current mastery title of the profession has changed.
---@param sender table The event sender.
---@param args EventProfessionInfoMasteryTitleChangedArgsTable The event arguments
ProfessionInfo.MasteryTitleChanged = function (sender, args) end

---Event fired when the current proficiency experience earned for the profession has changed.
---@param sender table The event sender.
---@param args EventProfessionInfoProficiencyExperienceChangedArgsTable The event arguments
ProfessionInfo.ProficiencyExperienceChanged = function (sender, args) end

---Event fired when the target proficiency experience for the profession has changed.
---@param sender table The event sender.
---@param args EventProfessionInfoProficiencyExperienceTargetChangedArgsTable The event arguments
ProfessionInfo.ProficiencyExperienceTargetChanged = function (sender, args) end

---Event fired when the current proficiency level of the profession has changed.
---@param sender table The event sender.
---@param args EventProfessionInfoProficiencyLevelChangedArgsTable The event arguments
ProfessionInfo.ProficiencyLevelChanged = function (sender, args) end

---Event fired when the current proficiency title of the profession has changed.
---@param sender table The event sender.
---@param args EventProfessionInfoProficiencyTitleChangedArgsTable The event arguments
ProfessionInfo.ProficiencyTitleChanged = function (sender, args) end

---Event fired when a recipe has been added.
---@param sender table The event sender.
---@param args EventProfessionInfoRecipeAddedArgsTable The event arguments
ProfessionInfo.RecipeAdded = function (sender, args) end

---Event fired when a recipe has been removed.
---@param sender table The event sender.
---@param args EventProfessionInfoRecipeRemovedArgsTable The event arguments
ProfessionInfo.RecipeRemoved = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_PropertyHandler$Members.html)
---@class PropertyHandler : EntityReference
PropertyHandler = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Race.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_ReadyState.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Recipe$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_RecipeIngredient$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_SharedStorage$Members.html)
---A bank that represents the player's shared storage. This storage is available to all characters on the same account.
---@class SharedStorage : Bank
SharedStorage = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Skill$Members.html)
---Information about a skill.
---@class Skill : Object
Skill = {}

---Gets information about the skill.
---@return SkillInfo #Information about the skill.
function Skill:GetSkillInfo() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_SkillInfo$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_SkillList$Members.html)
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

---Event fired when a skill is added to the player.
---@param sender table The event sender.
---@param args EventSkillListSkillAddedArgsTable The event arguments
SkillList.SkillAdded = function (sender, args) end

---Event fired when a skill is removed from the player.
---@param sender table The event sender.
---@param args EventSkillListSkillRemovedArgsTable The event arguments
SkillList.SkillRemoved = function (sender, args) end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_SkillType.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_UntrainedSkill$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Vault$Members.html)
---A bank that represents the player's vault storage. This storage is only available to the current logged in character.
---@class Vault : Bank
Vault = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Vocation.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_Wallet$Members.html)
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

---Event fired when an item is added to the wallet.
---@param sender table The event sender.
---@param args EventWalletItemAddedArgsTable The event arguments
Wallet.ItemAdded = function (sender, args) end

---Event fired when an item is removed from the wallet.
---@param sender table The event sender.
---@param args EventWalletItemRemovedArgsTable The event arguments
Wallet.ItemRemoved = function (sender, args) end


---An item that is contained in a user's bank.
---@class BankItem : Item
BankItem = {}

---Gets the quantity of the bank item that the player has.
---@return number #The quantity of the bank item that the player has.
function BankItem:GetQuantity() end

---Gets the wear state of the bank item.
---@see ItemWearState
---@return number #the `ItemWearState` of the bank item
function BankItem:GetWearState() end

---Gets the name of player item is bound to.
---@return string #The name of player item is bound to
function BankItem:GetBoundOwner() end

---Gets the index of the bank chest item is contained in
---@return number #the index of the bank chest
function BankItem:GetChest() end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Gameplay_WalletItem$Members.html)
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

---Event fired when the max quantity of the wallet item changes.
---@param sender table The event sender.
---@param args EventWalletItemMaxQuantityChangedArgsTable The event arguments
WalletItem.MaxQuantityChanged = function (sender, args) end

---Event fired when the quantity of the wallet item changes.
---@param sender table The event sender.
---@param args EventWalletItemQuantityChangedArgsTable The event arguments
WalletItem.QuantityChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Language.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_LotroPluginManager$Members.html)
---Provides access to plugin management methods.
---@class LotroPluginManager : PluginManager
LotroPluginManager = {}

---Displays the options panel for the specified plugin.
---@param plugin Plugin 
LotroPluginManager.ShowOptions = function (plugin) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Object$Members.html)
---The base object class for API classes.
---@class Object
Object = {}

---Initializes a new Object
---`Object()` : Initializes a new Object
---@return Object
Turbine.Object = function () end

---Initializes a new Object
---`Object()` : Initializes a new Object
---@return Object
function Object:Constructor() end

---Is an instance of the given class
---@param target any #class to compare against
---@return boolean
function Object:IsA(target) end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Plugin$Members.html)
---Provides information about a specific plugin that has been loaded.
---@class Plugin : Object
Plugin = {}

---Gets the author of the plugin.
---@return string #The author of the plugin.
function Plugin:GetAuthor() end

---Gets the name of the plugin.
---@return string #The name of the plugin.
function Plugin:GetName() end

---Gets the version of the plugin.
---@return string #The version of the plugin.
function Plugin:GetVersion() end

---Event fired when a plugin's main package has finished loading.
---@param sender table The event sender.
---@param args EventPluginLoadArgsTable The event arguments
Plugin.Load = function (sender, args) end

---Event fired before a plugin is unloaded.
---@param sender table The event sender.
---@param args EventPluginUnloadArgsTable The event arguments
Plugin.Unload = function (sender, args) end

---Event fired before a plugin is unloaded.
---@param sender table The event sender.
---@param args table The event arguments
---@return Control #the control representing the plugin's options
Plugin.GetOptionsPanel = function(sender, args) end

---@type Plugin #the currently loaded plugin
---@diagnostic disable-next-line:lowercase-global
plugin = {}

---@type table<string,Plugin>
Plugins = {}

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_PluginData$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_PluginManager$Members.html)
---Provides access to plugin management methods.
---@class PluginManager
PluginManager = {}

---Gets the plugins that are currently available.
---@return PluginManagerGetAvailablePluginsTable[] #Returns a table containing the plugins that are currently available.
PluginManager.GetAvailablePlugins = function () end

---Gets the plugins that are currently loaded.
---@return PluginManagerGetLoadedPluginsTable[] #Returns a table containing the currently loaded plugins
PluginManager.GetLoadedPlugins = function () end

---Loads the plugin that is requested.
---@param pluginName string The name of the plugin to load as specified in its plugin definition file.
PluginManager.LoadPlugin = function (pluginName) end

---Refreshes the list of available plugins.
PluginManager.RefreshAvailablePlugins = function () end

---Unloads the script state specified.
---@param scriptState string The name of the script state to be unloaded.
PluginManager.UnloadScriptState = function (scriptState) end

---Displays the options for the given plugin
---@param plugin Plugin #The plugin to display options for
PluginManager.ShowOptions = function(plugin) end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_Shell$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_ShellCommand$Members.html)
---A command that can be register for use in the chat window.
---@class ShellCommand
ShellCommand = {}

---Initializes a new ShellCommand
---`ShellCommand()` : Initializes a new ShellCommand
---@return ShellCommand
Turbine.ShellCommand = function () end

---Initializes a new ShellCommand
---`ShellCommand()` : Initializes a new ShellCommand
---@return ShellCommand
function ShellCommand:Constructor() end

---Executes the command.
---@param argumentText string The arguments string passed along with the command.
function ShellCommand:Execute(argumentText) end

---Gets the help information for the command.
---@return string #The help information for the command.
function ShellCommand:GetHelp() end

---Gets a short help string for the command.
---@return string #A short help string for the command.
function ShellCommand:GetShortHelp() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI.html)
---The core UI package that allows users to create low level controls.
---@class UI
---@field public BlendMode BlendMode Specifies a blending method.
---@field public Button Button | function A simple button control.
---@field public CheckBox CheckBox | function A control used to indicate a boolean state.
---@field public Color Color | function Represents a 4 channel color with red, green, blue, and alpha.
---@field public ContentAlignment ContentAlignment Specifies the alignment of content within a region.
---@field public ContextMenu ContextMenu | function Defines a menu that can be displayed to the user.
---@field public Control Control | function The base control class for all available user interface elements.
---@field public ControlList ControlList | function Defines a list of controls.
---@field public Display Display Provides display information.
---@field public DragDropInfo DragDropInfo Container for information about drag drop events.
---@field public FontStyle FontStyle Specifies styles that can be applied to fonts.
---@field public Graphic Graphic | function Represents a graphic resources that is loaded from the DAT files or from disk.
---@field public HorizontalLayout HorizontalLayout Specifies how to perform horizontal layouts.
---@field public Label Label | function A simple label for displaying text.
---@field public ListBox ListBox | function A simple list box for laying out child controls in a list.
---@field public Lotro Lotro The Lord of the Rings UI package.
---@field public MenuItem MenuItem | function Defines a menu item.
---@field public MenuItemList MenuItemList | function Defines a list of menu items.
---@field public MouseButton MouseButton Defines one of the mouse buttons.
---@field public Orientation Orientation Specifies orientation of objects.
---@field public ScrollBar ScrollBar | function A control for scrolling contents.
---@field public ScrollableControl ScrollableControl | function Defines a control that can be scrolled.
---@field public TextBox TextBox | function A control for inputting text.
---@field public TreeNode TreeNode | function The base for any element that will be part of a tree view control.
---@field public TreeNodeList TreeNodeList | function Defines a list of controls.
---@field public TreeView TreeView | function A control to display data in a tree.
---@field public VerticalLayout VerticalLayout Specifies how to perform vertical layouts.
---@field public Window Window | function A top level window control.
UI = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_BlendMode.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Button$Members.html)
---A simple button control.
---@class Button : Label
Button = {}

---Initializes a new Button
---`Button()` : Initializes a new Button
---@return Button
Turbine.UI.Button = function () end

---Initializes a new Button
---`Button()` : Initializes a new Button
---@return Button
function Button:Constructor() end

---Event fired when the user clicks on the button.
---@param sender table The event sender.
---@param args EventButtonClickArgsTable The event arguments
Button.Click = function (sender, args) end

---Event fired when the enabled state of the control changes.
---@param sender table The event sender.
---@param args EventButtonEnabledChangedArgsTable The event arguments
Button.EnabledChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_CheckBox$Members.html)
---A control used to indicate a boolean state.
---@class CheckBox : Label
CheckBox = {}

---Initializes a new CheckBox
---`CheckBox()` : Initializes a new CheckBox
---@return CheckBox
Turbine.UI.CheckBox = function () end

---Initializes a new CheckBox
---`CheckBox()` : Initializes a new CheckBox
---@return CheckBox
function CheckBox:Constructor() end

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

---Event fired when the checked state changes.
---@param sender table The event sender.
---@param args EventCheckBoxCheckedChangedArgsTable The event arguments
CheckBox.CheckedChanged = function (sender, args) end

---Event fired when the enabled state of the control changes.
---@param sender table The event sender.
---@param args EventCheckBoxEnabledChangedArgsTable The event arguments
CheckBox.EnabledChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Color$Members.html)
---
---[View Color Table](https://lunarwtr.github.io/lotro-api-docs/colors/images/)
---[![](https://lunarwtr.github.io/lotro-api-docs/colors/images/rainbow.png)](https://lunarwtr.github.io/lotro-api-docs/colors/images/)
---
---Represents a 4 channel color with red, green, blue, and alpha.
---@class Color : Object
---@field public A number The alpha component.
---@field public R number The red component.
---@field public B number The blue component.
---@field public G number The green component.
---@field public AliceBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/AliceBlue.png) `Turbine.UI.Color(1,0.94099998474121,0.97299998998642,1)`
---@field public AntiqueWhite Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/AntiqueWhite.png) `Turbine.UI.Color(1,0.98000001907349,0.92199999094009,0.84299999475479)`
---@field public Aqua Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Aqua.png) `Turbine.UI.Color(1,0,1,1)`
---@field public Aquamarine Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Aquamarine.png) `Turbine.UI.Color(1,0.49799999594688,1,0.8309999704361)`
---@field public Azure Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Azure.png) `Turbine.UI.Color(1,0.94099998474121,1,1)`
---@field public Beige Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Beige.png) `Turbine.UI.Color(1,0.96100002527237,0.96100002527237,0.8629999756813)`
---@field public Bisque Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Bisque.png) `Turbine.UI.Color(1,1,0.89399999380112,0.76899999380112)`
---@field public Black Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Black.png) `Turbine.UI.Color(1,0,0,0)`
---@field public BlanchedAlmond Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/BlanchedAlmond.png) `Turbine.UI.Color(1,1,0.92199999094009,0.80400002002716)`
---@field public Blue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Blue.png) `Turbine.UI.Color(1,0,0,1)`
---@field public BlueViolet Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/BlueViolet.png) `Turbine.UI.Color(1,0.54100000858307,0.16899999976158,0.88599997758865)`
---@field public Brown Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Brown.png) `Turbine.UI.Color(1,0.64700001478195,0.16500000655651,0.16500000655651)`
---@field public BurlyWood Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/BurlyWood.png) `Turbine.UI.Color(1,0.87099999189377,0.72200000286102,0.52899998426437)`
---@field public CadetBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/CadetBlue.png) `Turbine.UI.Color(1,0.37299999594688,0.62000000476837,0.62699997425079)`
---@field public Chartreuse Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Chartreuse.png) `Turbine.UI.Color(1,0.49799999594688,1,0)`
---@field public Chocolate Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Chocolate.png) `Turbine.UI.Color(1,0.82400000095367,0.41200000047684,0.11800000071526)`
---@field public Constructor Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Constructor.png) `Turbine.UI.Color(,,,)`
---@field public Coral Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Coral.png) `Turbine.UI.Color(1,1,0.49799999594688,0.31400001049042)`
---@field public CornflowerBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/CornflowerBlue.png) `Turbine.UI.Color(1,0.391999989748,0.58399999141693,0.92900002002716)`
---@field public Cornsilk Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Cornsilk.png) `Turbine.UI.Color(1,1,0.97299998998642,0.8629999756813)`
---@field public Crimson Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Crimson.png) `Turbine.UI.Color(1,0.8629999756813,0.078000001609325,0.23499999940395)`
---@field public Cyan Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Cyan.png) `Turbine.UI.Color(1,0,1,1)`
---@field public DarkBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkBlue.png) `Turbine.UI.Color(1,0,0,0.5450000166893)`
---@field public DarkCyan Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkCyan.png) `Turbine.UI.Color(1,0,0.5450000166893,0.5450000166893)`
---@field public DarkGoldenrod Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkGoldenrod.png) `Turbine.UI.Color(1,0.72200000286102,0.52499997615814,0.043000001460314)`
---@field public DarkGray Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkGray.png) `Turbine.UI.Color(1,0.66299998760223,0.66299998760223,0.66299998760223)`
---@field public DarkGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkGreen.png) `Turbine.UI.Color(1,0,0.391999989748,0)`
---@field public DarkKhaki Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkKhaki.png) `Turbine.UI.Color(1,0.74099999666214,0.71799999475479,0.41999998688698)`
---@field public DarkMagenta Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkMagenta.png) `Turbine.UI.Color(1,0.5450000166893,0,0.5450000166893)`
---@field public DarkOliveGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkOliveGreen.png) `Turbine.UI.Color(1,0.33300000429153,0.41999998688698,0.18400000035763)`
---@field public DarkOrange Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkOrange.png) `Turbine.UI.Color(1,1,0.54900002479553,0)`
---@field public DarkOrchid Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkOrchid.png) `Turbine.UI.Color(1,0.60000002384186,0.195999994874,0.80000001192093)`
---@field public DarkRed Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkRed.png) `Turbine.UI.Color(1,0.5450000166893,0,0)`
---@field public DarkSalmon Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkSalmon.png) `Turbine.UI.Color(1,0.91399997472763,0.58799999952316,0.47799998521805)`
---@field public DarkSeaGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkSeaGreen.png) `Turbine.UI.Color(1,0.56099998950958,0.73699998855591,0.5450000166893)`
---@field public DarkSlateBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkSlateBlue.png) `Turbine.UI.Color(1,0.28200000524521,0.23899999260902,0.5450000166893)`
---@field public DarkSlateGray Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkSlateGray.png) `Turbine.UI.Color(1,0.18400000035763,0.31000000238419,0.31000000238419)`
---@field public DarkTurquoise Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkTurquoise.png) `Turbine.UI.Color(1,0,0.80800002813339,0.81999999284744)`
---@field public DarkViolet Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DarkViolet.png) `Turbine.UI.Color(1,0.5799999833107,0,0.82700002193451)`
---@field public DeepPink Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DeepPink.png) `Turbine.UI.Color(1,1,0.078000001609325,0.57599997520447)`
---@field public DeepSkyBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DeepSkyBlue.png) `Turbine.UI.Color(1,0,0.7490000128746,1)`
---@field public DimGray Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DimGray.png) `Turbine.UI.Color(1,0.41200000047684,0.41200000047684,0.41200000047684)`
---@field public DodgerBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/DodgerBlue.png) `Turbine.UI.Color(1,0.11800000071526,0.56499999761581,1)`
---@field public Firebrick Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Firebrick.png) `Turbine.UI.Color(1,0.69800001382828,0.1330000013113,0.1330000013113)`
---@field public FloralWhite Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/FloralWhite.png) `Turbine.UI.Color(1,1,0.98000001907349,0.94099998474121)`
---@field public ForestGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/ForestGreen.png) `Turbine.UI.Color(1,0.1330000013113,0.5450000166893,0.1330000013113)`
---@field public Fuchsia Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Fuchsia.png) `Turbine.UI.Color(1,1,0,1)`
---@field public Gainsboro Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Gainsboro.png) `Turbine.UI.Color(1,0.8629999756813,0.8629999756813,0.8629999756813)`
---@field public GhostWhite Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/GhostWhite.png) `Turbine.UI.Color(1,0.97299998998642,0.97299998998642,1)`
---@field public Gold Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Gold.png) `Turbine.UI.Color(1,1,0.84299999475479,0)`
---@field public Goldenrod Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Goldenrod.png) `Turbine.UI.Color(1,0.85500001907349,0.64700001478195,0.125)`
---@field public Gray Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Gray.png) `Turbine.UI.Color(1,0.50199997425079,0.50199997425079,0.50199997425079)`
---@field public Green Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Green.png) `Turbine.UI.Color(1,0,0.50199997425079,0)`
---@field public GreenYellow Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/GreenYellow.png) `Turbine.UI.Color(1,0.67799997329712,1,0.18400000035763)`
---@field public Honeydew Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Honeydew.png) `Turbine.UI.Color(1,0.94099998474121,1,0.94099998474121)`
---@field public HotPink Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/HotPink.png) `Turbine.UI.Color(1,1,0.41200000047684,0.7059999704361)`
---@field public IndianRed Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/IndianRed.png) `Turbine.UI.Color(1,0.80400002002716,0.36100000143051,0.36100000143051)`
---@field public Indigo Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Indigo.png) `Turbine.UI.Color(1,0.29399999976158,0,0.50999999046326)`
---@field public IsA Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/IsA.png) `Turbine.UI.Color(,,,)`
---@field public Ivory Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Ivory.png) `Turbine.UI.Color(1,1,1,0.94099998474121)`
---@field public Khaki Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Khaki.png) `Turbine.UI.Color(1,0.94099998474121,0.90200001001358,0.54900002479553)`
---@field public Lavender Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Lavender.png) `Turbine.UI.Color(1,0.90200001001358,0.90200001001358,0.98000001907349)`
---@field public LavenderBlush Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LavenderBlush.png) `Turbine.UI.Color(1,1,0.94099998474121,0.96100002527237)`
---@field public LawnGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LawnGreen.png) `Turbine.UI.Color(1,0.48600000143051,0.9879999756813,0)`
---@field public LemonChiffon Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LemonChiffon.png) `Turbine.UI.Color(1,1,0.98000001907349,0.80400002002716)`
---@field public LightBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightBlue.png) `Turbine.UI.Color(1,0.67799997329712,0.84700000286102,0.90200001001358)`
---@field public LightCoral Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightCoral.png) `Turbine.UI.Color(1,0.94099998474121,0.50199997425079,0.50199997425079)`
---@field public LightCyan Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightCyan.png) `Turbine.UI.Color(1,0.87800002098083,1,1)`
---@field public LightGoldenrodYellow Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightGoldenrodYellow.png) `Turbine.UI.Color(1,0.98000001907349,0.98000001907349,0.82400000095367)`
---@field public LightGray Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightGray.png) `Turbine.UI.Color(1,0.82700002193451,0.82700002193451,0.82700002193451)`
---@field public LightGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightGreen.png) `Turbine.UI.Color(1,0.56499999761581,0.93300002813339,0.56499999761581)`
---@field public LightPink Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightPink.png) `Turbine.UI.Color(1,1,0.71399998664856,0.75700002908707)`
---@field public LightSalmon Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightSalmon.png) `Turbine.UI.Color(1,1,0.62699997425079,0.47799998521805)`
---@field public LightSeaGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightSeaGreen.png) `Turbine.UI.Color(1,0.125,0.69800001382828,0.66699999570847)`
---@field public LightSkyBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightSkyBlue.png) `Turbine.UI.Color(1,0.52899998426437,0.80800002813339,0.98000001907349)`
---@field public LightSlateGray Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightSlateGray.png) `Turbine.UI.Color(1,0.46700000762939,0.53299999237061,0.60000002384186)`
---@field public LightSteelBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightSteelBlue.png) `Turbine.UI.Color(1,0.68999999761581,0.76899999380112,0.87099999189377)`
---@field public LightYellow Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LightYellow.png) `Turbine.UI.Color(1,1,1,0.87800002098083)`
---@field public Lime Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Lime.png) `Turbine.UI.Color(1,0,1,0)`
---@field public LimeGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/LimeGreen.png) `Turbine.UI.Color(1,0.195999994874,0.80400002002716,0.195999994874)`
---@field public Linen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Linen.png) `Turbine.UI.Color(1,0.98000001907349,0.94099998474121,0.90200001001358)`
---@field public Magenta Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Magenta.png) `Turbine.UI.Color(1,1,0,1)`
---@field public Maroon Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Maroon.png) `Turbine.UI.Color(1,0.50199997425079,0,0)`
---@field public MediumAquamarine Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumAquamarine.png) `Turbine.UI.Color(1,0.40000000596046,0.80400002002716,0.66699999570847)`
---@field public MediumBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumBlue.png) `Turbine.UI.Color(1,0,0,0.80400002002716)`
---@field public MediumOrchid Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumOrchid.png) `Turbine.UI.Color(1,0.72899997234344,0.33300000429153,0.82700002193451)`
---@field public MediumPurple Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumPurple.png) `Turbine.UI.Color(1,0.57599997520447,0.43900001049042,0.85900002717972)`
---@field public MediumSeaGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumSeaGreen.png) `Turbine.UI.Color(1,0.23499999940395,0.70200002193451,0.44299998879433)`
---@field public MediumSlateBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumSlateBlue.png) `Turbine.UI.Color(1,0.48199999332428,0.40799999237061,0.93300002813339)`
---@field public MediumSpringGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumSpringGreen.png) `Turbine.UI.Color(1,0,0.98000001907349,0.60399997234344)`
---@field public MediumTurquoise Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumTurquoise.png) `Turbine.UI.Color(1,0.28200000524521,0.81999999284744,0.80000001192093)`
---@field public MediumVioletRed Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MediumVioletRed.png) `Turbine.UI.Color(1,0.77999997138977,0.082000002264977,0.52200001478195)`
---@field public MidnightBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MidnightBlue.png) `Turbine.UI.Color(1,0.097999997437,0.097999997437,0.43900001049042)`
---@field public MintCream Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MintCream.png) `Turbine.UI.Color(1,0.96100002527237,1,0.98000001907349)`
---@field public MistyRose Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/MistyRose.png) `Turbine.UI.Color(1,1,0.89399999380112,0.88200002908707)`
---@field public Moccasin Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Moccasin.png) `Turbine.UI.Color(1,1,0.89399999380112,0.70999997854233)`
---@field public NavajoWhite Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/NavajoWhite.png) `Turbine.UI.Color(1,1,0.87099999189377,0.67799997329712)`
---@field public Navy Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Navy.png) `Turbine.UI.Color(1,0,0,0.50199997425079)`
---@field public OldLace Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/OldLace.png) `Turbine.UI.Color(1,0.99199998378754,0.96100002527237,0.90200001001358)`
---@field public Olive Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Olive.png) `Turbine.UI.Color(1,0.50199997425079,0.50199997425079,0)`
---@field public OliveDrab Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/OliveDrab.png) `Turbine.UI.Color(1,0.41999998688698,0.55699998140335,0.13699999451637)`
---@field public Orange Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Orange.png) `Turbine.UI.Color(1,1,0.64700001478195,0)`
---@field public OrangeRed Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/OrangeRed.png) `Turbine.UI.Color(1,1,0.27099999785423,0)`
---@field public Orchid Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Orchid.png) `Turbine.UI.Color(1,0.85500001907349,0.43900001049042,0.83899998664856)`
---@field public PaleGoldenrod Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/PaleGoldenrod.png) `Turbine.UI.Color(1,0.93300002813339,0.91000002622604,0.66699999570847)`
---@field public PaleGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/PaleGreen.png) `Turbine.UI.Color(1,0.59600001573563,0.98400002717972,0.59600001573563)`
---@field public PaleTurquoise Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/PaleTurquoise.png) `Turbine.UI.Color(1,0.68599998950958,0.93300002813339,0.93300002813339)`
---@field public PaleVioletRed Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/PaleVioletRed.png) `Turbine.UI.Color(1,0.85900002717972,0.43900001049042,0.57599997520447)`
---@field public PapayaWhip Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/PapayaWhip.png) `Turbine.UI.Color(1,1,0.93699997663498,0.83499997854233)`
---@field public PeachPuff Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/PeachPuff.png) `Turbine.UI.Color(1,1,0.85500001907349,0.72500002384186)`
---@field public Peru Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Peru.png) `Turbine.UI.Color(1,0.80400002002716,0.52200001478195,0.24699999392033)`
---@field public Pink Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Pink.png) `Turbine.UI.Color(1,1,0.75300002098083,0.7960000038147)`
---@field public Plum Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Plum.png) `Turbine.UI.Color(1,0.86699998378754,0.62699997425079,0.86699998378754)`
---@field public PowderBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/PowderBlue.png) `Turbine.UI.Color(1,0.68999999761581,0.87800002098083,0.90200001001358)`
---@field public Purple Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Purple.png) `Turbine.UI.Color(1,0.50199997425079,0,0.50199997425079)`
---@field public Red Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Red.png) `Turbine.UI.Color(1,1,0,0)`
---@field public RosyBrown Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/RosyBrown.png) `Turbine.UI.Color(1,0.73699998855591,0.56099998950958,0.56099998950958)`
---@field public RoyalBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/RoyalBlue.png) `Turbine.UI.Color(1,0.25499999523163,0.41200000047684,0.88200002908707)`
---@field public SaddleBrown Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SaddleBrown.png) `Turbine.UI.Color(1,0.5450000166893,0.27099999785423,0.075000002980232)`
---@field public Salmon Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Salmon.png) `Turbine.UI.Color(1,0.98000001907349,0.50199997425079,0.44699999690056)`
---@field public SandyBrown Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SandyBrown.png) `Turbine.UI.Color(1,0.95700001716614,0.64300000667572,0.3759999871254)`
---@field public SeaGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SeaGreen.png) `Turbine.UI.Color(1,0.18000000715256,0.5450000166893,0.34099999070168)`
---@field public SeaShell Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SeaShell.png) `Turbine.UI.Color(1,1,0.96100002527237,0.93300002813339)`
---@field public Sienna Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Sienna.png) `Turbine.UI.Color(1,0.62699997425079,0.32199999690056,0.17599999904633)`
---@field public Silver Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Silver.png) `Turbine.UI.Color(1,0.75300002098083,0.75300002098083,0.75300002098083)`
---@field public SkyBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SkyBlue.png) `Turbine.UI.Color(1,0.52899998426437,0.80800002813339,0.92199999094009)`
---@field public SlateBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SlateBlue.png) `Turbine.UI.Color(1,0.41600000858307,0.35299998521805,0.80400002002716)`
---@field public SlateGray Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SlateGray.png) `Turbine.UI.Color(1,0.43900001049042,0.50199997425079,0.56499999761581)`
---@field public Snow Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Snow.png) `Turbine.UI.Color(1,1,0.98000001907349,0.98000001907349)`
---@field public SpringGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SpringGreen.png) `Turbine.UI.Color(1,0,1,0.49799999594688)`
---@field public SteelBlue Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/SteelBlue.png) `Turbine.UI.Color(1,0.27500000596046,0.50999999046326,0.7059999704361)`
---@field public Tan Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Tan.png) `Turbine.UI.Color(1,0.82400000095367,0.7059999704361,0.54900002479553)`
---@field public Teal Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Teal.png) `Turbine.UI.Color(1,0,0.50199997425079,0.50199997425079)`
---@field public Thistle Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Thistle.png) `Turbine.UI.Color(1,0.84700000286102,0.7490000128746,0.84700000286102)`
---@field public Tomato Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Tomato.png) `Turbine.UI.Color(1,1,0.38800001144409,0.27799999713898)`
---@field public Transparent Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Transparent.png) `Turbine.UI.Color(0,1,1,1)`
---@field public Turquoise Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Turquoise.png) `Turbine.UI.Color(1,0.2509999871254,0.87800002098083,0.81599998474121)`
---@field public Violet Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Violet.png) `Turbine.UI.Color(1,0.93300002813339,0.50999999046326,0.93300002813339)`
---@field public Wheat Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Wheat.png) `Turbine.UI.Color(1,0.96100002527237,0.87099999189377,0.70200002193451)`
---@field public White Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/White.png) `Turbine.UI.Color(1,1,1,1)`
---@field public WhiteSmoke Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/WhiteSmoke.png) `Turbine.UI.Color(1,0.96100002527237,0.96100002527237,0.96100002527237)`
---@field public Yellow Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/Yellow.png) `Turbine.UI.Color(1,1,1,0)`
---@field public YellowGreen Color ![](https://lunarwtr.github.io/lotro-api-docs/colors/images/YellowGreen.png) `Turbine.UI.Color(1,0.60399997234344,0.80400002002716,0.195999994874)`
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
function Color:Constructor(a, r, g, b) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_ContentAlignment.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_ContextMenu$Members.html)
---Defines a menu that can be displayed to the user.
---@class ContextMenu : Object
ContextMenu = {}

---Initializes a new ContextMenu
---`ContextMenu()` : Initializes a new ContextMenu
---@return ContextMenu
Turbine.UI.ContextMenu = function () end

---Initializes a new ContextMenu
---`ContextMenu()` : Initializes a new ContextMenu
---@return ContextMenu
function ContextMenu:Constructor() end

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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Control$Members.html)
---The base control class for all available user interface elements.
---@class Control : Object
Control = {}

---Initializes a new Control
---`Control()` : Initializes a new Control
---@return Control
Turbine.UI.Control = function () end

---Initializes a new Control
---`Control()` : Initializes a new Control
---@return Control
function Control:Constructor() end

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

---Allow dynamically scaling the display size of a control's background image
---
---* **StretchMode 0** - *turns off scaling of a control (and incidentally set the alpha to 0). Any background image will be cropped or tiled. This is the only setting where the image will be properly bounded by a parent control.*
---* **StretchMode 1** - *scale an image based on the size it had when the stretch mode was assigned and its current size. When using StretchMode 1 it is important to set the control to the image's original size BEFORE assigning StretchMode 1, then set the size to the desired stretched size after assigning StretchMode 1. This stretchmode can cause an image to exceed the bounds of its parent. If this happens, the control will only respond to mouse events within the bounds of its parent even though the control is rendered outside those bounds.*
---* **StretchMode 2** - *scale a control to the size of its background image. When StretchMode 2 is initially assigned, the control will resize to fit the image size. If the control is subsequently resized, the background will be stretched to fit the control. Note that in StretchMode 2, the control will not respond to any mouse events even if mouse visibility is true.*
---* **StretchMode 3** - *similar to StretchMode 0 and will turn off scaling of a control. Any background image will be tiled or cropped but if the control exceeds the bounds of its parent, the image will not be properly cropped by the parent's bounds.*
---* **StretchMode 4** - *similar to StretchMode 1 except the control will not receive mouse events even if mouse visibility is set true. This is likely an accidental glitch.*
---@param mode number
function Control:SetStretchMode(mode) end

---Retrieve the display size scaling value for a control's background image
--- see `Control:SetStretchMode(mode)` for details on each value
---@return number # the stretch mode value 
function Control:GetStretchMode() end

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

---Event fired when a drag drop operation is completed.
---@param sender table The event sender.
---@param args EventControlDragDropArgsTable The event arguments
Control.DragDrop = function (sender, args) end

---Event fired when a drag drop operation enters the control.
---@param sender table The event sender.
---@param args EventControlDragEnterArgsTable The event arguments
Control.DragEnter = function (sender, args) end

---Event fired when a drag drop operation leaves the control.
---@param sender table The event sender.
---@param args EventControlDragLeaveArgsTable The event arguments
Control.DragLeave = function (sender, args) end

---Event fired when a drag drop operation starts the control.
---@param sender table The event sender.
---@param args EventControlDragStartArgsTable The event arguments
Control.DragStart = function (sender, args) end

---Event fired when the enabled state of the control changes.
---@param sender table The event sender.
---@param args EventControlEnabledChangedArgsTable The event arguments
Control.EnabledChanged = function (sender, args) end

---Event fired when the control gains focus.
---@param sender table The event sender.
---@param args EventControlFocusGainedArgsTable The event arguments
Control.FocusGained = function (sender, args) end

---Event fired when the control loses focus.
---@param sender table The event sender.
---@param args EventControlFocusLostArgsTable The event arguments
Control.FocusLost = function (sender, args) end

---Event fired when a key is pressed down.
---@param sender table The event sender.
---@param args EventControlKeyDownArgsTable The event arguments
Control.KeyDown = function (sender, args) end

---Event fired when a key is released.
---@param sender table The event sender.
---@param args EventControlKeyUpArgsTable The event arguments
Control.KeyUp = function (sender, args) end

---Event fired when a mouse button is clicked.
---@param sender table The event sender.
---@param args EventControlMouseClickArgsTable The event arguments
Control.MouseClick = function (sender, args) end

---Event fired when a mouse button is double clicked.
---@param sender table The event sender.
---@param args EventControlMouseDoubleClickArgsTable The event arguments
Control.MouseDoubleClick = function (sender, args) end

---Event fired when a mouse button is pressed.
---@param sender table The event sender.
---@param args EventControlMouseDownArgsTable The event arguments
Control.MouseDown = function (sender, args) end

---Event fired when the mouse enters the control.
---@param sender table The event sender.
---@param args EventControlMouseEnterArgsTable The event arguments
Control.MouseEnter = function (sender, args) end

---Event fired when the mouse is hovering over the control.
---@param sender table The event sender.
---@param args EventControlMouseHoverArgsTable The event arguments
Control.MouseHover = function (sender, args) end

---Event fired when the mouse leaves the cotnrol.
---@param sender table The event sender.
---@param args EventControlMouseLeaveArgsTable The event arguments
Control.MouseLeave = function (sender, args) end

---Event fired when the mouse moves.
---@param sender table The event sender.
---@param args EventControlMouseMoveArgsTable The event arguments
Control.MouseMove = function (sender, args) end

---Event fired when a mouse button is released.
---@param sender table The event sender.
---@param args EventControlMouseUpArgsTable The event arguments
Control.MouseUp = function (sender, args) end

---Event fired when a mouse wheel moves.
--- This is **buggy** in that you have to either be a Button or a child component of a button for this event to trigger
---@param sender table The event sender.
---@param args EventControlMouseWheelArgsTable The event arguments
Control.MouseWheel = function (sender, args) end

---Event fired when the position of the control changes.
---@param sender table The event sender.
---@param args EventControlPositionChangedArgsTable The event arguments
Control.PositionChanged = function (sender, args) end

---Event fired when the size of the control changes.
---@param sender table The event sender.
---@param args EventControlSizeChangedArgsTable The event arguments
Control.SizeChanged = function (sender, args) end

---Event fired every frame when WantsUpdates is enabled.
---@param sender table The event sender.
---@param args EventControlUpdateArgsTable The event arguments
Control.Update = function (sender, args) end

---Event fired when the visible state of the control changes.
---@param sender table The event sender.
---@param args EventControlVisibleChangedArgsTable The event arguments
Control.VisibleChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_ControlList$Members.html)
---Defines a list of controls.
---@class ControlList : Object
ControlList = {}

---Initializes a new ControlList
---`ControlList()` : Initializes a new ControlList
---@return ControlList
Turbine.UI.ControlList = function () end

---Initializes a new ControlList
---`ControlList()` : Initializes a new ControlList
---@return ControlList
function ControlList:Constructor() end

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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Display$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_DragDropInfo$Members.html)
---Container for information about drag drop events.
---@class DragDropInfo : Object
DragDropInfo = {}

---@return boolean #True if the drag drop was successful.
function DragDropInfo:IsSuccessful() end

---@param value boolean True if the drag drop was successful.
function DragDropInfo:SetSuccessful(value) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_FontStyle.html)
---Specifies styles that can be applied to fonts.
---@class FontStyle
FontStyle = {
	-- No font styles.
	None = 0,
	-- Outlines the font.
	Outline = 8,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Graphic$Members.html)
---Represents a graphic resources that is loaded from the DAT files or from disk.
---@class Graphic : Object
Graphic = {}

---Constructs an empty graphics.
---`Graphic()` : Constructs an empty graphics.
---`Graphic(dataId)` : Constructs a graphic from a game asset by its ID.
---`Graphic(filename)` : Constructs a graphic from a file.
---@overload fun():Graphic
---@overload fun(dataId:number):Graphic
---@diagnostic disable-next-line: undefined-doc-param
---@param dataId number Game asset ID
---@param filename string 
---@return Graphic
Turbine.UI.Graphic = function (filename) end

---Constructs an empty graphics.
---`Graphic()` : Constructs an empty graphics.
---`Graphic(dataId)` : Constructs a graphic from a game asset by its ID.
---`Graphic(filename)` : Constructs a graphic from a file.
---@overload fun():Graphic
---@overload fun(dataId:number):Graphic
---@diagnostic disable-next-line: undefined-doc-param
---@param dataId number
---@param filename string 
---@return Graphic
function Graphic:Constructor(filename) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_HorizontalLayout.html)
---Specifies how to perform horizontal layouts.
---@class HorizontalLayout
HorizontalLayout = {
	-- Layout starting at the left and working right.
	LeftToRight = 0,
	-- Layout starting at the right and working left.
	RightToLeft = 1,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Label$Members.html)
---A simple label for displaying text.
---@class Label : ScrollableControl
Label = {}

---Initializes a new Label
---`Label()` : Initializes a new Label
---@return Label
Turbine.UI.Label = function () end

---Initializes a new Label
---`Label()` : Initializes a new Label
---@return Label
function Label:Constructor() end

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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_ListBox$Members.html)
---A simple list box for laying out child controls in a list.
---@class ListBox : ScrollableControl
ListBox = {}

---Initializes a new ListBox
---`ListBox()` : Initializes a new ListBox
---@return ListBox
Turbine.UI.ListBox = function () end

---Initializes a new ListBox
---`ListBox()` : Initializes a new ListBox
---@return ListBox
function ListBox:Constructor() end

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

---@alias ListSortFunc fun(itema:Label,itemb:Label):boolean

---Sorts the elements in the list box.
---```
-----example sort callback
---function (itema, itemb)
---	local texta = itema:GetText();
---	local textb = itemb:GetText();
---	return texta < textb
---end
---```
---@param sortCallback ListSortFunc The function used to sort the elements in the list box.
function ListBox:Sort(sortCallback) end

---Event fired when an item is added.
---@param sender table The event sender.
---@param args EventListBoxItemAddedArgsTable The event arguments
ListBox.ItemAdded = function (sender, args) end

---Event fired when an item is removed.
---@param sender table The event sender.
---@param args EventListBoxItemRemovedArgsTable The event arguments
ListBox.ItemRemoved = function (sender, args) end

---Event fired when the selected index has changed.
---@param sender table The event sender.
---@param args EventListBoxSelectedIndexChangedArgsTable The event arguments
ListBox.SelectedIndexChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro.html)
---The Lord of the Rings UI package.
---@class Lotro
---@field public Action Action List available actions that can be interpretted.
---@field public BaseItemControl BaseItemControl Base item control for Lotro interface item classes.
---@field public Button LotroButton | function A standard Lord of the Rings silver button.
---@field public CheckBox LotroCheckBox | function A standard Lord of the Rings check box.
---@field public DragDropInfo LotroDragDropInfo Container for information about drag drop events.
---@field public EffectDisplay EffectDisplay | function Provides a control for displaying an effect indicator.
---@field public EntityControl EntityControl | function A control for providing standard entity selection and context sensitive menu support.
---@field public EquipmentSlot EquipmentSlot | function A EquipmentSlot button for for equipping items.
---@field public Font Font The list of available fonts.
---@field public GoldButton GoldButton | function A standard Lord of the Rings gold button.
---@field public GoldWindow GoldWindow | function A standard Lord of the Rings gold window.
---@field public ItemControl ItemControl | function Provides a control for displaying an item.
---@field public ItemInfoControl ItemInfoControl | function Provides a control for displaying item information.
---@field public LotroUI LotroUI Provides access to the built in game UIs.
---@field public LotroUIElement LotroUIElement The list of UIs that can be enabled or disabled.
---@field public Quickslot Quickslot | function A quickslot button for using skills or items.
---@field public ScrollBar LotroScrollBar | function A standard Lord of the Rings scroll bar.
---@field public Shortcut Shortcut | function Encapsulates information about a short cut.
---@field public ShortcutType ShortcutType Defines one of the shortcut types.
---@field public TextBox LotroTextBox | function A standard Lord of the Rings text box.
---@field public Window LotroWindow | function A standard Lord of the Rings silver window.
Lotro = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_Action.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_BaseItemControl$Members.html)
---Base item control for Lotro interface item classes.
---@class BaseItemControl : Control
BaseItemControl = {}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_Button$Members.html)
---A standard Lord of the Rings silver button.
---@class LotroButton : Button
LotroButton = {}

---Initializes a new Button
---`Button()` : Initializes a new Button
---@return LotroButton
Turbine.UI.Lotro.Button = function () end

---Initializes a new Button
---`Button()` : Initializes a new Button
---@return LotroButton
function LotroButton:Constructor() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_CheckBox$Members.html)
---A standard Lord of the Rings check box.
---@class LotroCheckBox : CheckBox
LotroCheckBox = {}

---Initializes a new CheckBox
---`CheckBox()` : Initializes a new CheckBox
---@return LotroCheckBox
Turbine.UI.Lotro.CheckBox = function () end

---Initializes a new CheckBox
---`CheckBox()` : Initializes a new CheckBox
---@return LotroCheckBox
function LotroCheckBox:Constructor() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_DragDropInfo$Members.html)
---Container for information about drag drop events.
---@class LotroDragDropInfo : DragDropInfo
LotroDragDropInfo = {}

---Gets the shortcut from the drag drop event.
---@return Shortcut #Any shortcut information available from the drag drop event.
function LotroDragDropInfo:GetShortcut() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_EffectDisplay$Members.html)
---Provides a control for displaying an effect indicator.
---@class EffectDisplay : Control
EffectDisplay = {}

---Initializes a new EffectDisplay
---`EffectDisplay()` : Initializes a new EffectDisplay
---@return EffectDisplay
Turbine.UI.Lotro.EffectDisplay = function () end

---Initializes a new EffectDisplay
---`EffectDisplay()` : Initializes a new EffectDisplay
---@return EffectDisplay
function EffectDisplay:Constructor() end

---Gets the effect displayed by the control.
---@return Effect #The effect the control is displaying.
function EffectDisplay:GetEffect() end

---Sets the effect displayed by the control.
---@param value Effect The effect the control is displaying.
function EffectDisplay:SetEffect(value) end

---Get the entity registered with control
---@return Entity
function EntityControl:GetEntity() end

---Gets a flag indicating if the context menu is enabled.
---@return boolean #True if the context menu is enabled.
function EntityControl:IsContextMenuEnabled() end

---Gets a flag indicating if the selection is enabled.
---@return boolean #True if the selection is enabled.
function EntityControl:IsSelectionEnabled() end

---Sets a flag indicating if the context menu is enabled.
---@param value boolean True if the context menu is to be enabled, false to disable.
function EntityControl:SetContextMenuEnabled(value) end

---Set the entity registered with control
---@param entity Entity #The entity to register
function EntityControl:SetEntity(entity) end

---Sets a flag indicating that selection is enabled.
---@param value boolean True if selection is to be enabled, false to disable.
function EntityControl:SetSelectionEnabled(value) end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_EntityControl$Members.html)
---A control for providing standard entity selection and context sensitive menu support.
---@class EntityControl : Control
EntityControl = {}

---Initializes a new EntityControl
---`EntityControl()` : Initializes a new EntityControl
---@return EntityControl
Turbine.UI.Lotro.EntityControl = function () end

---Initializes a new EntityControl
---`EntityControl()` : Initializes a new EntityControl
---@return EntityControl
function EntityControl:Constructor() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_EquipmentSlot$Members.html)
---A EquipmentSlot button for for equipping items.
---@class EquipmentSlot : BaseItemControl
EquipmentSlot = {}

---Initializes a new EquipmentSlot
---`EquipmentSlot()` : Initializes a new EquipmentSlot
---@return EquipmentSlot
Turbine.UI.Lotro.EquipmentSlot = function () end

---Initializes a new EquipmentSlot
---`EquipmentSlot()` : Initializes a new EquipmentSlot
---@return EquipmentSlot
function EquipmentSlot:Constructor() end

---Gets the equipment slot visualized by this UI equipment slot.
---@return number #The equipment slot visualized by this UI equipment slot.
function EquipmentSlot:GetEquipmentSlot() end

---Sets the equipment slot visualized by this UI equipment slot.
---@param value number The equipment slot visualized by this UI equipment slot.
function EquipmentSlot:SetEquipmentSlot(value) end

---Event fired when a drag drop operation is completed.
---@param sender table The event sender.
---@param args EventEquipmentSlotDragDropArgsTable The event arguments
EquipmentSlot.DragDrop = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_Font.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_GoldButton$Members.html)
---A standard Lord of the Rings gold button.
---@class GoldButton : LotroButton
GoldButton = {}

---Initializes a new GoldButton
---`GoldButton()` : Initializes a new GoldButton
---@return GoldButton
Turbine.UI.Lotro.GoldButton = function () end

---Initializes a new GoldButton
---`GoldButton()` : Initializes a new GoldButton
---@return GoldButton
function GoldButton:Constructor() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_GoldWindow$Members.html)
---A standard Lord of the Rings gold window.
---@class GoldWindow : LotroWindow
GoldWindow = {}

---Initializes a new GoldWindow
---`GoldWindow()` : Initializes a new GoldWindow
---@return GoldWindow
Turbine.UI.Lotro.GoldWindow = function () end

---Initializes a new GoldWindow
---`GoldWindow()` : Initializes a new GoldWindow
---@return GoldWindow
function GoldWindow:Constructor() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_ItemControl$Members.html)
---Provides a control for displaying an item.
---@class ItemControl : BaseItemControl
ItemControl = {}

---Initializes a new ItemControl
---`ItemControl()` : Initializes a new ItemControl
---@return ItemControl
Turbine.UI.Lotro.ItemControl = function () end

---Initializes a new ItemControl
---`ItemControl()` : Initializes a new ItemControl
---@return ItemControl
function ItemControl:Constructor() end

---Gets the item displayed by the control.
---@return Item #The item the control is displaying.
function ItemControl:GetItem() end

---Sets the item displayed by the control.
---@param value Item The item the control is displaying.
function ItemControl:SetItem(value) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_ItemInfoControl$Members.html)
---Provides a control for displaying item information.
---@class ItemInfoControl : BaseItemControl
ItemInfoControl = {}

---Initializes a new ItemInfoControl
---`ItemInfoControl()` : Initializes a new ItemInfoControl
---@return ItemInfoControl
Turbine.UI.Lotro.ItemInfoControl = function () end

---Initializes a new ItemInfoControl
---`ItemInfoControl()` : Initializes a new ItemInfoControl
---@return ItemInfoControl
function ItemInfoControl:Constructor() end

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

---Event fired when the enabled state of the control changes.
---@param sender table The event sender.
---@param args EventItemInfoControlEnabledChangedArgsTable The event arguments
ItemInfoControl.EnabledChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_LotroUI$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_LotroUIElement$Members.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_Quickslot$Members.html)
---A quickslot button for using skills or items.
---@class Quickslot : Control
Quickslot = {}

---Initializes a new Quickslot
---`Quickslot()` : Initializes a new Quickslot
---@return Quickslot
Turbine.UI.Lotro.Quickslot = function () end

---Initializes a new Quickslot
---`Quickslot()` : Initializes a new Quickslot
---@return Quickslot
function Quickslot:Constructor() end

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

---Event fired when a drag drop operation is completed.
---@param sender table The event sender.
---@param args EventQuickslotDragDropArgsTable The event arguments
Quickslot.DragDrop = function (sender, args) end

---Event fired when the shortcut changes.
---@param sender table The event sender.
---@param args EventQuickslotShortcutChangedArgsTable The event arguments
Quickslot.ShortcutChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_ScrollBar$Members.html)
---A standard Lord of the Rings scroll bar.
---@class LotroScrollBar : ScrollBar
LotroScrollBar = {}

---Initializes a new ScrollBar
---`ScrollBar()` : Initializes a new ScrollBar
---@return LotroScrollBar
Turbine.UI.Lotro.ScrollBar = function () end

---Initializes a new ScrollBar
---`ScrollBar()` : Initializes a new ScrollBar
---@return LotroScrollBar
function LotroScrollBar:Constructor() end

---Event fired when the orientation has changed.
---@param sender table The event sender.
---@param args EventLotroScrollBarOrientationChangedArgsTable The event arguments
LotroScrollBar.OrientationChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_Shortcut$Members.html)
---Encapsulates information about a short cut.
---@class Shortcut : Object
Shortcut = {}

---Initializes a new shortcut.
---`Shortcut()` : Initializes a new shortcut.
---`Shortcut(item)` : Initializes a new shortcut.
---`Shortcut(type, data)` : Initializes a new shortcut.
---@overload fun():Shortcut
---@overload fun(item:Item):Shortcut
---@diagnostic disable-next-line: undefined-doc-param
---@param item Item The item to create the shortcut from.
---@param type ShortcutType The type of shortcut that will be created.
---@param data string the data string associated with this shortcut.
---@return Shortcut
Turbine.UI.Lotro.Shortcut = function (type, data) end

---Initializes a new shortcut.
---`Shortcut()` : Initializes a new shortcut.
---`Shortcut(item)` : Initializes a new shortcut.
---`Shortcut(type, data)` : Initializes a new shortcut.
---@overload fun():Shortcut
---@overload fun(item:Item):Shortcut
---@diagnostic disable-next-line: undefined-doc-param
---@param item Item The item to create the shortcut from.
---@param type ShortcutType The type of shortcut that will be created.
---@param data string the data string associated with this shortcut.
---@return Shortcut
function Shortcut:Constructor(type, data) end

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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_ShortcutType.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_TextBox$Members.html)
---A standard Lord of the Rings text box.
---@class LotroTextBox : TextBox
LotroTextBox = {}

---Initializes a new TextBox
---`TextBox()` : Initializes a new TextBox
---@return LotroTextBox
Turbine.UI.Lotro.TextBox = function () end

---Initializes a new TextBox
---`TextBox()` : Initializes a new TextBox
---@return LotroTextBox
function LotroTextBox:Constructor() end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Lotro_Window$Members.html)
---A standard Lord of the Rings silver window.
---@class LotroWindow : Window
LotroWindow = {}

---Initializes a new Window
---`Window()` : Initializes a new Window
---@return LotroWindow
Turbine.UI.Lotro.Window = function () end

---Initializes a new Window
---`Window()` : Initializes a new Window
---@return LotroWindow
function LotroWindow:Constructor() end

---Gets if the window is resizable.
---@return boolean #True if the window can be resized.
function LotroWindow:IsResizable() end

---Sets if the window is resizable.
---@param value boolean True if the window can be resized.
function LotroWindow:SetResizable(value) end

---Sets the text of the window.
---@param value string The text of the window.
function LotroWindow:SetText(value) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_MenuItem$Members.html)
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
function MenuItem:Constructor(text, enabled, checked) end

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

---Event fired when a user clicks on the menu item.
---@param sender table The event sender.
---@param args EventMenuItemClickArgsTable The event arguments
MenuItem.Click = function (sender, args) end

---Gets the menu items collection.
---@return MenuItemList #Returns the menu items collection.
function MenuItem:GetItems() end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_MenuItemList$Members.html)
---Defines a list of menu items.
---@class MenuItemList : Object
MenuItemList = {}

---Initializes a new MenuItemList
---`MenuItemList()` : Initializes a new MenuItemList
---@return MenuItemList
Turbine.UI.MenuItemList = function () end

---Initializes a new MenuItemList
---`MenuItemList()` : Initializes a new MenuItemList
---@return MenuItemList
function MenuItemList:Constructor() end

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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_MouseButton.html)
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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Orientation.html)
---Specifies orientation of objects.
---@class Orientation
Orientation = {
	-- Specifies a horizontal layout.
	Horizontal = 0,
	-- Specifies a vertical layout.
	Vertical = 1,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_ScrollBar$Members.html)
---A control for scrolling contents.
---@class ScrollBar : Control
ScrollBar = {}

---Initializes a new ScrollBar
---`ScrollBar()` : Initializes a new ScrollBar
---@return ScrollBar
Turbine.UI.ScrollBar = function () end

---Initializes a new ScrollBar
---`ScrollBar()` : Initializes a new ScrollBar
---@return ScrollBar
function ScrollBar:Constructor() end

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

---Event fired when the orientation has changed.
---@param sender table The event sender.
---@param args EventScrollBarOrientationChangedArgsTable The event arguments
ScrollBar.OrientationChanged = function (sender, args) end

---Event fired when the value has changed.
---@param sender table The event sender.
---@param args EventScrollBarValueChangedArgsTable The event arguments
ScrollBar.ValueChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_ScrollableControl$Members.html)
---Defines a control that can be scrolled.
---@class ScrollableControl : Control
ScrollableControl = {}

---Initializes a new ScrollableControl
---`ScrollableControl()` : Initializes a new ScrollableControl
---@return ScrollableControl
Turbine.UI.ScrollableControl = function () end

---Initializes a new ScrollableControl
---`ScrollableControl()` : Initializes a new ScrollableControl
---@return ScrollableControl
function ScrollableControl:Constructor() end

---Gets the horizontal scroll bar.
---@return ScrollBar #The horizontal scroll bar.
function ScrollableControl:GetHorizontalScrollBar() end

---Gets the vertical scroll bar.
---@return ScrollBar #The vertical scroll bar.
function ScrollableControl:GetVerticalScrollBar() end

---Sets the horizontal scroll bar.
---@param value ScrollBar The horizontal scroll bar to use.
function ScrollableControl:SetHorizontalScrollBar(value) end

---Sets the vertical scroll bar.
---@param value ScrollBar The vertical scroll bar to use.
function ScrollableControl:SetVerticalScrollBar(value) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_TextBox$Members.html)
---A control for inputting text.
---@class TextBox : Label
TextBox = {}

---Initializes a new TextBox
---`TextBox()` : Initializes a new TextBox
---@return TextBox
Turbine.UI.TextBox = function () end

---Initializes a new TextBox
---`TextBox()` : Initializes a new TextBox
---@return TextBox
function TextBox:Constructor() end

---Gets a flag indicating if the text in the control is read only.
---@return boolean #True if the control is read only.
function TextBox:IsReadOnly() end

---Sets a flag indicating if the text in the control is read only.
---@param value boolean True to set the control to read only.
function TextBox:SetReadOnly(value) end

---Event fired when the enabled state of the control changes.
---@param sender table The event sender.
---@param args EventTextBoxEnabledChangedArgsTable The event arguments
TextBox.EnabledChanged = function (sender, args) end

---Event fired when the text is changed.
---@param sender table The event sender.
---@param args EventTextBoxTextChangedArgsTable The event arguments
TextBox.TextChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_TreeNode$Members.html)
---The base for any element that will be part of a tree view control.
---@class TreeNode : Control
TreeNode = {}

---Initializes a new TreeNode
---`TreeNode()` : Initializes a new TreeNode
---@return TreeNode
Turbine.UI.TreeNode = function () end

---Initializes a new TreeNode
---`TreeNode()` : Initializes a new TreeNode
---@return TreeNode
function TreeNode:Constructor() end

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

---Event fired when the selected state of the node has changed.
---@param sender table The event sender.
---@param args EventTreeNodeSelectedChangedArgsTable The event arguments
TreeNode.SelectedChanged = function (sender, args) end


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_TreeNodeList$Members.html)
---Defines a list of controls.
---@class TreeNodeList : Object
TreeNodeList = {}

---Initializes a new TreeNodeList
---`TreeNodeList()` : Initializes a new TreeNodeList
---@return TreeNodeList
Turbine.UI.TreeNodeList = function () end

---Initializes a new TreeNodeList
---`TreeNodeList()` : Initializes a new TreeNodeList
---@return TreeNodeList
function TreeNodeList:Constructor() end

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


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_TreeView$Members.html)
---A control to display data in a tree.
---@class TreeView : ScrollableControl
TreeView = {}

---Initializes a new TreeView
---`TreeView()` : Initializes a new TreeView
---@return TreeView
Turbine.UI.TreeView = function () end

---Initializes a new TreeView
---`TreeView()` : Initializes a new TreeView
---@return TreeView
function TreeView:Constructor() end

---Collapses all nodes in the tree view.
function TreeView:CollapseAll() end

---Expands all nodes in the tree view.
function TreeView:ExpandAll() end

---@alias TreeFilterFunc fun(node:TreeNode):boolean

---Gets a filter used to filter tree items.
---@return TreeFilterFunc #The filter used to filter tree items.
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

---@alias TreeSortFunc fun(nodea:TreeNode,nodeb:TreeNode):number

---Gets a function that is used to sort tree elements.
---@return TreeSortFunc #The function to sort tree elements.
function TreeView:GetSortMethod() end

---Causes the tree view to refilter and resort.
function TreeView:Refresh() end

---Sets a filter used to filter tree items.
---```
---function(node)
---   -- return false to keep node; otherwise true to filter
---   return false 
---end 
---```
---@param filterCallback TreeFilterFunc The filter used to filter tree items.
function TreeView:SetFilter(filterCallback) end

---Sets the width of the indentation insert prefer nodes at each level in the tree.
---@param value number The width in pixels to indent nested levels of tree nodes.
function TreeView:SetIndentationWidth(value) end

---Sets the currently selected node.
---@param value TreeNode The node to select.
function TreeView:SetSelectedNode(value) end

---Sets a function that is used to sort tree elements. This function needs to enforce consistent ordering or there is a potential for a client crash.
---The callback function takes two nodes to compare.  Return -1 if first node should come first, 0 if they are equal, or 1 if the second node comes first  
---```
-----example callback
---function (nodea, nodeb)
---	local texta = nodea:GetControls():Get(1):GetText();
---	local textb = nodeb:GetControls():Get(1):GetText();
---	 if texta == textb then
---		return 0
---	elseif texta < textb then
---		return -1
---	else
---		return 1
---	end
---end)
---```
---@param sortCallback TreeSortFunc The function to sort tree elements. 
function TreeView:SetSortMethod(sortCallback) end

---Event fired when the selected node has changed.
---@param sender table The event sender.
---@param args EventTreeViewSelectedNodeChangedArgsTable The event arguments
TreeView.SelectedNodeChanged = function (sender, args) end

---Gets the node at the specified position.
---@param x number 
---@param y number 
---@return TreeNode #The node at the specified location in the tree view otherwise if no node is there this will return nil.
function TreeView:GetItemAt(x, y) end

---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_VerticalLayout.html)
---Specifies how to perform vertical layouts.
---@class VerticalLayout
VerticalLayout = {
	-- Layout starting at the top and working down.
	TopToBottom = 0,
	-- Layout starting at the bottom and working up.
	BottomToTop = 1,
}


---[Documentation](https://lunarwtr.github.io/lotro-api-docs/U25/Turbine_UI_Window$Members.html)
---A top level window control.
---@class Window : Control
Window = {}

---Initializes a new Window
---`Window()` : Initializes a new Window
---@return Window
Turbine.UI.Window = function () end

---Initializes a new Window
---`Window()` : Initializes a new Window
---@return Window
function Window:Constructor() end

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

---Event fired when a window is activated.
---@param sender table The event sender.
---@param args EventWindowActivatedArgsTable The event arguments
Window.Activated = function (sender, args) end

---Event fired when a window is closed.
---@param sender table The event sender.
---@param args EventWindowClosedArgsTable The event arguments
Window.Closed = function (sender, args) end

---Event fired when a window is closing.
---@param sender table The event sender.
---@param args EventWindowClosingArgsTable The event arguments
Window.Closing = function (sender, args) end

---Event fired when a window is deactivated.
---@param sender table The event sender.
---@param args EventWindowDeactivatedArgsTable The event arguments
Window.Deactivated = function (sender, args) end

---(NOT A REAL CLASS) For describing data types and field names of table.
---@class WindowRotationTable : table<string, number>
---@field x number # rotate toward you
---@field y number # rotate left to right
---@field z number # rotate on the plane (an angle)
WindowRotationTable = {}

---Gets the rotation of a window
---@return WindowRotationTable
function Window:GetRotation() end

---Sets the rotation of a window
---@param rotation WindowRotationTable
function Window:SetRotation(rotation) end

---@alias Event1ArgsTable table

---@alias EventActiveSkillResetTimeChangedArgsTable table

---@alias EventActorBaseMaxMoraleChangedArgsTable table

---@alias EventActorBaseMaxPowerChangedArgsTable table

---@alias EventActorLevelChangedArgsTable table

---@alias EventActorMaxMoraleChangedArgsTable table

---@alias EventActorMaxPowerChangedArgsTable table

---@alias EventActorMaxTemporaryMoraleChangedArgsTable table

---@alias EventActorMaxTemporaryPowerChangedArgsTable table

---@alias EventActorMoraleChangedArgsTable table

---@alias EventActorPowerChangedArgsTable table

---@alias EventActorTargetChangedArgsTable table

---@alias EventActorTemporaryMoraleChangedArgsTable table

---@alias EventActorTemporaryPowerChangedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventBackpackItemAddedArgsTable : table
---@field Index number #
---@field Item Item #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventBackpackItemMovedArgsTable : table
---@field Item Item #
---@field NewIndex number #
---@field OldIndex number #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventBackpackItemRemovedArgsTable : table
---@field Index number #

---@alias EventBackpackSizeChangedArgsTable table

---@alias EventBankCapacityChangedArgsTable table

---@alias EventBankChestNameChangedArgsTable table

---@alias EventBankCountChangedArgsTable table

---@alias EventBankIsAvailableChangedArgsTable table

---@alias EventBankItemAddedArgsTable table

---@alias EventBankItemMovedArgsTable table

---@alias EventBankItemRemovedArgsTable table

---@alias EventBankItemsRefreshedArgsTable table

---@alias EventBasicMountMaxMoraleChangedArgsTable table

---@alias EventBasicMountMoraleChangedArgsTable table

---@alias EventBeorningAttributesFormChangedArgsTable table

---@alias EventBeorningAttributesWrathChangedArgsTable table

---@alias EventBurglarAttributesIsCriticalTier1ChangedArgsTable table

---@alias EventBurglarAttributesIsCriticalTier2ChangedArgsTable table

---@alias EventBurglarAttributesStanceChangedArgsTable table

---@alias EventButtonClickArgsTable table

---@alias EventButtonEnabledChangedArgsTable table

---@alias EventCaptainAttributesIsInEnemyDefeatResponseChangedArgsTable table

---@alias EventCaptainAttributesIsInFellowDefeatResponseChangedArgsTable table

---@alias EventCaptainAttributesIsReadiedTier1ChangedArgsTable table

---@alias EventCaptainAttributesIsReadiedTier2ChangedArgsTable table

---@alias EventChampionAttributesFervorChangedArgsTable table

---@alias EventChampionAttributesStanceChangedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventChatReceivedArgsTable : table
---@field ChatType number #
---@field Message string #
---@field Sender string #

---@alias EventCheckBoxCheckedChangedArgsTable table

---@alias EventCheckBoxEnabledChangedArgsTable table

---@alias EventCombatMountBaseMaxMoraleChangedArgsTable table

---@alias EventCombatMountBaseMaxPowerChangedArgsTable table

---@alias EventCombatMountFuryChangedArgsTable table

---@alias EventCombatMountMaxMoraleChangedArgsTable table

---@alias EventCombatMountMaxPowerChangedArgsTable table

---@alias EventCombatMountMaxTemporaryMoraleChangedArgsTable table

---@alias EventCombatMountMaxTemporaryPowerChangedArgsTable table

---@alias EventCombatMountMoraleChangedArgsTable table

---@alias EventCombatMountPowerChangedArgsTable table

---@alias EventCombatMountTemporaryMoraleChangedArgsTable table

---@alias EventCombatMountTemporaryPowerChangedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlDragDropArgsTable : table
---@field DragDropInfo DragDropInfo #
---@field X number #
---@field Y number #

---@alias EventControlDragEnterArgsTable table

---@alias EventControlDragLeaveArgsTable table

---@alias EventControlDragStartArgsTable table

---@alias EventControlEnabledChangedArgsTable table

---@alias EventControlFocusGainedArgsTable table

---@alias EventControlFocusLostArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlKeyDownArgsTable : table
---@field Action number #
---@field Alt number #
---@field Control number #
---@field Shift number #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlKeyUpArgsTable : table
---@field Action number #
---@field Alt number #
---@field Control number #
---@field Shift number #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlMouseClickArgsTable : table
---@field Button number #
---@field X number #
---@field Y number #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlMouseDoubleClickArgsTable : table
---@field Button number #
---@field X number #
---@field Y number #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlMouseDownArgsTable : table
---@field Button number #
---@field X number #
---@field Y number #

---@alias EventControlMouseEnterArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlMouseHoverArgsTable : table
---@field X number #
---@field Y number #

---@alias EventControlMouseLeaveArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlMouseMoveArgsTable : table
---@field X number #
---@field Y number #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlMouseUpArgsTable : table
---@field Button number #
---@field X number #
---@field Y number #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventControlMouseWheelArgsTable : table
---@field Direction number #
---@field X number #
---@field Y number #

---@alias EventControlPositionChangedArgsTable table

---@alias EventControlSizeChangedArgsTable table

---@alias EventControlUpdateArgsTable table

---@alias EventControlVisibleChangedArgsTable table

---@alias EventEffectCategoryChangedArgsTable table

---@alias EventEffectDescriptionChangedArgsTable table

---@alias EventEffectDurationChangedArgsTable table

---@alias EventEffectIconChangedArgsTable table

---@alias EventEffectIsCurableChangedArgsTable table

---@alias EventEffectIsDebuffChangedArgsTable table

---@alias EventEffectIsDispellableChangedArgsTable table

---@alias EventEffectNameChangedArgsTable table

---@alias EventEffectStartTimeChangedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventEffectListEffectAddedArgsTable : table
---@field Index number #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventEffectListEffectRemovedArgsTable : table
---@field Index number #

---@alias EventEffectListEffectsClearedArgsTable table

---@alias EventEntityNameChangedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventEquipmentItemEquippedArgsTable : table
---@field Index number #
---@field Item Item #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventEquipmentItemUnequippedArgsTable : table
---@field Index number #
---@field Item Item #

---@alias EventEquipmentSlotDragDropArgsTable table

---@alias EventGuardianAttributesIsBlockTier1AvailableChangedArgsTable table

---@alias EventGuardianAttributesIsBlockTier2AvailableChangedArgsTable table

---@alias EventGuardianAttributesIsBlockTier3AvailableChangedArgsTable table

---@alias EventGuardianAttributesIsParryTier1AvailableChangedArgsTable table

---@alias EventGuardianAttributesIsParryTier2AvailableChangedArgsTable table

---@alias EventGuardianAttributesIsParryTier3AvailableChangedArgsTable table

---@alias EventGuardianAttributesStanceChangedArgsTable table

---@alias EventHunterAttributesFocusChangedArgsTable table

---@alias EventHunterAttributesStanceChangedArgsTable table

---@alias EventItemInfoControlEnabledChangedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventListBoxItemAddedArgsTable : table
---@field Item Item #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventListBoxItemRemovedArgsTable : table
---@field Item Item #

---@alias EventListBoxSelectedIndexChangedArgsTable table

---@alias EventLocalPlayerInCombatChangedArgsTable table

---@alias EventLocalPlayerMountChangedArgsTable table

---@alias EventLotroScrollBarOrientationChangedArgsTable table

---@alias EventMenuItemClickArgsTable table

---@alias EventMinstrelAttributesIsSerenadeTier1ChangedArgsTable table

---@alias EventMinstrelAttributesIsSerenadeTier2ChangedArgsTable table

---@alias EventMinstrelAttributesIsSerenadeTier3ChangedArgsTable table

---@alias EventMinstrelAttributesStanceChangedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventPartyAssistTargetAddedArgsTable : table
---@field Player Player #

---@alias EventPartyAssistTargetRemovedArgsTable table

---@alias EventPartyLeaderChangedArgsTable table

---@alias EventPartyMemberAddedArgsTable table

---@alias EventPartyMemberRemovedArgsTable table

---@alias EventPlayerIsLinkDeadChangedArgsTable table

---@alias EventPlayerIsVoiceActiveChangedArgsTable table

---@alias EventPlayerIsVoiceEnabledChangedArgsTable table

---@alias EventPlayerPartyChangedArgsTable table

---@alias EventPlayerPetChangedArgsTable table

---@alias EventPlayerRaidChangedArgsTable table

---@alias EventPlayerReadyStateChangedArgsTable table

---@alias EventPluginLoadArgsTable table

---@alias EventPluginUnloadArgsTable table

---@alias EventProfessionInfoMasteryExperienceChangedArgsTable table

---@alias EventProfessionInfoMasteryExperienceTargetChangedArgsTable table

---@alias EventProfessionInfoMasteryLevelChangedArgsTable table

---@alias EventProfessionInfoMasteryTitleChangedArgsTable table

---@alias EventProfessionInfoProficiencyExperienceChangedArgsTable table

---@alias EventProfessionInfoProficiencyExperienceTargetChangedArgsTable table

---@alias EventProfessionInfoProficiencyLevelChangedArgsTable table

---@alias EventProfessionInfoProficiencyTitleChangedArgsTable table

---@alias EventProfessionInfoRecipeAddedArgsTable table

---@alias EventProfessionInfoRecipeRemovedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventQuickslotDragDropArgsTable : table
---@field DragDropInfo DragDropInfo #
---@field X number #
---@field Y number #

---@alias EventQuickslotShortcutChangedArgsTable table

---@alias EventRuneKeeperAttributesAttunementChangedArgsTable table

---@alias EventRuneKeeperAttributesIsChargedChangedArgsTable table

---@alias EventScrollBarOrientationChangedArgsTable table

---@alias EventScrollBarValueChangedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventSkillListSkillAddedArgsTable : table
---@field Index number #
---@field Skill Skill #

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventSkillListSkillRemovedArgsTable : table
---@field Index number #

---@alias EventTextBoxEnabledChangedArgsTable table

---@alias EventTextBoxTextChangedArgsTable table

---@alias EventTreeNodeSelectedChangedArgsTable table

---@alias EventTreeViewSelectedNodeChangedArgsTable table

---@alias EventTrollAttributesRampageChangedArgsTable table

---@alias EventWalletItemAddedArgsTable table

---@alias EventWalletItemRemovedArgsTable table

---@alias EventWalletItemMaxQuantityChangedArgsTable table

---@alias EventWalletItemQuantityChangedArgsTable table

---@alias EventWardenAttributesGambitChangedArgsTable table

---@alias EventWardenAttributesMaxGambitCountChangedArgsTable table

---@alias EventWardenAttributesStanceChangedArgsTable table

---@alias EventWindowActivatedArgsTable table

---@alias EventWindowClosedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the args table.
---@class EventWindowClosingArgsTable : table
---@field Cancel number #

---@alias EventWindowDeactivatedArgsTable table

---(NOT A REAL CLASS) For describing data types and field names of the GetDate table.
---@class EngineGetDateTable : table
---@field Year number
---@field Month number
---@field Day number
---@field Hour number
---@field Minute number
---@field Second number
---@field DayOfWeek number
---@field DayOfYear number
---@field IsDST boolean

---(NOT A REAL CLASS) For describing data types and field names of the GetLoadedPlugins table.
---@class PluginManagerGetLoadedPluginsTable : table
---@field Version string
---@field Package string
---@field Author string
---@field Name string
---@field ScriptState string

---(NOT A REAL CLASS) For describing data types and field names of the GetAvailablePlugins table.
---@class PluginManagerGetAvailablePluginsTable : PluginManagerGetLoadedPluginsTable
---@field Image string
---@field Description string

---Returns an iterator function that, each time it is called, returns the next captures from pattern pat over string s.
---If pat specifies no captures, then the whole match is produced in each call.
---@param str string the string to find pattern in
---@param pattern string the pattern to apply
---@return fun():string, ...
function string.gfind(str,pattern) end

---Updates the size of a table. If the table has a field "n" with a numerical value, that value is changed to the given n. Otherwise, it updates an internal state so that subsequent calls to table.getn(table) return n.
---@param list table #the table to set the size of
---@param n number #the size to set table
---@deprecated
function table.setn(list,n) end

---Returns the remainder of the division of `x` by `y` that rounds the quotient towards zero.
---
---Use `math.fmod` instead.
---@param x number
---@param y number
---@return number
---@deprecated
function math.mod(x,y) end
