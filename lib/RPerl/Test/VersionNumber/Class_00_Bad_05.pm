# [[[ PREPROCESSOR ]]]
# <<< PARSE_ERROR: 'ERROR ECVPARP00' >>>

# [[[ HEADER ]]]
package RPerl::Test::VersionNumber::Class_00_Bad_05;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_1000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Test);
use RPerl::Test;

# [[[ OO PROPERTIES ]]]
our hashref $properties
    = { empty_property => my integer $TYPED_empty_property = 2 };

# [[[ OO METHODS & SUBROUTINES ]]]
our void_method $empty_method = sub { return 2; };

1;                  # end of class
