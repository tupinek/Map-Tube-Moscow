# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::Moscow;
use Test::More 'skip_all' => 'No valid?';
use Test::Map::Tube;
use Test::NoWarnings;

# Test.
ok_map(Map::Tube::Moscow->new);
