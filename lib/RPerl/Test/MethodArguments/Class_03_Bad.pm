# [[[ PREPROCESSOR ]]]
# <<< PARSE_ERROR: 'ERROR ECVPAPL02' >>>
# <<< PARSE_ERROR: 'near ") @_"' >>>

# [[[ HEADER ]]]
package RPerl::Test::MethodArguments::Class_03_Bad;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_000;

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Test);
use RPerl::Test;

# [[[ OO PROPERTIES ]]]
our hashref $properties
    = { empty_property => my integer $TYPED_empty_property = 2 };

# [[[ OO METHODS & SUBROUTINES ]]]
our void_method $empty_method = sub {
    (   my object $self,
        my number $foo,
        my string $bar,
        my scalartype_arrayref $baz,
        my integer_hashref $bat
    ) @_;
    return 2;
};

1;    # end of class
