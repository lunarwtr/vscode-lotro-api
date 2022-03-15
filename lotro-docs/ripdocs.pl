#!/bin/perl

use strict;
use utf8;
use locale;
use Data::Dumper;
use Encode qw(from_to);
use HTML::Entities;
use Mojo::DOM;
use JSON -support_by_pp;

# classes that collide in namespace
my %longnametoclass = (
	"Turbine.UI.Lotro.Button" => "LotroButton",
	"Turbine.UI.Lotro.CheckBox" => "LotroCheckBox",
	"Turbine.UI.Lotro.DragDropInfo" => "LotroDragDropInfo",
	#"Turbine.UI.Lotro.EquipmentSlot" => "LotroEquipmentSlot",
	"Turbine.UI.Lotro.ScrollBar" => "LotroScrollBar",
	"Turbine.UI.Lotro.TextBox" => "LotroTextBox",
	"Turbine.UI.Lotro.Window" => "LotroWindow"
);

my $DOC_BASE_PATH = 'U25';
my $turbineDump = decode_json(loadfile('TurbineDump.json', 'utf8'));

my %pagecache = ();
my $root = rippage('package_index.html', 'unknown');

my %docmap = ();
# my $json = JSON->new;
# $json->allow_nonref->escape_slash->encode("/");
# print $json->pretty->encode($root);
# exit;
converttree($root);

# hack to move enums from old location ... remove after LUA documenation is updated past U25
$docmap{Turbine}{Gameplay}{Equipment}{field} = $docmap{Turbine}{Gameplay}{EquipmentSlot}{field};
$docmap{Turbine}{Gameplay}{Equipment}{__details}{langtype} = 'enumeration';
delete $docmap{Turbine}{Gameplay}{EquipmentSlot};

open OUT, ">:utf8", "../Lua/EmmyLua/Turbine/Turbine.lua" or die "Cannot open Turbine.lua: $!";
emmylua($docmap{'Turbine'});
close OUT;
# my $json = JSON->new;
# $json->allow_nonref->escape_slash->encode("/");
# print $json->pretty->encode(\%docmap);

exit;

