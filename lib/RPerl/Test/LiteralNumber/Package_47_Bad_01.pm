# [[[ PREPROCESSOR ]]]
# <<< PARSE_ERROR: 'ERROR ECVPAPC02' >>>
# <<< PARSE_ERROR: 'Perl::Critic::Policy::ValuesAndExpressions::ProhibitMagicNumbers' >>>

# [[[ HEADER ]]]
package RPerl::Test::LiteralNumber::Package_47_Bad_01;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_000;

our number $empty_sub = sub { return -2333_456_789.234_56; };

1;                  # end of package
