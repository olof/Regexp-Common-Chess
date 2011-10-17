#!/usr/bin/perl
use warnings;
use strict;
use Test::More;
use Regexp::Common qw/Chess/;

my $re = $RE{Chess}{SAN};

# TODO: Captures

# N.b. Test::More escapes hashes (#) as they are otherwise
#      part of the TAP syntax (directive delimiter).

my %good = (
	'Ka1' => "regular move",
	'Kxa1' => "King capture",
	'Qh8+' => "regular move check",
	'Qh8#' => "regular move checkmate",
	'Qxh8+' => "capture and check",
	'Qxh8#' => "capture and checkmate",
	'a3' => "regular pawn move",
	'a3+' => "pawn move check check",
	'a3#' => "pawn move check mate",
	'a8=Q' => "pawn promotion",
	'a8=Q+' => "pawn promotion check",
	'a8=Q#' => "pawn promotion checkmate",
	'xa8=Q' => "pawn promotion with capture",
	'xa8=Q+' => "pawn promotion with capture and check",
	'xa8=Q#' => "pawn promotion with capture and checkmate",
	'O-O' => "castling king side",
	'O-O+' => "castling check",
	'O-O#' => "castling check mate",
	'O-O-O' => "castling queen side",
	'O-O-O+' => "castling queen side, check",
	'O-O-O#' => "castling queen side, checkmate",
	'Bb2a3' => "start and destination",
	'Bb2a3+' => "start and destination, check",
	'Bb2a3#' => "start and destination, checkmate",
	'Bb2xa3' => "start and destination, capture",
	'Bb2xa3+' => "start and destination, capture, check",
	'Bb2xa3#' => "start and destination, capture, checkmate",
	'Bba3' => "start file and destination",
	'Bba3+' => "start file and destination, check",
	'Bba3#' => "start file and destination, checkmate",
	'Bbxa3' => "start file and destination, capture",
	'Bbxa3+' => "start file and destination, capture, check",
	'Bbxa3#' => "start file and destination, capture, checkmate",
	'B2a3' => "start file and destination",
	'B2a3+' => "start file and destination, check",
	'B2a3#' => "start file and destination, checkmate",
	'B2xa3' => "start file and destination, capture",
	'B2xa3+' => "start file and destination, capture, check",
	'B2xa3#' => "start file and destination, capture, checkmate",
);

my %bad = (
	'' => 'empty string',
	'i1' => 'invalid file (pawn)',
	'h9' => 'invalid rank (pawn)',
	'i0' => 'invalid file and rank (pawn)',
	'a8=K' => "pawn promotion to king",
	'xa8=K' => "pawn promotion with capture to king",
	'Qxxa3' => 'multiple capture characters',
	'Qxa3##' => 'multiple checkmate characters',
	'Qxa3++' => 'multiple check characters',
	'b1b2a3' => "three coordinates",
	'O-o' => "mixing capital and lower letters (castling)",
	'B2a' => "coordinates with wrong order",
);

plan tests => keys(%good) + keys(%bad) + 1;

my $undef;
ok(  /^$re$/, "Should match '$_' ($good{$_})")    for(keys %good);
ok(! /^$re$/, "Should not match '$_' ($bad{$_})") for(keys %bad );

{
	no warnings qw/uninitialized/;
	ok($undef !~ /^$re$/, "Should not match undef");
}

