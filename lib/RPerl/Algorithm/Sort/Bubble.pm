# [[[ HEADER ]]]
package RPerl::Algorithm::Sort::Bubble;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.004_030;

# [[[ OO INHERITANCE ]]]
use parent qw( RPerl::Algorithm::Sort ); # OO INHERITANCE TESTING; SINGLE OO INHERITANCE

#use parent qw( RPerl::Algorithm::Sort RPerl::Algorithm::Inefficient ); # OO INHERITANCE TESTING; NEED UPGRADE: multiple inheritance not currently supported by Inline::CPP
use RPerl::Algorithm::Sort;

#use RPerl::Algorithm::Inefficient;    # OO INHERITANCE TESTING; NEED UPGRADE: multiple inheritance not currently supported by Inline::CPP

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls) # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ INCLUDES ]]]
use Data::Dumper;

# [[[ OO OBJECT PROPERTIES ]]]
our hashref $properties = {
    integer_data => my integer_arrayref $TYPED_integer_data = undef,
    number_data  => my number_arrayref $TYPED_number_data   = undef
};

# [[[ OO METHODS & SUBROUTINES ]]]

# call out to sort integer data, return nothing
our void_method $integer_sort = sub {
    ( my object $self) = @_;

# DEV NOTE: this is an in-place sorting algorithm, we don't actually need to set $self->{integer_data} as it has not changed location
    $self->{integer_data} = integer_bubblesort( $self->{integer_data} );
};

# call out to sort number data, return nothing
our void_method $number_sort = sub {
    ( my object $self) = @_;

    $self->{number_data} = number_bubblesort( $self->{number_data} );
};

# OO INHERITANCE TESTING

our void_method $inherited__Bubble = sub {
    ( my object $self, my string $person) = @_;

#    RPerl::diag( 'in PERLOPS_PERLTYPES Bubble->inherited__Bubble(), received $self = ' . $self . ' and $person = ' . $person . ', FRIED' . "\n");
};

our void_method $inherited = sub {
    ( my object $self, my string $person) = @_;

#    RPerl::diag( 'in PERLOPS_PERLTYPES Bubble->inherited(), received $self = ' . $self . ' and $person = ' . $person . ', ILLOGICAL' . "\n");
};

# [[[ SUBROUTINES ]]]

# original algorithm: comparison-based and stable [O(n**2) average time, O(1) worst-case extra space]
# sort integer data, return sorted data
our integer_arrayref $integer_bubblesort = sub {
    ( my integer_arrayref $integer_data) = @_;

    #    ::integer_arrayref_CHECK($integer_data);
    ::integer_arrayref_CHECKTRACE( $integer_data, '$integer_data',
        'integer_bubblesort()' );
    my integer $is_sorted                  = 0;
    my integer $integer_data_length = scalar @{$integer_data};  # CONSTANT
    my integer $integer_data_i;
    my integer $integer_data_i_plus_1;
    my integer $swap;

#    RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort(), top of subroutine...\n";
#    RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort(), received \$integer_data\n" . Dumper($integer_data) . "\n";
#    RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort(), have \$integer_data_length = $integer_data_length\n";

# iterate through the length-n list up to n times (n * n == n**2), larger elements "bubble to the top" (end) of the list
    while ( not($is_sorted) ) {

#        RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort(), top of WHILE loop\n";
        $is_sorted = 1;
        for my integer $i ( 0 .. ( $integer_data_length - 2 ) ) {
            $integer_data_i = $integer_data->[$i];
            $integer_data_i_plus_1 = $integer_data->[ ( $i + 1 ) ];

#            RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort(), inside for() loop \$i = $i, have \$integer_data_i = $integer_data_i\n";
#            RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort(), inside for() loop \$i = $i, have \$integer_data_i_plus_1 = $integer_data_i_plus_1\n";

 # compare elements and swap if out-of-order, this is the core sort comparison
            if ( $integer_data_i > $integer_data_i_plus_1 ) {

   #            if ( $integer_data->[$i] > $integer_data->[ ( $i + 1 ) ] ) {

#                RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort(), inside for() loop, SWAPPING\n";
                $is_sorted = 0;
                $swap      = $integer_data_i;

                #                $swap      = $integer_data->[$i];
                $integer_data->[$i] = $integer_data_i_plus_1;

       #                $integer_data->[$i] = $integer_data->[ ( $i + 1 ) ];
                $integer_data->[ ( $i + 1 ) ] = $swap;
            }
        }
    }

# data is now sorted via top-level nested iteration [O(n**2) total time, O(1) total extra space]
# DEV NOTE: this is an in-place sorting algorithm, we don't actually need to return $integer_data as it has not changed location, EXCEPT FOR IN C++ BECAUSE OF PACKING/UNPACKING!!!
    return $integer_data;
};

