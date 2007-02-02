#!/usr/bin/perl -w

=head1 NAME

example-plot.pl - Example for Compass::Bearing with GD::Graph::Polar

=cut

use strict;
use lib qw{./lib ../lib};
use Compass::Bearing;
use GD::Graph::Polar;

foreach my $digit (1..3) {
  my $cb=Compass::Bearing->new($digit);
  my $count=scalar(@{$cb->data});
  my $gdgp=GD::Graph::Polar->new(size=>450, radius=>10, ticks=>1);

  foreach (1..$count) {
    my $angle=$_ * 360 / $count;
    $gdgp->addGeoLine(0=>$angle, 8=>$angle);
    $gdgp->addGeoPoint(8=>$angle);
    $gdgp->addGeoString(9=>$angle, $cb->bearing($angle));
  }

  open(IMG, ">example-plot-$digit-digit.png");
  print IMG $gdgp->draw;
  close(IMG);
}

__END__

=head1 Sample Output

http://search.cpan.org/src/MRDVT/Compass-Bearing-0.05/bin/example-plot-1-digit.png
http://search.cpan.org/src/MRDVT/Compass-Bearing-0.05/bin/example-plot-2-digit.png
http://search.cpan.org/src/MRDVT/Compass-Bearing-0.05/bin/example-plot-3-digit.png

=cut
