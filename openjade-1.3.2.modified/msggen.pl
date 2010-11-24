#! /usr/bin/perl
# Copyright (c) 1994 James Clark, 2000 Matthias Clasen
# Copyright (c) 2000 Peter Nilsson
# See the file COPYING for copying permission.

use POSIX;

# Package and version.
$package = 'openjade';
$version = '1.3.2';
$package = $package; $version = $version; # be quiet, -w

$prog = $0;
$prog =~ s@.*/@@;

$gen_c = 0;

undef $opt_l;
undef $opt_p;
undef $opt_t;
do 'getopts.pl';
&Getopts('l:p:t:');
$module = $opt_l;
$pot_file = $opt_p;

if (defined($opt_t)) {
  # don't try to read translations for English
  $opt_t =~ /.*en.*/ || &read_po_translations($opt_t);
}

$num = 0; 

foreach $def_file (@ARGV) {

@tag_used = ();

open(DEF, $def_file) || die "can't open \`$def_file': $!\n";

while (<DEF>) {
    chop;
    if (/^!cxx$/) {
	$gen_c = 1;
	next;
    }
    if (/^=/) {
        if (!defined($opt_p)) {
	    $n = substr($_, 1);
	    &error("= directive must increase message num") if ($n < $num);
	    $num = $n;
        }
	next;
    }
    if (/^-/) {
	# a deleted message
	$num++;
	next;
    }
	
    next if /^[ 	]*#/;
    next if /^[ 	]*$/;
    @field = split('\+', $_, 5);
    &error("too few fields") if $#field < 3;
    if ($#field == 4 && $field[4] =~ /^%J/) {
	$field[3] .= '+';
	$field[3] .= substr($field[4], 2);
	$#field = 3;
    }
    if ($field[0] eq "") {
	$type[$num] = "";
	$argc = 0;
    }
    else {
	$field[0] =~ /^[IWQXE][0-9]$/ || &error("invalid first field");;
	$type[$num] = substr($field[0], 0, 1);
	$argc = int(substr($field[0], 1, 1));
    }
    $nargs[$num] = $argc;
    $field[1] =~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ || &error("invalid tag");
    $tag[$num] = $field[1];
    &error("duplicate tag $field[1]") 
      if (!defined($opt_p) && defined($tag_used{$field[1]}));
    $tag_used{$field[1]} = 1;
    $field[2] =~ /^((ISO(\/IEC)? [0-9]+:[0-9]+ )?(([A-Z]?[0-9]+(\.[0-9]+)*(p[0-9]+)?)|(\[[0-9]+(\.[0-9]*)?\]))( (ISO(\/IEC)? [0-9]+:[0-9]+ )?(([A-Z]?[0-9]+(\.[0-9]+)*(p[0-9]+)?)|(\[[0-9]+(\.[0-9]*)?\])))*)?$/
	|| &error("invalid clauses field");
    # push @clauses, $field[2];
    $clauses[$num] = $field[2];
    if ($argc == 0) {
	if ($field[0] ne "") {
	    $field[3] =~ /^([^%]|%%)*$/ || &error("invalid character after %");
	}
    }
    else {
	$field[3] =~ /^([^%]|%[%1-$argc])*$/ || &error("invalid character after %");
    }
    $auxloc[$num] = ($#field == 4 ? "L" : "");
    $message[$num] = $field[3];
    $num++;
    if ($#field == 4) {
	$message2[$num] = $field[4];
	$num++;
    }
}

close(DEF);

if (!defined($opt_p)) {

$file_base = $ARGV[0];
$file_base =~ s/\.[^.]*$//;

$class = $file_base;
$class =~ s|.*[\\/]||;

# this is needed on Windows NT
chmod 0666, "$file_base.h";
unlink("$file_base.h");
open(OUT, ">$file_base.h");
chmod 0444, "$file_base.h";
select(OUT);

print <<END;
// This file was automatically generated from $def_file by $prog.
END
print <<END if $gen_c;
#ifndef ${class}_INCLUDED
#define ${class}_INCLUDED 1

#ifdef __GNUG__
#pragma interface
#endif
END

print <<END;
#include <OpenSP/Message.h>

#ifdef SP_NAMESPACE
namespace SP_NAMESPACE {
#endif

struct $class {
END

foreach $i (0 .. $#message) {
    if (defined($message[$i])) {
	print "  // $i\n";
	print "  static const Message";
	if ($type[$i] eq "") {
	    print "Fragment";
	}
	else {
	    print "Type$nargs[$i]$auxloc[$i]";
	}
	print " $tag[$i];\n";
    }
}
print "};\n";


print <<END if $gen_c;

#ifdef SP_NAMESPACE
}
#endif

#endif /* not ${class}_INCLUDED */
END

if ($gen_c) {
    close(OUT);
    # this is needed on Windows NT
    chmod 0666, "$file_base.cxx";
    unlink("$file_base.cxx");
    open(OUT, ">$file_base.cxx");
    chmod 0444, "$file_base.cxx";
    select(OUT);

    print <<END;
// This file was automatically generated from $def_file by $prog.

#ifdef __GNUG__
#pragma implementation
#endif

#include "stylelib.h"
#include "$class.h"

#ifdef SP_NAMESPACE
namespace SP_NAMESPACE {
#endif

END
}

if (defined($opt_l)) {
    print "extern MessageModule $module;\n\n";
}

foreach $i (0 .. $#message) {
    if (defined($message[$i])) {
	if ($type[$i] eq "") {
	    print "const MessageFragment ${class}::$tag[$i](\n";
	}
	else {
	    print "const MessageType$nargs[$i]$auxloc[$i] ${class}::$tag[$i](\n";
	    print "MessageType::";
	    if ($type[$i] eq 'I') {
		print 'info';
	    }
	    elsif ($type[$i] eq 'W') {
		print 'warning';
	    }
	    elsif ($type[$i] eq 'Q') {
		print 'quantityError';
	    }
	    elsif ($type[$i] eq 'X') {
		print 'idrefError';
	    }
	    else {
		print 'error';
	    }
	    print ",\n";
	}
	if (defined($opt_l)) {
	    print "&$module,\n";
	} else {
	    print "0,\n";
	}
	print "$i\n";
	print "#ifndef SP_NO_MESSAGE_TEXT\n";
	$str = $message[$i];
	$str =~ s|\\|\\\\|g;
	$str =~ s|"|\\"|g;
	printf ",\"%s\"", $str; 
	if ($clauses[$i]) {
	  $str = $clauses[$i];
	  $str =~ s|\\|\\\\|g;
	  $str =~ s|"|\\"|g;
	  printf "\n,\"%s\"", $str; 
        }
	if ($auxloc[$i]) {
            if ($clauses[$i] eq "") {
              print "\n,0";
            }
	    $str = $message2[$i + 1];
	    $str =~ s|\\|\\\\|g;
	    $str =~ s|"|\\"|g;
	    printf "\n,\"%s\"", $str;
	}
	print "\n#endif\n";
	print ");\n";
    }
}
print <<END;
#ifdef SP_NAMESPACE
}
#endif
END

close(OUT);

# this is needed on Windows NT
chmod 0666, "$file_base.rc";
unlink("$file_base.rc");
open(OUT, ">$file_base.rc");
chmod 0444, "$file_base.rc";
select(OUT);

print "STRINGTABLE\nBEGIN\n";

foreach $i (0 .. $#message) {
    if (defined($message[$i])) {
	$str = $message[$i];
	if ($translation{$str}) {
	    $str = $translation{$str};
	}
	$str =~ s/"/""/g;
	printf "  %d, \"%s\"\n", $i, $str;
    }
    elsif (defined($message2[$i])) {
	$str = $message2[$i];
	$str =~ s/"/""/g;
	printf "  %d, \"%s\"\n", $i, $str;
    }
}

print "END\n";
close(OUT);

} # !opt_p

} # foreach def_file

if (defined($opt_p)) {

  # this is needed for GNU gettext 
  chmod 0666, "$pot_file";
  unlink("$pot_file");
  open(OUT, ">$pot_file");
  chmod 0444, "$pot_file";
  select(OUT);

  $crdate = POSIX::strftime "%Y-%m-%d %H:%M+0000", gmtime;
  print <<END;
# SOME DESCRIPTIVE TITLE.
# Copyright (C) YEAR HOLDER
# FIRST AUTHOR <EMAIL\@ADDRESS>, YEAR.
#
#, fuzzy
msgid ""
msgstr ""
"Project-Id-Version: PACKAGE VERSION\\n"
"POT-Creation-Date: $crdate\\n"
"PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\\n"
"Last-Translator: FULL NAME <EMAIL\@ADDRESS>\\n"
"Language-Team: LANGUAGE <LL\@li.org>\\n"
"MIME-Version:: 1.0\\n"
"Content-Type: text/plain; charset=CHARSET\\n"
"Content-Transfer-Encoding: ENCODING\\n"

END

  foreach $i (0 .. $#message) {
    if (defined($message[$i]) && !defined($written{$message[$i]})) {
	next if $message[$i] eq "";
	$written{$message[$i]} = 1;
	$str = $message[$i];
	$str =~ s/"/\\"/g;
	printf "msgid \"%s\"\nmsgstr \"\"\n\n", $str;
    }
    elsif (defined($message2[$i]) && ! defined($written{$message2[$i]})) {
	$written{$message2[$i]} = 1;
	$str = $message2[$i];
	$str =~ s/"/\\"/g;
	printf "msgid \"%s\"\nmsgstr \"\"\n\n", $str;
    }
 }
}

close(OUT);

sub error {
    die "$def_file:$.: $_[0]\n";
}

# Read a PO file with message translations.
# This doesn't accept every valid PO file, but it seems to work reasonably.
sub read_po_translations {
    my $po_in = $_[0];
    open(PO_IN, "<$po_in") || die "Can't open file $po_in.";
    my $id = "";
    my $str = "";
    my $catching_string = 0;

    while(<PO_IN>) {
	if (/^\s*msgid/) {
	    if ($catching_string) {
		&po_flush($id, $str);
		$id = "";
		$str = "";
	    }
	    $_ = $';
	    $catching_string = 1;
	}
	elsif (/^\s*msgstr/) {
	    die "No msgid." if !$catching_string or $id;
	    $id = $str;
	    $str = "";
	    $_ = $';
	}
	
	if ($catching_string) {
	    my $in_string = 0;
	    s/\s*//;
	    while ($_) {
		if (s/^\"//) {
		    $in_string = !$in_string;
		}
		if ($in_string) {
		    if (s/^[^\"\\]+//) {
			$str .= $&;
		    }
		    elsif (s/^\\([ntbrf\\\"])//) {
			$str .= "\n" if $1 eq "n";
			$str .= "\t" if $1 eq "t";
			$str .= "\b" if $1 eq "b";
			$str .= "\r" if $1 eq "r";
			$str .= "\f" if $1 eq "f";
			$str .= "\\" if $1 eq "\\";
			$str .= "\"" if $1 eq "\"";
		    }
		    elsif (s/\\([0-9]+)//) {
			$str .= chr(oct($1));
		    }
		    elsif (s/\\[xX]([0-9a-fA-F]+)//) {
			$str .= chr(hex($1));
		    }
		    else {
			die "Invalid control sequence." if /^\\/;
		    }
		}
		else {
		    s/\s*//;
		    last if /^[^"]/;
	        }
            }
        }
    }
    if ($catching_string) {
        &po_flush($id, $str);

    }
}

sub po_flush {
    my $id = $_[0];
    my $str = $_[1];
    # We use a translation only if $id is non-empty (we don't include the
    # PO file header) and if $str is non-empty (the message is translated).
    if ($id && $str) {
	$translation{$id} = $str;
    }
    $id = "";
    $str = "";
}


