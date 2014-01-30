#!/usr/bin/perl -w
use strict;
 
 
# Dear world,
#
# this is what your code will look like when you're too tired to
# actually write code. So, remember, kids: Sleep early, sleep often. :-)
#
# Happy hacking.
 
 
# Use this in a pipe. Like:
#
# ls -Fla --block-size="'1" --color=always --group-directories-first \
# -q "$@" | coloredls.pl
 
my $line;
my $cols = int(`tput cols`);
 
my $COL_BOLD = `tput bold`;
my $COL_RESET = `tput sgr0`;
my $COL_BLACK = `tput setaf 0`;
my $COL_RED = `tput setaf 1`;
my $COL_GREEN = `tput setaf 2`;
my $COL_BROWN = `tput setaf 3`;
my $COL_BLUE = `tput setaf 4`;
my $COL_MAGENTA = `tput setaf 5`;
my $COL_CYAN = `tput setaf 6`;
my $COL_WHITE = `tput setaf 7`;
 
my $COL_LINE;
if (int(`tput colors`) >= 256)
{
$COL_LINE = `tput setaf 235`
}
else
{
$COL_LINE = `tput setaf 0; tput bold`
}
 
my $total = <>;
chomp($total);
my $firstNonDir = -1;
 
while (<>)
{
my $type = substr($_, 0, 1);
my @toks;
if ($type eq "c" || $type eq "b")
{
$_ =~ m/^(.)(...)(...)(...)( +[^ ]+)( +[^ ]+)( +[^ ]+)( +[^,]+, +[^ ]+)( +[^ ]+ +[^ ]+ 
+[^ ]+)(.*)/;
@toks = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);
}
else
{
$_ =~ m/^(.)(...)(...)(...)( +[^ ]+)( +[^ ]+)( +[^ ]+)( +[^ ]+)( +[^ ]+ +[^ ]+ +[^ 
]+)(.*)/;
@toks = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);
}
 
if ($toks[0] ne "d" && $firstNonDir < 0)
{
$firstNonDir = $.;
print $COL_LINE . "─"x$cols . $COL_RESET . "\n";
}
 
if ($. == 4 && $. != $firstNonDir)
{
print $COL_LINE . "─"x$cols . $COL_RESET . "\n";
}
 
$toks[0] =~ s/[^-]/$COL_BLUE$&$COL_RESET/g;
$toks[1] =~ s/[^-]/$COL_BROWN$&$COL_RESET/g;
$toks[2] =~ s/[^-]/$COL_CYAN$&$COL_RESET/g;
$toks[3] =~ s/[^-]/$COL_GREEN$&$COL_RESET/g;
 
for (my $i = 0; $i <= 3; $i++)
{
$toks[$i] =~ s/-/$COL_LINE-$COL_RESET/g;
}
 
print
$toks[0] .
$toks[1] .
$toks[2] .
$toks[3] .
$COL_RED . $toks[4] .
$COL_BOLD . $COL_BROWN . $toks[5] . $COL_RESET .
$COL_BROWN . $toks[6] .
$COL_BOLD . $COL_GREEN . $toks[7] . $COL_RESET .
$COL_BLUE . $toks[8] . $COL_RESET .
$COL_LINE . " │" . $COL_RESET .
$toks[9] . $COL_RESET . "\n";
}
 
print $COL_LINE . "─"x$cols . $COL_RESET . "\n";
print $COL_BOLD . $COL_BLACK . $total . $COL_RESET . "\n";
