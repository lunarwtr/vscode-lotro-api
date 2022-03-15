#!/bin/perl

use strict;
use utf8;
use locale;
use JSON -support_by_pp;

my $DOC_BASE_PATH = 'U25';
my $events = decode_json(loadfile('TurbineEventsDump.json', 'utf8'));
my @alleventfuncs = eventfuncs();

foreach my $eventfunc (@alleventfuncs) {

	my $ref = $events->{$eventfunc};
	$ref = { Args => {} } unless ($ref);
	my $tablename = "Event${eventfunc}ArgsTable";
	$tablename =~ s/\.//g;

	my $args = $ref->{Args};
	my %fields = ();
	while (my($field, $val) = each %{ $ref->{Args} }) {
		my $type;
		if (ref($val) eq 'HASH') {
			#object of somekind
			$type = $field;
		} elsif ($val =~ m/^\d+$/) {
			$type = 'number';
		} elsif ($val =~ m/^(true|false)$/i) {
			$type = 'boolean';
		} else {
			$type = 'string'
		}
		$fields{$field} = $type;
	}
	if (scalar keys %fields) {
		print "\n---(NOT A REAL CLASS) For describing data types and field names of the args table.\n";
		print "---\@class $tablename : table\n";
		foreach my $field (sort keys %fields) {
			my $type = $fields{$field};
			print "---\@field $field $type #\n";
		}
		#print "$tablename = {}\n"
	} else {
		print "\n---\@alias $tablename table\n";
	}

}

exit;

sub loadfile {
    my ($file, $encoding) = @_;
	#print "$file\n";
    my $data = do {
        local $/ = undef;
        open my $fh, "<$encoding", $file or die "Cannot open $file";
        <$fh>;
    };	
    return $data;
}

sub trim {
    my ($str) = @_;
    $str =~ s/^\s+//s;
    $str =~ s/\s+$//s;
    return $str;
}

