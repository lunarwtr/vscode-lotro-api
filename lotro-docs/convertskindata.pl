#!/bin/perl

use strict;
use utf8;
use locale;
use JSON -support_by_pp;

my $skin = decode_json(loadfile('./SkinData.json', 'utf8'));
my %conv = ();

while (my($k, $a) = each %{ $skin->{assets} }) {
	$conv{a2id}{$a->{n}} = $k;
	$a->{id} = $k;
	$conv{assets}{$k} = $a;
}

my %dedup = ();
while (my($k, $p) = each %{ $skin->{panels} }) {
	foreach my $el (@{ $p }) {
		walk($el, $skin, \%dedup);
	}
}
$conv{e2a} = $dedup{e2a};

my $file = '../src/SkinData.json';
open OUT, ">:utf8", $file or die "Cannot open $file";
print OUT encode_json(\%conv);
close OUT;

exit;

sub walk {
	my($el, $skin, $ref) = @_;
	my $ass = $el->{assets};
	my $c = $el->{c};
	if (defined $ass) {
		foreach my $a (@{$ass}) {
			my $rec = $skin->{assets}{$a};
			if (!$ref->{seen}{$el->{id}}{$a}) {
				push(@{ $ref->{e2a}{$el->{id}} }, $rec);
				$ref->{seen}{$el->{id}}{$a} = 1;
			}
		}
	}
	if (defined $c) {
		foreach my $child (@{$c}) {
			walk($child, $skin, $ref);
		}
	}
}

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
