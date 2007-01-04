#!/usr/bin/perl -w

=head1 NAME

example.pl - Example for Compass::Bearing

=cut

use strict;
use lib qw{./lib ../lib};
use Compass::Bearing;

my $obj=Compass::Bearing->new();

foreach my $type (1,2,3) {
  print "Bearing Type: ", $obj->set($type), " digit.\n\n";
  foreach (-5..40) {
    my $a=$_*10;
    print "Angle: $a => ", $obj->bearing($a), "\n";
  }
  print "\n";
}