sub emmylua {
	my($node) = @_;

	my $d = $node->{'__details'};
	if ($d->{description}) {
		my $desc = commentnewline($d->{description});
		print OUT "---$desc\n";
	}
	#print OUT "---$d->{remarks}\n" if ($d->{remarks});
	my $name = determineclassname($d->{longname});
	my $class = $name;
	if ($d->{extends}) {
		my $parent = determineclassname($d->{extends});
		$class .= " : $parent";
	}
	print OUT "---\@class $class\n";
	foreach my $field (sort keys %{ $node }) {
		next if ($field =~ m/^(__details|constructor|event|field|method|overload)$/);
		my $hasconstructor = defined $node->{$field}{constructor};
		my $type = determineclassname($node->{$field}{__details}{longname});
		if ($hasconstructor) {
			$type = "$type | function";
		}
		my $desc = commentnewline($node->{$field}{__details}{description}, 1);
		print OUT "---\@field $field $type $desc\n";
	}
	if (defined $node->{field}) {
		my @fields = @{ $node->{field} };
		my $hasprimval = $d->{langtype} eq 'enumeration' || ($fields[0]{type} !~ /Turbine/ && $name ne 'Color');
		if ($hasprimval) {
			print OUT "$d->{name} = {\n";
			foreach my $ref (sort { $a->{value} <=> $b->{value} } @fields) {
				my $desc = commentnewline($ref->{description});
				print OUT "\t-- $desc\n";
				print OUT "\t$ref->{name} = $ref->{value},\n";
			}
			print OUT "}\n";
		} else {
			foreach my $ref (sort { $a->{name} cmp $b->{name} } @fields) {
				my $type = determineclassname($ref->{type});
				print OUT "---\@field $ref->{name} $type `$ref->{description}`\n";
			}
			print OUT "$name = {}\n";
		}
	} else {
		print OUT "$name = {}\n";
	}
	# Constructor
	if (defined $node->{constructor}) {
		my $c = $node->{constructor};
		my $desc = commentnewline($c->{description});
		my $num = scalar @{$c->{overload}};
		my @allparams = ();
		my @descriptions = ("\n---$desc\n");
		my @overloads = ();
		my %paraminfos = ();
		for (my $i = 0; $i < $num; $i++) {
			my $ref = $c->{overload}[$i];
			if ($ref->{description}) {
				my $desc = commentnewline($ref->{description});
				push(@descriptions, "---`$ref->{name}` : $desc\n");
			}
			my $s = $ref->{syntax};
			my $islast = $i == ($num - 1);
			my @params = ();
			if (defined $s->{params}) {
				foreach my $param (@{$s->{params}}) {
					my $type = determineclassname($param->{type});
					my $desc = commentnewline($param->{description});
					push(@params, $islast ? $param->{name} : "$param->{name}:$type");
					push(@allparams, $param->{name}) unless ($paraminfos{$param->{name}});
					$paraminfos{$param->{name}} = "---\@param $param->{name} $type $desc\n";
				}
			}
			my $paramstr = join(", ", @params);
			if ($islast) {
				# __call constructor
				foreach my $val (@descriptions) {
					print OUT "$val";
				}
				foreach my $val (@overloads) {
					print OUT "$val";
				}
				foreach my $param (@allparams) {
					print OUT $paraminfos{$param};
				}
				print OUT "---\@return $name\n";
				print OUT "$d->{longname} = function ($paramstr) end\n";

				# now literal constructors
				foreach my $val (@descriptions) {
					print OUT "$val";
				}
				foreach my $val (@overloads) {
					print OUT "$val";
				}
				foreach my $param (@allparams) {
					print OUT $paraminfos{$param};
				}
				print OUT "---\@return $name\n";
				print OUT "function $name:Constructor($paramstr) end\n";				
			} else {
				push(@overloads, "---\@overload fun($paramstr):$name\n");
			}
		}
	}

	# Methods
	my %methods = ('Constructor' => 1, 'IsA' => 1);
	foreach my $methodtype ("method", "event") {
		if (defined $node->{$methodtype}) {
			foreach my $ref (sort { $a->{name} cmp $b->{name} } @{ $node->{$methodtype} }) {
				$methods{$ref->{name}} = 1;
				print OUT "\n";
				if ($ref->{description}) {
					my $desc = commentnewline($ref->{description});
					print OUT "---$desc\n";
				}
				my $s = $ref->{syntax};
				my @params = ();
				if (defined $s->{params}) {
					foreach my $param (@{$s->{params}}) {
						my $type = determineclassname($param->{type});
						my $desc = commentnewline($param->{description});
						if ($methodtype eq 'event' && $param->{name} eq 'args') {
							my $tablename = "Event${name}$ref->{name}ArgsTable";
							$tablename =~ s/\.//g;
							$type = $tablename;
						}
						print OUT "---\@param $param->{name} $type $desc\n";
						push(@params, $param->{name});
					}
				}
				if (defined $s->{return}) {
					my $r = $s->{return};
					my $type = determineclassname($r->{type});
					my $desc = commentnewline($r->{description});
					foreach my $rpiece (split(/,\s*/, $type)) {
						print OUT "---\@return $rpiece \#$desc\n";
						$desc = '';
					}
				}
				my $paramstr = join(", ", @params);
				if ($ref->{icon} =~ m/static/i || $methodtype eq 'event') {
					print OUT "$name.$ref->{name} = function ($paramstr) end\n";
				} else {
					print OUT "function $name:$ref->{name}($paramstr) end\n";
				}
			}
		}
		my $cls = loadturbinevalues($d->{longname});
		if (defined $cls) {
			while (my($k,$r) = each %{$cls}) {
				if ($r->{type} eq 'function' && !$methods{$k}) {
					#print "New Method: $d->{longname}:$k\n";
				}
			}
		}
	}
	foreach my $field (sort keys %{ $node }) {
		next if ($field =~ m/^(__details|constructor|event|field|method|overload)$/);
		print OUT "\n\n";
		emmylua($node->{$field});
	}

}