sub eventfuncs {
	return sort (
		'Chat.Received',
		'ActiveSkill.ResetTimeChanged',
		'Actor.BaseMaxMoraleChanged',
		'Actor.BaseMaxPowerChanged',
		'Actor.LevelChanged',
		'Actor.MaxMoraleChanged',
		'Actor.MaxPowerChanged',
		'Actor.MaxTemporaryMoraleChanged',
		'Actor.MaxTemporaryPowerChanged',
		'Actor.MoraleChanged',
		'Actor.PowerChanged',
		'Actor.TargetChanged',
		'Actor.TemporaryMoraleChanged',
		'Actor.TemporaryPowerChanged',
		'BeorningAttributes.FormChanged',
		'BeorningAttributes.WrathChanged',
		'BurglarAttributes.IsCriticalTier1Changed',
		'BurglarAttributes.IsCriticalTier2Changed',
		'BurglarAttributes.StanceChanged',
		'CaptainAttributes.IsInEnemyDefeatResponseChanged',
		'CaptainAttributes.IsInFellowDefeatResponseChanged',
		'CaptainAttributes.IsReadiedTier1Changed',
		'CaptainAttributes.IsReadiedTier2Changed',
		'ChampionAttributes.FervorChanged',
		'ChampionAttributes.StanceChanged',
		'GuardianAttributes.IsBlockTier1AvailableChanged',
		'GuardianAttributes.IsBlockTier2AvailableChanged',
		'GuardianAttributes.IsBlockTier3AvailableChanged',
		'GuardianAttributes.IsParryTier1AvailableChanged',
		'GuardianAttributes.IsParryTier2AvailableChanged',
		'GuardianAttributes.IsParryTier3AvailableChanged',
		'GuardianAttributes.StanceChanged',
		'HunterAttributes.FocusChanged',
		'HunterAttributes.StanceChanged',
		'MinstrelAttributes.IsSerenadeTier1Changed',
		'MinstrelAttributes.IsSerenadeTier2Changed',
		'MinstrelAttributes.IsSerenadeTier3Changed',
		'MinstrelAttributes.StanceChanged',
		'RuneKeeperAttributes.AttunementChanged',
		'RuneKeeperAttributes.IsChargedChanged',
		'TrollAttributes.RampageChanged',
		'WardenAttributes.GambitChanged',
		'WardenAttributes.MaxGambitCountChanged',
		'WardenAttributes.StanceChanged',
		'Backpack.ItemAdded',
		'Backpack.ItemMoved',
		'Backpack.ItemRemoved',
		'Backpack.SizeChanged',
		'Bank.CapacityChanged',
		'Bank.ChestNameChanged',
		'Bank.CountChanged',
		'Bank.IsAvailableChanged',
		'Bank.ItemAdded',
		'Bank.ItemMoved',
		'Bank.ItemRemoved',
		'Bank.ItemsRefreshed',
		'BasicMount.MaxMoraleChanged',
		'BasicMount.MoraleChanged',
		'CombatMount.BaseMaxMoraleChanged',
		'CombatMount.BaseMaxPowerChanged',
		'CombatMount.FuryChanged',
		'CombatMount.MaxMoraleChanged',
		'CombatMount.MaxPowerChanged',
		'CombatMount.MaxTemporaryMoraleChanged',
		'CombatMount.MaxTemporaryPowerChanged',
		'CombatMount.MoraleChanged',
		'CombatMount.PowerChanged',
		'CombatMount.TemporaryMoraleChanged',
		'CombatMount.TemporaryPowerChanged',
		'Effect.CategoryChanged',
		'Effect.DescriptionChanged',
		'Effect.DurationChanged',
		'Effect.IconChanged',
		'Effect.IsCurableChanged',
		'Effect.IsDebuffChanged',
		'Effect.IsDispellableChanged',
		'Effect.NameChanged',
		'Effect.StartTimeChanged',
		'EffectList.EffectAdded',
		'EffectList.EffectRemoved',
		'EffectList.EffectsCleared',
		'Entity.NameChanged',
		'Equipment.ItemEquipped',
		'Equipment.ItemUnequipped',
		'LocalPlayer.InCombatChanged',
		'LocalPlayer.MountChanged',
		'Party.AssistTargetAdded',
		'Party.AssistTargetRemoved',
		'Party.LeaderChanged',
		'Party.MemberAdded',
		'Party.MemberRemoved',
		'Player.IsLinkDeadChanged',
		'Player.IsVoiceActiveChanged',
		'Player.IsVoiceEnabledChanged',
		'Player.PartyChanged',
		'Player.PetChanged',
		'Player.RaidChanged',
		'Player.ReadyStateChanged',
		'ProfessionInfo.MasteryExperienceChanged',
		'ProfessionInfo.MasteryExperienceTargetChanged',
		'ProfessionInfo.MasteryLevelChanged',
		'ProfessionInfo.MasteryTitleChanged',
		'ProfessionInfo.ProficiencyExperienceChanged',
		'ProfessionInfo.ProficiencyExperienceTargetChanged',
		'ProfessionInfo.ProficiencyLevelChanged',
		'ProfessionInfo.ProficiencyTitleChanged',
		'ProfessionInfo.RecipeAdded',
		'ProfessionInfo.RecipeRemoved',
		'Wallet.ItemAdded',
		'Wallet.ItemRemoved',
		'WalletItem.MaxQuantityChanged',
		'WalletItem.QuantityChanged',
		'Plugin.Load',
		'Plugin.Unload',
		'Button.Click',
		'Button.EnabledChanged',
		'CheckBox.CheckedChanged',
		'CheckBox.EnabledChanged',
		'Control.DragDrop',
		'Control.DragEnter',
		'Control.DragLeave',
		'Control.DragStart',
		'Control.EnabledChanged',
		'Control.FocusGained',
		'Control.FocusLost',
		'Control.KeyDown',
		'Control.KeyUp',
		'Control.MouseClick',
		'Control.MouseDoubleClick',
		'Control.MouseDown',
		'Control.MouseEnter',
		'Control.MouseHover',
		'Control.MouseLeave',
		'Control.MouseMove',
		'Control.MouseUp',
		'Control.MouseWheel',
		'Control.PositionChanged',
		'Control.SizeChanged',
		'Control.Update',
		'Control.VisibleChanged',
		'ListBox.ItemAdded',
		'ListBox.ItemRemoved',
		'ListBox.SelectedIndexChanged',
		'EquipmentSlot.DragDrop',
		'ItemInfoControl.EnabledChanged',
		'Quickslot.DragDrop',
		'Quickslot.ShortcutChanged',
		'LotroScrollBar.OrientationChanged',
		'MenuItem.Click',
		'ScrollBar.OrientationChanged',
		'ScrollBar.ValueChanged',
		'SkillList.SkillAdded',
		'SkillList.SkillRemoved',
		'TextBox.EnabledChanged',
		'TextBox.TextChanged',
		'TreeNode.SelectedChanged',
		'TreeView.SelectedNodeChanged',
		'Window.Activated',
		'Window.Closed',
		'Window.Closing',
		'Window.Deactivated' => 1
	);

}