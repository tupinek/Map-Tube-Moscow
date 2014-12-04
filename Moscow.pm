package Map::Tube::Moscow;

# Pragmas.
use strict;
use warnings;
use 5.006;

# Modules.
use File::Share ':all';
use Moo;
use namespace::clean;

# Version.
our $VERSION = 0.01;

# Get XML.
has xml => (
	'is' => 'ro',
	'default' => sub {
		return dist_file('Map-Tube-Moscow', 'moscow-map.xml');
	},
);

with 'Map::Tube';

1;

__END__

=encoding utf8

=head1 NAME

Map::Tube::Moscow - Interface to the Moscow Tube Map.

=head1 SYNOPSIS

 use Map::Tube::Moscow;
 my $obj = Map::Tube::Moscow->new;
 my $routes_ar = $obj->get_all_routes($from, $to);
 my $station = $obj->get_node_by_id($station_id);
 my $station = $obj->get_node_by_name($station_name);
 my $route = $obj->get_shortest_route($from, $to);
 my $xml_file = $obj->xml;

=head1 DESCRIPTION

It currently provides functionality to find the shortest route between the two
given nodes.

For more information about Moscow Map, click L<here|https://ru.wikipedia.org/wiki/Московский_метрополитен>.

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<get_all_routes($from, $to)>

 Get all routes from station to station.
 Returns reference to array with Map::Tube::Route objects.

=item C<get_node_by_id($station_id)>

 Get station node by id.
 Returns Map::Tube::Node object.

=item C<get_node_by_name($station_name)>

 Get station node by name.
 Returns Map::Tube::Node object.

=item C<get_shortest_route($from, $to)>

 Get shortest route between $from and $to node name. Node name is case insensitive.
 Returns back the node sequence in string.

=item C<xml()>

 Get XML specification of Moscow metro.
 Returns string with XML.

=back

=head1 EXAMPLE1

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
 # Route: Планерная (7 Таганско-Краснопресненская линия), Сходненская (7 Таганско-Краснопресненская линия), Тушинская (7 Таганско-Краснопресненская линия), Спартак (7 Таганско-Краснопресненская линия), Щукинская (7 Таганско-Краснопресненская линия), Октябрьское поле (7 Таганско-Краснопресненская линия), Полежаевская (7 Таганско-Краснопресненская линия), Беговая (7 Таганско-Краснопресненская линия), Улица 1905 года (7 Таганско-Краснопресненская линия), Баррикадная (7 Таганско-Краснопресненская линия), Пушкинская (7 Таганско-Краснопресненская линия), Кузнецкий мост (7 Таганско-Краснопресненская линия), Китай-город (6 Калужско-Рижская линия,7 Таганско-Краснопресненская линия), Тургеневская (6 Калужско-Рижская линия), Сухаревская (6 Калужско-Рижская линия), Проспект Мира (5 Кольцевая линия,6 Калужско-Рижская линия), Новослободская (5 Кольцевая линия), Белорусская (2 Замоскворецкая линия,5 Кольцевая линия)

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Map::Tube::Moscow;

 # Object.
 my $obj = Map::Tube::Moscow->new;

 # Get XML file.
 my $xml_file = $obj->xml;

 # Print out XML file.
 print "XML file: $xml_file\n";

 # Output like:
 # XML file: .*/moscow-map.xml

=head1 DEPENDENCIES

L<File::Share>,
L<Map::Tube>,
L<Moo>,
L<namespace::clean>.

=head1 SEE ALSO

L<Map::Tube>,
L<Map::Tube::Barcelona>,
L<Map::Tube::Delhi>,
L<Map::Tube::London>,
L<Map::Tube::Prague>,
L<Map::Tube::Tokyo>.

=head1 REPOSITORY

L<https://github.com/Manwar/Map-Tube-Moscow>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © Michal Špaček 2014
 Artistic License
 BSD 2-Clause License

=head1 VERSION

0.01

=cut
