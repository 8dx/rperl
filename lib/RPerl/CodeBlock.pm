package RPerl::CodeBlock;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.000_012;

## no critic qw(Capitalization ProhibitMultiplePackages ProhibitReusedNames)  # SYSTEM DEFAULT 3: allow multiple & lower case package names

use parent qw(RPerl::GrammarRule);
our hashref $properties = {};

# [[[ SUB-TYPES ]]]

package RPerl::CodeReference;

# NEED ADDRESS: which inheritance???
use parent qw(RPerl::DataStructure RPerl::DataType::Modifier::Reference);

#use parent qw(RPerl::DataType::Modifier::Reference);

# code is runnable source code or some derivative thereof
# ref to code
package coderef;

#use parent qw(RPerl::DataStructure::CodeReference);
use base qw(RPerl::DataStructure::CodeReference);

# NEED UPGRADE: mst wants us to fake %INC instead of use base here

1;
