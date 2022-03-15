import "Turbine"
import "Turbine.Gameplay"
import "Turbine.UI"
import "Turbine.UI.Lotro"
import "TurbineDumper.Class"

local function dump(o)
    if o == nil then
        return "nil"
    end
    if type(o) == 'table' then
        local s = '{\n'
        for k,v in pairs(o) do
                if type(k) ~= 'number' then k = '"'..k..'"' end
                s = s .. '['..k..'] = ' .. dump(v) .. ',\n'
        end
        return s .. '},\n'
    else
        return tostring(o)
    end
end

local dumpdata = {}
local function dumpargs(name, args)
    dumpdata[name] = { Event = name, Args = args}
    Turbine.Shell.WriteLine('Dumper: ' .. name)
end

DumperWindow = class(Turbine.UI.Lotro.Window)
function DumperWindow:Constructor()
    Turbine.UI.Lotro.Window.Constructor( self )
    self:SetText("TurbineDumper")

    local player = Turbine.Gameplay.LocalPlayer.GetInstance()
    self.player = player
    local equipment = player:GetEquipment()
    local party = player:GetParty()
    local attributes = player:GetAttributes()
    local backpack = player:GetBackpack()
    local storage = player:GetVault()
    local mount = player:GetMount()
    local menu = Turbine.UI.ContextMenu()
    local menuItems = menu:GetItems()
    local menuItem = Turbine.UI.MenuItem( "Menu Item" )
    menuItems:Add(menuItem)
    menuItem.Click = function (sender, args) dumpargs("MenuItem.Click", args) end

	local btn = Turbine.UI.Lotro.Button()
	btn:SetSize(30,20)
 	btn:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter )
	btn:SetText("1")
	btn:SetParent(self)
	btn:SetPosition(0, 0)
    btn.Click = function (sender, args)
        dumpargs("Button.Click", args)
        Turbine.Shell.WriteLine('Attempting to save dumpdata')
        Turbine.PluginData.Save(Turbine.DataScope.Account, "TurbineDumper", dumpdata, function(a, b)
            Turbine.Shell.WriteLine('Turbine.PluginData.Save saveHandler[1]: ' .. dump(a))
            Turbine.Shell.WriteLine('Turbine.PluginData.Save saveHandler[2]: ' .. dump(b))
            --self:Close()
        end)
    end

    local btn2 = Turbine.UI.Lotro.Button()
	btn2:SetSize(30,20)
 	btn2:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter )
	btn2:SetText("2")
	btn2:SetParent(self)
	btn2:SetPosition(30, 0)
    btn2.Click = function (sender, args)
        dumpargs("Button.Click", args)
        menu:ShowMenu()
    end
    btn2.EnabledChanged = function (sender, args) dumpargs("Button.EnabledChanged", args) end
    local btn3 = Turbine.UI.Lotro.Button()
	btn3:SetSize(30,20)
 	btn3:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter )
	btn3:SetText("3")
	btn3:SetParent(self)
	btn3:SetPosition(30, 20)
    btn3.Click = function (sender, args)
        dumpargs("Button.Click", args)
        menu:ShowMenu()
    end
    btn3.MouseWheel = function (sender, args) dumpargs("Control.MouseWheel", args) end
    btn3:SetEnabled(false)
    btn3:SetEnabled(true)

    local textbox=Turbine.UI.Lotro.TextBox()
    textbox:SetParent(self)
    textbox:SetPosition(0, 40)
    textbox:SetSize(100,18)
    textbox:SetBackColor(Turbine.UI.Color.Gray)
    textbox:SetForeColor(Turbine.UI.Color.White)
    textbox:SetWantsUpdates(false)
    textbox.EnabledChanged = function (sender, args) dumpargs("TextBox.EnabledChanged", args) end
    textbox.TextChanged = function (sender, args) dumpargs("TextBox.TextChanged", args) end
    textbox:SetEnabled(false)
    textbox:SetEnabled(true)

	local list=Turbine.UI.ListBox()
	list:SetParent(self)
	list:SetPosition(0,60)
	list:SetSize(100, 100)
	list:SetSelectedIndex(1)
    list:SetBackColor(Turbine.UI.Color.Gray)
    list:SetWantsKeyEvents(true)
    list:SetMouseVisible(true)
	local listscroll=Turbine.UI.Lotro.ScrollBar()
	listscroll:SetParent(self)
	--listscroll:SetBackColor(Turbine.UI.Color.Yellow)
	listscroll:SetSize(10, 100)
    listscroll:SetPosition(110, 60)
    listscroll.OrientationChanged = function (sender, args) dumpargs("LotroScrollBar.OrientationChanged", args) end
    --listscroll.OrientationChanged = function (sender, args) dumpargs("ScrollBar.OrientationChanged", args) end
    listscroll.ValueChanged = function (sender, args) dumpargs("ScrollBar.ValueChanged", args) end
    listscroll:SetOrientation(Turbine.UI.Orientation.Horizontal)
    listscroll:SetOrientation(Turbine.UI.Orientation.Vertical)
    listscroll.MouseWheel = function (sender, args) dumpargs("Control.MouseWheel", args) end
    listscroll:SetValue(3)
    list:SetVerticalScrollBar(listscroll)

    local function additem(control, text, val)
        local item = Turbine.UI.Label()
        item:SetMultiline(false)
        item:SetSize(list:GetWidth()-11, 20)
        item:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft )
        item:SetBackColor(Turbine.UI.Color.Gray)
        item:SetForeColor(Turbine.UI.Color.White)
        item:SetText(text)
        item.DataValue= val
        item.isVisible = true
        item.Index = control:GetItemCount()+1
        control:AddItem(item)
    end
    list.ItemAdded = function (sender, args) dumpargs("ListBox.ItemAdded", args) end
    list.ItemRemoved = function (sender, args) dumpargs("ListBox.ItemRemoved", args) end
    list.SelectedIndexChanged = function (sender, args) dumpargs("ListBox.SelectedIndexChanged", args) end
    additem(list, "item1", 1)
    additem(list, "item2", 2)
    additem(list, "item3", 3)
    additem(list, "item4", 4)
    additem(list, "item4", 4)
    additem(list, "item4", 4)
    additem(list, "item4", 4)
    additem(list, "item4", 4)
    additem(list, "item4", 4)
    list:SetSelectedIndex(1)
    list:RemoveItemAt(2)

    backpack.ItemAdded = function (sender, args) dumpargs("Backpack.ItemAdded", args) end
    backpack.ItemMoved = function (sender, args) dumpargs("Backpack.ItemMoved", args) end
    backpack.ItemRemoved = function (sender, args) dumpargs("Backpack.ItemRemoved", args) end
    backpack.SizeChanged = function (sender, args) dumpargs("Backpack.SizeChanged", args) end
    storage.CapacityChanged = function (sender, args) dumpargs("Bank.CapacityChanged", args) end
    storage.ChestNameChanged = function (sender, args) dumpargs("Bank.ChestNameChanged", args) end
    storage.CountChanged = function (sender, args) dumpargs("Bank.CountChanged", args) end
    storage.IsAvailableChanged = function (sender, args) dumpargs("Bank.IsAvailableChanged", args) end
    storage.ItemAdded = function (sender, args) dumpargs("Bank.ItemAdded", args) end
    storage.ItemMoved = function (sender, args) dumpargs("Bank.ItemMoved", args) end
    storage.ItemRemoved = function (sender, args) dumpargs("Bank.ItemRemoved", args) end
    storage.ItemsRefreshed = function (sender, args) dumpargs("Bank.ItemsRefreshed", args) end

    player.BaseMaxMoraleChanged = function (sender, args) dumpargs("Actor.BaseMaxMoraleChanged", args) end
    player.BaseMaxPowerChanged = function (sender, args) dumpargs("Actor.BaseMaxPowerChanged", args) end
    player.LevelChanged = function (sender, args) dumpargs("Actor.LevelChanged", args) end
    player.MaxMoraleChanged = function (sender, args) dumpargs("Actor.MaxMoraleChanged", args) end
    player.MaxPowerChanged = function (sender, args) dumpargs("Actor.MaxPowerChanged", args) end
    player.MaxTemporaryMoraleChanged = function (sender, args) dumpargs("Actor.MaxTemporaryMoraleChanged", args) end
    player.MaxTemporaryPowerChanged = function (sender, args) dumpargs("Actor.MaxTemporaryPowerChanged", args) end
    player.MoraleChanged = function (sender, args) dumpargs("Actor.MoraleChanged", args) end
    player.PowerChanged = function (sender, args) dumpargs("Actor.PowerChanged", args) end
    player.TargetChanged = function (sender, args) dumpargs("Actor.TargetChanged", args) end
    player.TemporaryMoraleChanged = function (sender, args) dumpargs("Actor.TemporaryMoraleChanged", args) end
    player.TemporaryPowerChanged = function (sender, args) dumpargs("Actor.TemporaryPowerChanged", args) end
    player.InCombatChanged = function (sender, args) dumpargs("LocalPlayer.InCombatChanged", args) end
    player.MountChanged = function (sender, args) dumpargs("LocalPlayer.MountChanged", args) end
    player.IsLinkDeadChanged = function (sender, args) dumpargs("Player.IsLinkDeadChanged", args) end
    player.IsVoiceActiveChanged = function (sender, args) dumpargs("Player.IsVoiceActiveChanged", args) end
    player.IsVoiceEnabledChanged = function (sender, args) dumpargs("Player.IsVoiceEnabledChanged", args) end
    player.PartyChanged = function (sender, args) dumpargs("Player.PartyChanged", args) end
    player.PetChanged = function (sender, args) dumpargs("Player.PetChanged", args) end
    player.RaidChanged = function (sender, args) dumpargs("Player.RaidChanged", args) end
    player.ReadyStateChanged = function (sender, args) dumpargs("Player.ReadyStateChanged", args) end
    local pet = player:GetPet();
    if pet ~= nil then
        pet.NameChanged = function (sender, args) dumpargs("Entity.NameChanged", args) end
    end
    if party ~= nil then
        party.AssistTargetAdded = function (sender, args) dumpargs("Party.AssistTargetAdded", args) end
        party.AssistTargetRemoved = function (sender, args) dumpargs("Party.AssistTargetRemoved", args) end
        party.LeaderChanged = function (sender, args) dumpargs("Party.LeaderChanged", args) end
        party.MemberAdded = function (sender, args) dumpargs("Party.MemberAdded", args) end
        party.MemberRemoved = function (sender, args) dumpargs("Party.MemberRemoved", args) end
    end
    equipment.ItemEquipped = function (sender, args) dumpargs("Equipment.ItemEquipped", args) end
    equipment.ItemUnequipped = function (sender, args) dumpargs("Equipment.ItemUnequipped", args) end
    Turbine.Chat.Received = function(sender, args)
        dumpargs("Chat.Received", args)
        Turbine.Chat.Received = nil
    end
    plugin.Load = function (sender, args) dumpargs("Plugin.Load", args) end
    plugin.Unload = function (sender, args)
        dumpargs("Plugin.Unload", args)
        Turbine.PluginData.Save(Turbine.DataScope.Account, "TurbineDumper", dumpdata, function(a, b)
            Turbine.Shell.WriteLine('Turbine.PluginData.Save saveHandler[1]: ' .. dump(a))
            Turbine.Shell.WriteLine('Turbine.PluginData.Save saveHandler[2]: ' .. dump(b))
        end)
    end
    self.DragDrop = function (sender, args) dumpargs("Control.DragDrop", args) end
    self.DragEnter = function (sender, args) dumpargs("Control.DragEnter", args) end
    self.DragLeave = function (sender, args) dumpargs("Control.DragLeave", args) end
    self.DragStart = function (sender, args) dumpargs("Control.DragStart", args) end
    self.EnabledChanged = function (sender, args) dumpargs("Control.EnabledChanged", args) end
    self.FocusGained = function (sender, args) dumpargs("Control.FocusGained", args) end
    self.FocusLost = function (sender, args) dumpargs("Control.FocusLost", args) end
    self.KeyDown = function (sender, args)
        dumpargs("Control.KeyDown", args)
        self.KeyDown = nil
    end
    self.KeyUp = function (sender, args)
        dumpargs("Control.KeyUp", args)
        self.KeyUp = nil
    end
    self.MouseUp = function (sender, args)
        dumpargs("Control.MouseUp", args)
        self.MouseUp = nil
    end
    self.MouseClick = function (sender, args)
        dumpargs("Control.MouseClick", args)
        self.MouseClick = nil
    end
    self.MouseDoubleClick = function (sender, args)
        dumpargs("Control.MouseDoubleClick", args)
        self.MouseDoubleClick = nil
    end
    self.MouseDown = function (sender, args)
        dumpargs("Control.MouseDown", args)
        self.MouseDown = nil
    end
    self.MouseEnter = function (sender, args)
        dumpargs("Control.MouseEnter", args)
        self.MouseEnter = nil
    end
    self.MouseHover = function (sender, args)
        dumpargs("Control.MouseHover", args)
        self.MouseHover = nil
    end
    self.MouseLeave = function (sender, args)
        dumpargs("Control.MouseLeave", args)
        self.MouseLeave = nil
    end
    self.MouseMove = function (sender, args)
        dumpargs("Control.MouseMove", args)
        self.MouseMove = nil
    end

    self.PositionChanged = function (sender, args)
        dumpargs("Control.PositionChanged", args)
        self.PositionChanged = nil
    end
    self.SizeChanged = function (sender, args) dumpargs("Control.SizeChanged", args) end
    self.Update = function (sender, args)
        dumpargs("Control.Update", args)
        self.Update = nil
    end
    self.VisibleChanged = function (sender, args)
        dumpargs("Control.VisibleChanged", args) 
        --Turbine.Shell.WriteLine('wth: ' .. dump(sender))
    end
    self.Activated = function (sender, args) dumpargs("Window.Activated", args) end
    self.Closed = function (sender, args) dumpargs("Window.Closed", args) end
    self.Closing = function (sender, args) dumpargs("Window.Closing", args) end
    self.Deactivated = function (sender, args)
        dumpargs("Window.Deactivated", args)
        self:SetVisible(true)
    end

    local classattr = player:GetClassAttributes()
    classattr.FormChanged = function (sender, args) dumpargs("BeorningAttributes.FormChanged", args) end
    classattr.WrathChanged = function (sender, args) dumpargs("BeorningAttributes.WrathChanged", args) end
    classattr.IsCriticalTier1Changed = function (sender, args) dumpargs("BurglarAttributes.IsCriticalTier1Changed", args) end
    classattr.IsCriticalTier2Changed = function (sender, args) dumpargs("BurglarAttributes.IsCriticalTier2Changed", args) end
    classattr.StanceChanged = function (sender, args) dumpargs("(WardenAttributes|MinstrelAttributes|HunterAttributes|GuardianAttributes|ChampionAttributes|BurglarAttributes).StanceChanged", args) end
    classattr.IsInEnemyDefeatResponseChanged = function (sender, args) dumpargs("CaptainAttributes.IsInEnemyDefeatResponseChanged", args) end
    classattr.IsInFellowDefeatResponseChanged = function (sender, args) dumpargs("CaptainAttributes.IsInFellowDefeatResponseChanged", args) end
    classattr.IsReadiedTier1Changed = function (sender, args) dumpargs("CaptainAttributes.IsReadiedTier1Changed", args) end
    classattr.IsReadiedTier2Changed = function (sender, args) dumpargs("CaptainAttributes.IsReadiedTier2Changed", args) end
    classattr.FervorChanged = function (sender, args) dumpargs("ChampionAttributes.FervorChanged", args) end
    --classattr.StanceChanged = function (sender, args) dumpargs("ChampionAttributes.StanceChanged", args) end
    classattr.IsBlockTier1AvailableChanged = function (sender, args) dumpargs("GuardianAttributes.IsBlockTier1AvailableChanged", args) end
    classattr.IsBlockTier2AvailableChanged = function (sender, args) dumpargs("GuardianAttributes.IsBlockTier2AvailableChanged", args) end
    classattr.IsBlockTier3AvailableChanged = function (sender, args) dumpargs("GuardianAttributes.IsBlockTier3AvailableChanged", args) end
    classattr.IsParryTier1AvailableChanged = function (sender, args) dumpargs("GuardianAttributes.IsParryTier1AvailableChanged", args) end
    classattr.IsParryTier2AvailableChanged = function (sender, args) dumpargs("GuardianAttributes.IsParryTier2AvailableChanged", args) end
    classattr.IsParryTier3AvailableChanged = function (sender, args) dumpargs("GuardianAttributes.IsParryTier3AvailableChanged", args) end
    --classattr.StanceChanged = function (sender, args) dumpargs("GuardianAttributes.StanceChanged", args) end
    classattr.FocusChanged = function (sender, args) dumpargs("HunterAttributes.FocusChanged", args) end
    --classattr.StanceChanged = function (sender, args) dumpargs("HunterAttributes.StanceChanged", args) end
    classattr.IsSerenadeTier1Changed = function (sender, args) dumpargs("MinstrelAttributes.IsSerenadeTier1Changed", args) end
    classattr.IsSerenadeTier2Changed = function (sender, args) dumpargs("MinstrelAttributes.IsSerenadeTier2Changed", args) end
    classattr.IsSerenadeTier3Changed = function (sender, args) dumpargs("MinstrelAttributes.IsSerenadeTier3Changed", args) end
    --classattr.StanceChanged = function (sender, args) dumpargs("MinstrelAttributes.StanceChanged", args) end
    classattr.AttunementChanged = function (sender, args) dumpargs("RuneKeeperAttributes.AttunementChanged", args) end
    classattr.IsChargedChanged = function (sender, args) dumpargs("RuneKeeperAttributes.IsChargedChanged", args) end
    classattr.RampageChanged = function (sender, args) dumpargs("TrollAttributes.RampageChanged", args) end
    classattr.GambitChanged = function (sender, args) dumpargs("WardenAttributes.GambitChanged", args) end
    classattr.MaxGambitCountChanged = function (sender, args) dumpargs("WardenAttributes.MaxGambitCountChanged", args) end
    --classattr.StanceChanged = function (sender, args) dumpargs("WardenAttributes.StanceChanged", args) end

    if mount ~= nil then
        mount.MaxMoraleChanged = function (sender, args) dumpargs("BasicMount.MaxMoraleChanged", args) end
        mount.MoraleChanged = function (sender, args) dumpargs("BasicMount.MoraleChanged", args) end
    end
    local wallet = player:GetWallet()
    wallet.ItemAdded = function (sender, args) dumpargs("Wallet.ItemAdded", args) end
    wallet.ItemRemoved = function (sender, args) dumpargs("Wallet.ItemRemoved", args) end
    for i = 1, wallet:GetSize(), 1 do
        local walletitem = wallet:GetItem(i)
        if walletitem ~= nil then
            Turbine.Shell.WriteLine('Added Events for Wallet Item: ' .. walletitem:GetName())
            walletitem.MaxQuantityChanged = function (sender, args) dumpargs("WalletItem.MaxQuantityChanged", args) end
            walletitem.QuantityChanged = function (sender, args) dumpargs("WalletItem.QuantityChanged", args) end
        end
    end

    local trained = player:GetTrainedSkills()
    for i = 1, trained:GetCount(), 1 do
        local skill = trained:GetItem(i)
        skill.ResetTimeChanged = function (sender, args) dumpargs("ActiveSkill.ResetTimeChanged", args) end
    end
    trained.SkillAdded = function(sender, args)
        dumpargs("SkillList.SkillAdded", args)
    end
    trained.SkillRemoved = function(sender, args)
        dumpargs("SkillList.SkillRemoved", args)
    end
    local uts = player:GetUntrainedSkills();
    uts.SkillAdded = function(sender, args)
        dumpargs("SkillList.SkillAdded", args)
    end
    uts.SkillRemoved = function(sender, args)
        dumpargs("SkillList.SkillRemoved", args)
    end

    local effectlist = player:GetEffects()
    effectlist.EffectAdded = function (sender, args) dumpargs("EffectList.EffectAdded", args) end
    effectlist.EffectRemoved = function (sender, args) dumpargs("EffectList.EffectRemoved", args) end
    effectlist.EffectsCleared = function (sender, args) dumpargs("EffectList.EffectsCleared", args) end
    for i = 1, effectlist:GetCount(), 1 do
        local effect = effectlist:Get(i)
        Turbine.Shell.WriteLine('Added Events for Effect: ' .. effect:GetName())
        effect.CategoryChanged = function (sender, args) dumpargs("Effect.CategoryChanged", args) end
        effect.DescriptionChanged = function (sender, args) dumpargs("Effect.DescriptionChanged", args) end
        effect.DurationChanged = function (sender, args) dumpargs("Effect.DurationChanged", args) end
        effect.IconChanged = function (sender, args) dumpargs("Effect.IconChanged", args) end
        effect.IsCurableChanged = function (sender, args) dumpargs("Effect.IsCurableChanged", args) end
        effect.IsDebuffChanged = function (sender, args) dumpargs("Effect.IsDebuffChanged", args) end
        effect.IsDispellableChanged = function (sender, args) dumpargs("Effect.IsDispellableChanged", args) end
        effect.NameChanged = function (sender, args) dumpargs("Effect.NameChanged", args) end
        effect.StartTimeChanged = function (sender, args) dumpargs("Effect.StartTimeChanged", args) end
    end

    for index, value in pairs(Turbine.Gameplay.Profession) do
        if (value ~= nil and value ~= 0 and type(value) == "number") then
            local profinfo = attributes:GetProfessionInfo(value)
            if profinfo ~= nil then
                Turbine.Shell.WriteLine('Added Events for Profession: ' .. profinfo:GetName())
                profinfo.MasteryExperienceChanged = function (sender, args) dumpargs("ProfessionInfo.MasteryExperienceChanged", args) end
                profinfo.MasteryExperienceTargetChanged = function (sender, args) dumpargs("ProfessionInfo.MasteryExperienceTargetChanged", args) end
                profinfo.MasteryLevelChanged = function (sender, args) dumpargs("ProfessionInfo.MasteryLevelChanged", args) end
                profinfo.MasteryTitleChanged = function (sender, args) dumpargs("ProfessionInfo.MasteryTitleChanged", args) end
                profinfo.ProficiencyExperienceChanged = function (sender, args) dumpargs("ProfessionInfo.ProficiencyExperienceChanged", args) end
                profinfo.ProficiencyExperienceTargetChanged = function (sender, args) dumpargs("ProfessionInfo.ProficiencyExperienceTargetChanged", args) end
                profinfo.ProficiencyLevelChanged = function (sender, args) dumpargs("ProfessionInfo.ProficiencyLevelChanged", args) end
                profinfo.ProficiencyTitleChanged = function (sender, args) dumpargs("ProfessionInfo.ProficiencyTitleChanged", args) end
                profinfo.RecipeAdded = function (sender, args) dumpargs("ProfessionInfo.RecipeAdded", args) end
                profinfo.RecipeRemoved = function (sender, args) dumpargs("ProfessionInfo.RecipeRemoved", args) end
            end
        end
    end

	local quick = Turbine.UI.Lotro.Quickslot()
	quick:SetParent(self)
    quick:SetSize( 30, 30 )
    quick:SetPosition(140,250)
    quick:SetAllowDrop(true)
    quick:SetVisible(true)
    quick:SetBackColor(Turbine.UI.Color.Gray)
    quick.DragDrop = function (sender, args) dumpargs("Quickslot.DragDrop", args) end
    quick.ShortcutChanged = function (sender, args) dumpargs("Quickslot.ShortcutChanged", args) end

    local cbx = Turbine.UI.Lotro.CheckBox()
    cbx:SetParent(self)
    cbx:SetPosition(0, 200)
    cbx:SetSize(200,20)
    cbx:SetChecked(false)
    cbx:SetText("Check Me Out")
    cbx:SetVisible(true)
    cbx.CheckedChanged = function (sender, args)
        dumpargs("CheckBox.CheckedChanged", args)
    end
    cbx.EnabledChanged = function (sender, args) dumpargs("CheckBox.EnabledChanged", args) end
    cbx:SetEnabled(false)
    cbx:SetEnabled(true)

    local treeView = Turbine.UI.TreeView()
    treeView:SetParent( self )
    treeView:SetPosition( 115, 50 )
    treeView:SetSize( 100, 100 )
    treeView:SetIndentationWidth( 10 )
    treeView.SelectedNodeChanged = function (sender, args) dumpargs("TreeView.SelectedNodeChanged", args) end
    treeView:SetBackColor(Turbine.UI.Color.Gray)

    local rootNodes = treeView:GetNodes()
    local function createnode(text)
        local node = Turbine.UI.TreeNode()
        node:SetVisible(true)
        node:SetSize(treeView:GetWidth()-11, 20)
        node:SetWantsKeyEvents(true)
        node:SetMouseVisible(true)
        node.SelectedChanged = function (sender, args) dumpargs("TreeNode.SelectedChanged", args) end

        local item = Turbine.UI.Label()
        item:SetParent(node)
        item:SetMultiline(false)
        item:SetSize(node:GetWidth()-11, 20)
        item:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft )
        item:SetBackColor(Turbine.UI.Color.Gray)
        item:SetForeColor(Turbine.UI.Color.White)
        item:SetText(text)
        return node
    end
    local node = createnode("First Node")
    rootNodes:Add(node)
    node:GetChildNodes():Add(createnode("Second Node"))
    node:GetChildNodes():Add(createnode("Third Node"))
    rootNodes:Add(createnode("Fourth Node"))

    --[[
    ItemInfoControl.EnabledChanged = function (sender, args) end
    EquipmentSlot.DragDrop = function (sender, args) end
    CombatMount.BaseMaxMoraleChanged = function (sender, args) end
    CombatMount.BaseMaxPowerChanged = function (sender, args) end
    CombatMount.FuryChanged = function (sender, args) end
    CombatMount.MaxMoraleChanged = function (sender, args) end
    CombatMount.MaxPowerChanged = function (sender, args) end
    CombatMount.MaxTemporaryMoraleChanged = function (sender, args) end
    CombatMount.MaxTemporaryPowerChanged = function (sender, args) end
    CombatMount.MoraleChanged = function (sender, args) end
    CombatMount.PowerChanged = function (sender, args) end
    CombatMount.TemporaryMoraleChanged = function (sender, args) end
    CombatMount.TemporaryPowerChanged = function (sender, args) end
    ]]
end

---@diagnostic disable-next-line: lowercase-global
window = DumperWindow()
window:SetSize(500,400)
window:SetVisible(true)
window:SetPosition(((Turbine.UI.Display.GetWidth()/2)-(window:GetWidth()/2)),((Turbine.UI.Display.GetHeight()/3)-(window:GetHeight()/2)))
window:SetAllowDrop(true)
window:SetWantsKeyEvents(true)
window:SetEnabled(true)
window:SetMouseVisible(true)
window:SetWantsUpdates(true)
window:Focus()