sub converttree {
	my($node, $db) = @_;
	my $ln = $node->{longname};
	my $type = $node->{langtype};
	my $ndb;
	if ($type eq 'unknown') {
		# do nothing
	} elsif ($type =~ m/^(package|class|enumeration)$/i) {
		$ndb = $db = nestref(\%docmap, $ln);
		shallowcopy($node, $ndb->{'__details'}, { sections => 1 });
	} else {
		my %misc = ();
		if ($type eq 'constructor') {
			$db->{$type} = \%misc;
		} else {
			push(@{$db->{$type}}, \%misc);
		}
		shallowcopy($node, \%misc, { sections => 1 });
		$ndb = \%misc;
	}
	if ($node->{sections}) {
		while (my($section, $ref) = each %{$node->{sections}}) {
			$ref = ref $ref eq 'ARRAY' ? $ref : [$ref];
			foreach my $childnode (@{ $ref }) {
				converttree($childnode, $ndb);
			}
		}
	}
}

sub shallowcopy {
	my($from, $to, $skips) = @_;
	while (my($key, $ref) = each %{$from}) {
		if (! defined $skips || !$skips->{$key}) {
			$to->{$key} = $ref;
		}
	}
}

sub rippage {
	my ($file, $type, $parent) = @_;

	if (defined $pagecache{$file}) {
		if ($file ne 'Turbine_Gameplay_Attributes.html') {
			return $pagecache{$file};
		} elsif ($type eq 'packages') {
			# in this edgecase we dont' want to use cache
		} else {
			return $pagecache{$file};
		}
	}

    my $data  = loadfile("$DOC_BASE_PATH/$file", ':raw:encoding(UTF-16)');

	# Known Sections:
	# classes, constructors, enumerations, events, examples, fields
	# inheritance, methods, overloads, packages, remarks, seealso, syntax
	my %page = (
		link => $file,
		longname => file2id($file),
		langtype => nonplural($type),
		sections => {}
	);
	my $turbineref = undef;
	if ($type eq 'classes') {
		# API documentation is missing a lot of default constructors
		# so putting in placeholder if turbine dump shows one
		$turbineref = loadturbinevalues($page{longname});
		if (defined $turbineref && $turbineref->{Constructor}) {
			my $shortname = lastpiece($page{longname});
			$page{sections}{constructors} = [{
				name => $shortname,
				description => "Initializes a new $shortname",
				langtype => "constructor",
				sections => {
					overloads => [{
						description => "Initializes a new $shortname",
						syntax => {},
						langtype => "overload",
						name => "$shortname()"
					}]
				}
			}];
		}
		$turbineref = undef;
	}
	if ($type eq 'enumerations' || $page{longname} =~ m/^(Turbine\.UI\.(Lotro\.LotroUIElement|Color))$/) {
		if ($page{longname} eq 'Turbine.Gameplay.EquipmentSlot') {
			$turbineref = loadturbinevalues('Turbine.Gameplay.Equipment');
		} else {
			$turbineref = loadturbinevalues($page{longname});
		}
	}
	$pagecache{$file} = \%page;
	my $dom = Mojo::DOM->new;
	$dom->parse($data);

	if ($page{longname} eq 'Turbine.Gameplay.Attributes' && $type eq 'packages') {
		# hack to get missing documentation ripped.. the attributes is both a package and a class
		# and their html generation looks messed up.
		my @rows = ();
		foreach my $newfile (glob("$DOC_BASE_PATH/Turbine_Gameplay_Attributes_*Attributes.html $DOC_BASE_PATH/Turbine_Gameplay_ClassAttributes.html")) {
			$newfile =~ s/^.*\///;
			my $longname = file2id($newfile);
			my $name = $longname;
			$name =~ s/^.*\.//;
			my %rec = ( longname => $longname, name => $name, link => $newfile );
			my $newpage = rippage($rec{link}, 'classes', $page{longname});
			while (my($key, $ref) = each %{$newpage}) {
				$rec{$key} = $ref;
			}
			my $memberfile = $newfile;
			$memberfile =~ s/\.html$/\$Members.html/;
			if (-e "$DOC_BASE_PATH/$memberfile") {
				$newpage = rippage($memberfile, 'classes', $page{longname});
				while (my($key, $ref) = each %{$newpage}) {
					$rec{$key} = $ref;
				}
			}
			push(@rows, \%rec);
		}
		$page{sections}{'classes'} = \@rows;
	}
	for my $dd ($dom->find('div[class*="Section"]')->each) {
        my $section = lc($dd->attr->{id});
		$section =~ s/section$//;
        my $html    = $dd->content;
		
		if ($section eq 'remarks') {
			$page{$section} = sanitize($html, 1);
		} elsif ($section eq 'syntax') {
			my %syntax = ();
			if ($html =~ m/<pre xml:space="preserve">(.*?)<\/pre>/is) {
				# TODO: good classification info we might not wanna lose
				$syntax{code} = sanitize($1);
			}
			if ($html =~ m/<div id="returns">(.*?)<\/div>/is) {
				my %ret = parsetype($1, $file);
				$syntax{return} = \%ret;
			}
			if ($html =~ m/<div id="parameters">(.*?)<\/div>/is) {
				my $parhtml = $1;
				my @params = ();
				while ( $parhtml =~ m/<dl paramname="([^"]+)">(.*?)<\/dl>/gis ) {
					my $name = $1;
					my %param = parsetype($2);
					$param{name} = $name;
					push(@params, \%param);
				}
				$syntax{params} = \@params;
			}
			$page{$section} = \%syntax;
		} elsif ($section eq 'inheritance') {
			my @hierarchy = split(/<br>/, htmldecode($html));
			my $last;
			for (my $i = 0; $i < scalar @hierarchy; $i++) {
				my $cur = sanitize($hierarchy[$i]);
				if ($cur eq $page{longname}) {
					$page{extends} = $last;
					last;
				}
				$last = $cur;
			}
		} elsif ($html =~ m/(<table.*?id="memberList".*?<\/table>)/is ) {
			my @tobeprocessed = tablerows( $1, 1 );
			my @rows = ();
			foreach my $rec (@tobeprocessed) {
				if ($rec->{name} =~ m/<a href="([^"]+)">([^<]+)/) {
					$rec->{link} = $1;
					$rec->{name} = striptags($2);
					$rec->{link} =~ s/(&#xA;)?[\s\x{a}]+//;
					$rec->{longname} = file2id($rec->{link});
					if ($rec->{description} =~ m/inherited from/i) {
						# will be recorded in parent
						next;
					}
					my $newpage = rippage($rec->{link}, $section, $page{longname});
					while (my($key, $ref) = each %{$newpage}) {
						$rec->{$key} = $ref;
					}
				} else {
					$rec->{name} = striptags($rec->{name});					
					$rec->{longname} = $page{longname} . '.' . $rec->{name};
				}
				$rec->{langtype} = nonplural($section);
				if ($section eq 'methods') {
					$rec->{longname} = $page{longname} . ':' . $rec->{name};
				} elsif ($section eq 'fields' && defined $turbineref) {
					# only the turbine dump data has the actual enum values
					my $frec = $turbineref->{$rec->{name}};
					if (defined $frec) {
						while (my($key, $ref) = each %{$frec}) {
							$rec->{$key} = $ref;
						}
					} else {
						#print "DIDN'T FIND: $page{longname}.$rec->{name}\n";
						# likely removed from API
						next if ($page{longname} !~ m/Turbine.UI.Color/);
					}
				} elsif ($section eq 'classes' && $rec->{link}) {
				# sub in class member infos
					my $memberfile = $rec->{link};
					$memberfile =~ s/\.html$/\$Members.html/;
					if (-e "$DOC_BASE_PATH/$memberfile") {
						my $newpage = rippage($memberfile, $section, $page{longname});
						while (my($key, $ref) = each %{$newpage}) {
							$rec->{$key} = $ref;
						}
					}
				}
				push(@rows, $rec);
			}
			# documentation doesn't have default color fields. so pull that from dump data
			if ($section eq 'fields') {
				if ($page{longname} eq 'Turbine.UI.Color') {
					foreach my $color (sort keys %{$turbineref}) {
						my $cr = $turbineref->{$color};
						my %color = (
							langtype => "field",
							longname => "Turbine.UI.Color.${color}",
							name => "${color}",
							# Color(a, r, g, b);
							type => "Turbine.UI.Color",
							description => "Turbine.UI.Color($cr->{A}{value},$cr->{R}{value},$cr->{G}{value},$cr->{B}{value})"
						);
						push(@rows, \%color);
					}
				}
			}
			$page{sections}{$section} = \@rows
		}
    }
	return \%page;
}