# sort number data, return sorted data
our number_arrayref $number_bubblesort = sub {
    ( my number_arrayref $number_data) = @_;

    #    ::number_arrayref_CHECK($number_data);
    ::number_arrayref_CHECKTRACE( $number_data, '$number_data',
        'number_bubblesort()' );
    my integer $is_sorted                 = 0;
    my integer $number_data_length = scalar @{$number_data};  # CONSTANT
    my integer $number_data_i;
    my integer $number_data_i_plus_1;
    my integer $swap;

#    RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort(), top of subroutine...\n";
#    RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort(), received \$number_data\n" . Dumper($number_data) . "\n";
#    RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort(), have \$number_data_length = $number_data_length\n";

# iterate through the length-n list up to n times (n * n == n**2), larger elements "bubble to the top" (end) of the list
    while ( not($is_sorted) ) {

#        RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort(), top of WHILE loop\n";
        $is_sorted = 1;
        for my integer $i ( 0 .. ( $number_data_length - 2 ) ) {
            $number_data_i = $number_data->[$i];
            $number_data_i_plus_1 = $number_data->[ ( $i + 1 ) ];

#            RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort(), inside for() loop \$i = $i, have \$number_data_i = $number_data_i\n";
#            RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort(), inside for() loop \$i = $i, have \$number_data_i_plus_1 = $number_data_i_plus_1\n";
# compare elements and swap if out-of-order, this is the core sort comparison
            if ( $number_data_i > $number_data_i_plus_1 ) {

#                RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort(), inside for() loop, SWAPPING\n";
                $is_sorted          = 0;
                $swap               = $number_data_i;
                $number_data->[$i] = $number_data_i_plus_1;
                $number_data->[ ( $i + 1 ) ] = $swap;
            }
        }
    }
    return $number_data;
};

# OO INHERITANCE TESTING, CONTINUED

our string $uninherited__Bubble = sub {
    ( my string $person) = @_;

#    RPerl::diag( 'in PERLOPS_PERLTYPES Bubble::uninherited__Bubble(), received $person = ' . $person . ', MITOCHONDRIAL' . "\n");
    return ('Bubble::uninherited__Bubble() RULES! PERLOPS_PERLTYPES');
};

# DEV NOTE, CORRELATION #04: inheritance testing, manually enable uninherited() in exactly one of Algorithm.*, Inefficient.*, Sort.*, or Bubble.*
our string $uninherited = sub {
    ( my string $person) = @_;

#    RPerl::diag( 'in PERLOPS_PERLTYPES Bubble::uninherited(), received $person = ' . $person . ', TETRAHEDRON' . "\n");
    return ('Bubble::uninherited() ROCKS! PERLOPS_PERLTYPES');
};

# TYPE TESTING

our string $integer_bubblesort__typetest0 = sub {
    ( my integer_arrayref $lucky_integers) = @_;

    #    ::integer_arrayref_CHECK($lucky_integers);
    ::integer_arrayref_CHECKTRACE( $lucky_integers, '$lucky_integers',
        'integer_bubblesort__typetest0()' );

#    my integer $how_lucky = scalar @{$lucky_integers};
#    for my integer $i ( 0 .. ( $how_lucky - 1 ) ) {
#        my $lucky_integer = $lucky_integers->[$i];
#        RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort__typetest0(), have lucky_integer $i/" . ( $how_lucky - 1 ) . ' = ' . $lucky_integers->[$i] . ", BATBAR\n";
#    }
#    RPerl::diag "in PERLOPS_PERLTYPES integer_bubblesort__typetest0(), bottom of subroutine\n";

    return (
        ::integer_arrayref_to_string(
            integer_bubblesort($lucky_integers)
            )
            . 'PERLOPS_PERLTYPES'
    );
};

our string $number_bubblesort__typetest0 = sub {
    ( my number_arrayref $lucky_numbers) = @_;

    #    ::number_arrayref_CHECK($lucky_numbers);
    ::number_arrayref_CHECKTRACE( $lucky_numbers, '$lucky_numbers',
        'number_bubblesort__typetest0()' );

#    my integer $how_lucky = scalar @{$lucky_numbers};
#    for my integer $i ( 0 .. ( $how_lucky - 1 ) ) {
#        my $lucky_number = $lucky_numbers->[$i];
#        RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort__typetest0(), have lucky_number $i/" . ( $how_lucky - 1 ) . ' = ' . $lucky_numbers->[$i] . ", BATBAR\n";
#    }
#    RPerl::diag "in PERLOPS_PERLTYPES number_bubblesort__typetest0(), bottom of subroutine\n";

    return (
        ::number_arrayref_to_string( number_bubblesort($lucky_numbers) )
            . 'PERLOPS_PERLTYPES' );
};

1;    # end of class
