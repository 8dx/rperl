# [[[ HEADER ]]]
package RPerl::Operation::Statement::OperatorVoid::Named::Return;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.002_000;

# [[[ OO INHERITANCE ]]]
# NEED FIX: is not a Grammar Rule so should not inherit from OperatorVoid, need create Grammar Production class
use parent qw(RPerl::Operation::Statement::OperatorVoid::Named);
use RPerl::Operation::Statement::OperatorVoid::Named;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils
## no critic qw(ProhibitConstantPragma ProhibitMagicNumbers)  # USER DEFAULT 3: allow constants

# [[[ CONSTANTS ]]]
use constant NAME => my string $TYPED_NAME = 'return';

# DEV NOTE: ARGUMENTS_MIN of 0 can be ignored, no such thing as negative number of args!
use constant ARGUMENTS_MIN => my integer $TYPED_ARGUMENTS_MIN = 0; # call 'return;' for all subroutines which return void
use constant ARGUMENTS_MAX => my integer $TYPED_ARGUMENTS_MAX = 1; # call 'return @{[ELEM0, ELEM1, ...]};' for all subroutines which return an array; disallow return(ELEM0, ELEM1, ...) multiple return values

# [[[ OO PROPERTIES ]]]
our hashref $properties = {};

# [[[ OO METHODS & SUBROUTINES ]]]

our string_hashref_method $ast_to_rperl__generate = sub {
    (   my object $self,
        my string_hashref $modes,
        my object $operator_void_named)
        = @_;
    my string_hashref $rperl_source_group = { PMC => q{} };

#    RPerl::diag( 'in OperatorVoid::Named::Return->ast_to_rperl__generate(), received $self = ' . "\n" . RPerl::Parser::rperl_ast__dump($self) . "\n" );
    RPerl::diag(
        'in OperatorVoid::Named::Return->ast_to_rperl__generate(), received $operator_void_named = '
            . "\n"
            . RPerl::Parser::rperl_ast__dump($operator_void_named)
            . "\n" );

    if ( ref $operator_void_named eq 'OperatorVoid_114' ) { # OperatorVoid -> OP01_NAMED_VOID_SCOLON
        $rperl_source_group->{PMC} .= $operator_void_named->{children}->[0]; # name semicolon
    }
    elsif ( ref $operator_void_named eq 'OperatorVoid_115' ) {
        # DEV NOTE: if $optional_arguments is empty, will generate 'return();' which perltidy will change to 'return ();', both return undef not empty array so it's okay
        $rperl_source_group->{PMC}
            .= $operator_void_named->{children}->[0];    # name lparen
        my object $optional_arguments = $operator_void_named->{children}->[1];
        if ( exists $optional_arguments->{children}->[0] ) {
            my object $arguments = $optional_arguments->{children}->[0];
            my integer $argument_count = $arguments->length();
            if ( $argument_count > ARGUMENTS_MAX() ) {
                die
                    'ERROR ECVGEASRP02, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL:'
                    . "\n"
                    . 'Argument count '
                    . $argument_count
                    . ' exceeds maximum argument limit '
                    . ARGUMENTS_MAX()
                    . ' for operation ' . q{'}
                    . NAME() . q{'}
                    . ', dying' . "\n";
            }
            my string_hashref $rperl_source_subgroup
                = $arguments->ast_to_rperl__generate( $modes, $self );
            RPerl::Generator::source_group_append( $rperl_source_group,
                $rperl_source_subgroup );
        }
        $rperl_source_group->{PMC} .= $operator_void_named->{children}->[2]
            . $operator_void_named->{children}->[3];    # rparen semicolon
    }
    elsif ( ref $operator_void_named eq 'OperatorVoid_116' ) { # OperatorVoid -> OP01_NAMED_VOID ListElements ';'
        $rperl_source_group->{PMC}
            .= $operator_void_named->{children}->[0] . q{ };    # name
        my object $arguments       = $operator_void_named->{children}->[1];
        my integer $argument_count = $arguments->length();
        if ( $argument_count > ARGUMENTS_MAX() ) {
            die
                'ERROR ECVGEASRP02, CODE GENERATOR, ABSTRACT SYNTAX TO RPERL:'
                . "\n"
                . 'Argument count '
                . $argument_count
                . ' exceeds maximum argument limit '
                . ARGUMENTS_MAX()
                . ' for operation ' . q{'}
                . NAME() . q{'}
                . ', dying' . "\n";
        }
        my string_hashref $rperl_source_subgroup
            = $arguments->ast_to_rperl__generate( $modes, $self );
        RPerl::Generator::source_group_append( $rperl_source_group,
            $rperl_source_subgroup );
        $rperl_source_group->{PMC} .= $operator_void_named->{children}->[2]; # semicolon
    }
    else {
        die 'FOOOOOO' . "\n";
    }

    $rperl_source_group->{PMC} .= "\n";
    return $rperl_source_group;
};

our string_hashref_method $ast_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group
        = { CPP =>
            q{// <<< RP::O::S::OV::N::R DUMMY SOURCE CODE CPPOPS_PERLTYPES >>>}
            . "\n" };

    #...
    return $cpp_source_group;
};

our string_hashref_method $ast_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self, my string_hashref $modes) = @_;
    my string_hashref $cpp_source_group
        = { CPP =>
            q{// <<< RP::O::S::OV::N::R DUMMY SOURCE CODE CPPOPS_CPPTYPES >>>}
            . "\n" };

    #...
    return $cpp_source_group;
};

1;    # end of class
