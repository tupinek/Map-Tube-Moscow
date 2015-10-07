# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::Moscow;
use Test::Map::Tube 'tests' => 1;

# Test.
ok_map(Map::Tube::Moscow->new, 'Test validity of map.');
