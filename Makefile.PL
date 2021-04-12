#!/usr/bin/perl
use strict;
use warnings;
use ExtUtils::MakeMaker;

my $github = 'https://github.com/olof/Regexp-Common-Chess';

WriteMakefile (
	NAME => 'Regexp::Common::Chess',
	AUTHOR => 'Olof Johansson <olof@cpan.org>',
	LICENSE => 'perl',
	ABSTRACT_FROM => 'lib/Regexp/Common/Chess.pm',
	VERSION_FROM => 'lib/Regexp/Common/Chess.pm',
	SIGN => 1,

	PREREQ_PM => {
		'Regexp::Common' => 0,
	},

	META_MERGE => {
		resources => {
			bugtracker => "$github/issues",
			repository => $github,
		},
	},
);
