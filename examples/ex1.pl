#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Encode qw(decode_utf8 encode_utf8);
use Map::Tube::Moscow;

# Object.
my $obj = Map::Tube::Moscow->new;

# Get route.
my $route = $obj->get_shortest_route(decode_utf8('Планерная'), decode_utf8('Белорусская'));

# Print out type.
print "Route: ".encode_utf8($route)."\n";

# Output:
# TODO