sub loadturbinevalues {
	my($enumname) = @_;
	my @pieces = split(/\./,trim($enumname));
	my $ref = $turbineDump;
	while (defined $ref && scalar @pieces) {
		$ref = $ref->{shift @pieces};
	}
	return $ref;
}

sub nestref {
	my($db, $name) = @_;
	my @pieces = split(/\./,trim($name));
	my $ref = $db;
	while (defined $ref && scalar @pieces) {
		my $cur = shift @pieces;
		$ref->{$cur} = {} if (!defined $ref->{$cur});
		$ref = $ref->{$cur};
	}
	$ref->{'__details'} = {} if (!defined $ref->{'__details'});
	return $ref;
}


sub parsetype {
	my($html, $fromfile) = @_;
	my %rec = ( type => 'object' );
	if ($html =~ m/<span class="type">(.*?)<\/span>(.*)$/is) {
		my $typename = trim($1);
		my $typedesc = sanitize($2);
		$typename =~ s/^Type:\s+//is;
		if ($typename =~ m/<a href="([^"]+)">/) {
			my $typelink = trim($1);
			$typename = file2id($typelink);
			$rec{link} = $typelink;
		}
		$rec{type} = $typename;
		$rec{description} = $typedesc;
	} else {
		print "BAD RETURN!!!: $fromfile --> $html\n";
		$html =~ s/<span class="parameter">.*?<\/span>//;
		$rec{type} = sanitize($html, 1);
		$rec{type} =~ s/^Type:\s+//is;
	}
	return %rec;
}

