#!/usr/bin/perl

# [[[ PREPROCESSOR ]]]
# <<< PARSE_ERROR: 'ERROR ECVPAPL03' >>>
# <<< PARSE_ERROR: 'Useless use of push with no values' >>>

# [[[ HEADER ]]]
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_000;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# FEATURE BOUNTY #000, 1_000 CodeCoin: Implement all Perl functions AKA builtins (PERLOPS_PERLTYPES) as C++ functions (CPPOPS_PERLTYPES & CPPOPS_CPPTYPES)

# [[[ OPERATIONS ]]]
my integer_arrayref $frob = [];
push @{$frob};
print 'have $frob = ', "\n", Dumper($frob), "\n";
