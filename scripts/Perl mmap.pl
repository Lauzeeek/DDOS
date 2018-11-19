#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;
use File::Map ':map';
use Data::Dumper;

my $file   = $ARGV[0];
my $offset = 4;
my $length = 5;

map_file my $map, $file, '<';

my $chr      = '1';
my $position = '70317';
my $ref      = 'G';

if ( $map =~ /(($chr)\s+($position)(.*)($ref)(.*)\n)/ ) {
    my $result = $1;
    splitter($result);
}
else {
    say "nothing";
}