sub nonplural {
	my($word) = @_;
	$word =~ s/s$//;
	$word =~ s/classe$/class/;
	return $word;
}

sub file2id {
	my($file) = @_;
    my $id = $file;
    $id =~ s/\$.*$//;
    $id =~ s/_/./g;
	$id =~ s/\.html$//;
	return $id;
}

sub tablerows {
    my ( $html, $hasheader ) = @_;
    my @rows    = ( $html =~ /<tr>(.*?)<\/tr>/gis );
    my %headers = ();
    my @records = ();
    for ( my $i = 0 ; $i < scalar @rows ; $i++ ) {
		my $row = $rows[$i];
        if ( $hasheader && $i == 0 ) {
            my @cols = ( $row =~ /<th class="(\w+?)Column">.*?<\/th>/gis );
            %headers = map { $cols[$_] => $_ } 0 .. scalar(@cols) - 1;
        }
        elsif ($hasheader) {
            my @data = ( $row =~ /<td>(.*?)<\/td>/gis );
            my %rec = map { $_ => trim(htmldecode($data[ $headers{$_} ])) } keys %headers;
            push( @records, \%rec );
        }
        else {
            #my @data = ( $row =~ /<td>(.*?)<\/td>/gis );
            #push( @records, \@data );
        }
    }
    return @records;
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

sub htmldecode {
    my ($html) = @_;
    $html =~ s/&nbsp;/ /gis;
    $html = HTML::Entities::decode($html);
    return $html;
}

sub striptags {
    my ($html) = @_;
    $html =~ s/<[^>]+>//gis;
    $html = htmldecode($html);
    return trim($html);
}

sub sanitize {
    my ( $html, $nonl ) = @_;
    $html =~ s/\\n/\n/gs;
    $html =~ s/<br\s*?\/?>/\n/gs;
    $html = striptags($html);
    $html =~ s/\r\n/\n/gis;
    $html =~ s/\r/\n/gis;
    if ($nonl) {
        $html =~ s/\n+/ /gs;
        $html =~ s/\s+/ /gs;
    }
    return trim($html);
}

sub trim {
    my ($str) = @_;
    $str =~ s/^\s+//s;
    $str =~ s/\s+$//s;
    return $str;
}

sub lastpiece {
	my ($val) = @_;
	my @pieces = split(/\./, $val);
	return pop @pieces;
}

sub commentnewline {
	my ($str, $strip) = @_;
	if ($strip) {
		$str =~ s/\n\s*/ /gs;
	} else {
		$str =~ s/\n/\n---/gs;
	}
	return $str;
}

sub determineclassname {
	my($ln) = @_;
	return $longnametoclass{$ln} if (defined $longnametoclass{$ln});
	return lastpiece($ln);
}