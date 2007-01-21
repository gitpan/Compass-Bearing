#!/usr/bin/perl -w
# -*- perl -*-

#
# $Id: base.t,v 0.1 2006/02/21 eserte Exp $
# Author: Michael R. Davis
#

=head1 NAME

base.t - Good examples concerning how to use this module

=cut

use strict;
use blib;
use constant NEAR_DEFAULT => 7;

sub near {
  my $x=shift();
  my $y=shift();
  my $p=shift()||NEAR_DEFAULT;
  if (($x-$y)/$y < 10**-$p) {
    return 1;
  } else {
    return 0;
  }
}


BEGIN {
    if (!eval q{
	use Test;
	1;
    }) {
	print "1..0 # tests only works with installed Test module\n";
	exit;
    }
}

BEGIN { plan tests => 216 }

# just check that all modules can be compiled
ok(eval {require Compass::Bearing; 1}, 1, $@);

use Compass::Bearing;
my $obj = Compass::Bearing->new();
ok(ref $obj, "Compass::Bearing");

ok($obj->set, 3); #default
ok($obj->set(1), 1);
my $a=-90;
my $b=45;
ok($a, -90);
ok($obj->bearing($a), "W");
ok($obj->bearing($a+$b-0.1), "W");
ok($obj->bearing($a+$b), "N");
ok($obj->bearing($a+$b+0.1), "N");
$a+=90;
ok($a, 0);
ok($obj->bearing($a), "N");
ok($obj->bearing_rad(0), "N");
ok($obj->bearing($a+$b-0.1), "N");
ok($obj->bearing($a+$b), "E");
ok($obj->bearing($a+$b+0.1), "E");
$a+=90;
ok($a, 90);
ok($obj->bearing($a), "E");
ok($obj->bearing_rad(2*atan2(1,1)), "E");
ok($obj->bearing($a+$b-0.1), "E");
ok($obj->bearing($a+$b), "S");
ok($obj->bearing($a+$b+0.1), "S");
$a+=90;
ok($a, 180);
ok($obj->bearing($a), "S");
ok($obj->bearing_rad(4*atan2(1,1)), "S");
ok($obj->bearing($a+$b-0.1), "S");
ok($obj->bearing($a+$b), "W");
ok($obj->bearing($a+$b+0.1), "W");
$a+=90;
ok($a, 270);
ok($obj->bearing($a), "W");
ok($obj->bearing_rad(6*atan2(1,1)), "W");
ok($obj->bearing($a+$b-0.1), "W");
ok($obj->bearing($a+$b), "N");
ok($obj->bearing($a+$b+0.1), "N");
$a+=90;
ok($a, 360);
ok($obj->bearing($a), "N");
ok($obj->bearing_rad(8*atan2(1,1)), "N");
ok($obj->bearing($a+$b-0.1), "N");
ok($obj->bearing($a+$b), "E");
ok($obj->bearing($a+$b+0.1), "E");

ok($obj->set(2), 2);
$a=-90;
$b=45/2;
ok($a, -90);
ok($obj->bearing($a), "W");
ok($obj->bearing($a+$b-0.1), "W");
ok($obj->bearing($a+$b), "NW");
ok($obj->bearing($a+$b+0.1), "NW");
$a+=45;
ok($a, -45);
ok($obj->bearing($a), "NW");
ok($obj->bearing($a+$b-0.1), "NW");
ok($obj->bearing($a+$b), "N");
ok($obj->bearing($a+$b+0.1), "N");
$a+=45;
ok($a, 0);
ok($obj->bearing($a), "N");
ok($obj->bearing_rad(0), "N");
ok($obj->bearing($a+$b-0.1), "N");
ok($obj->bearing($a+$b), "NE");
ok($obj->bearing($a+$b+0.1), "NE");
$a+=45;
ok($a, 45);
ok($obj->bearing($a), "NE");
ok($obj->bearing($a+$b-0.1), "NE");
ok($obj->bearing($a+$b), "E");
ok($obj->bearing($a+$b+0.1), "E");
$a+=45;
ok($a, 90);
ok($obj->bearing($a), "E");
ok($obj->bearing_rad(2*atan2(1,1)), "E");
ok($obj->bearing($a+$b-0.1), "E");
ok($obj->bearing($a+$b), "SE");
ok($obj->bearing($a+$b+0.1), "SE");
$a+=45;
ok($a, 135);
ok($obj->bearing($a), "SE");
ok($obj->bearing($a+$b-0.1), "SE");
ok($obj->bearing($a+$b), "S");
ok($obj->bearing($a+$b+0.1), "S");
$a+=45;
ok($a, 180);
ok($obj->bearing($a), "S");
ok($obj->bearing_rad(4*atan2(1,1)), "S");
ok($obj->bearing($a+$b-0.1), "S");
ok($obj->bearing($a+$b), "SW");
ok($obj->bearing($a+$b+0.1), "SW");
$a+=45;
ok($a, 225);
ok($obj->bearing($a), "SW");
ok($obj->bearing($a+$b-0.1), "SW");
ok($obj->bearing($a+$b), "W");
ok($obj->bearing($a+$b+0.1), "W");
$a+=45;
ok($a, 270);
ok($obj->bearing($a), "W");
ok($obj->bearing_rad(6*atan2(1,1)), "W");
ok($obj->bearing($a+$b-0.1), "W");
ok($obj->bearing($a+$b), "NW");
ok($obj->bearing($a+$b+0.1), "NW");
$a+=45;
ok($a, 315);
ok($obj->bearing($a), "NW");
ok($obj->bearing($a+$b-0.1), "NW");
ok($obj->bearing($a+$b), "N");
ok($obj->bearing($a+$b+0.1), "N");
$a+=45;
ok($a, 360);
ok($obj->bearing($a), "N");
ok($obj->bearing_rad(8*atan2(1,1)), "N");
ok($obj->bearing($a+$b-0.1), "N");
ok($obj->bearing($a+$b), "NE");
ok($obj->bearing($a+$b+0.1), "NE");

ok($obj->set(3), 3);
$a=-90;
$b=45/4;
ok($a, -90);
ok($obj->bearing($a), "W");
ok($obj->bearing($a+$b-0.1), "W");
ok($obj->bearing($a+$b), "WNW");
ok($obj->bearing($a+$b+0.1), "WNW");
$a+=$b*2;
ok($a, -67.5);
ok($obj->bearing($a), "WNW");
ok($obj->bearing($a+$b-0.1), "WNW");
ok($obj->bearing($a+$b), "NW");
ok($obj->bearing($a+$b+0.1), "NW");
$a+=$b*2;
ok($a, -45);
ok($obj->bearing($a), "NW");
ok($obj->bearing($a+$b-0.1), "NW");
ok($obj->bearing($a+$b), "NNW");
ok($obj->bearing($a+$b+0.1), "NNW");
$a+=$b*2;
ok($a, -22.5);
ok($obj->bearing($a), "NNW");
ok($obj->bearing($a+$b-0.1), "NNW");
ok($obj->bearing($a+$b), "N");
ok($obj->bearing($a+$b+0.1), "N");
$a+=$b*2;
ok($a, 0);
ok($obj->bearing($a), "N");
ok($obj->bearing_rad(0), "N");
ok($obj->bearing($a+$b-0.1), "N");
ok($obj->bearing($a+$b), "NNE");
ok($obj->bearing($a+$b+0.1), "NNE");
$a+=$b*2;
ok($a, 22.5);
ok($obj->bearing($a), "NNE");
ok($obj->bearing($a+$b-0.1), "NNE");
ok($obj->bearing($a+$b), "NE");
ok($obj->bearing($a+$b+0.1), "NE");
$a+=$b*2;
ok($a, 45);
ok($obj->bearing($a), "NE");
ok($obj->bearing($a+$b-0.1), "NE");
ok($obj->bearing($a+$b), "ENE");
ok($obj->bearing($a+$b+0.1), "ENE");
$a+=$b*2;
ok($a, 67.5);
ok($obj->bearing($a), "ENE");
ok($obj->bearing($a+$b-0.1), "ENE");
ok($obj->bearing($a+$b), "E");
ok($obj->bearing($a+$b+0.1), "E");
$a+=$b*2;
ok($a, 90);
ok($obj->bearing($a), "E");
ok($obj->bearing_rad(2*atan2(1,1)), "E");
ok($obj->bearing($a+$b-0.1), "E");
ok($obj->bearing($a+$b), "ESE");
ok($obj->bearing($a+$b+0.1), "ESE");
$a+=$b*2;
ok($a, 112.5);
ok($obj->bearing($a), "ESE");
ok($obj->bearing($a+$b-0.1), "ESE");
ok($obj->bearing($a+$b), "SE");
ok($obj->bearing($a+$b+0.1), "SE");
$a+=$b*2;
ok($a, 135);
ok($obj->bearing($a), "SE");
ok($obj->bearing($a+$b-0.1), "SE");
ok($obj->bearing($a+$b), "SSE");
ok($obj->bearing($a+$b+0.1), "SSE");
$a+=$b*2;
ok($a, 157.5);
ok($obj->bearing($a), "SSE");
ok($obj->bearing($a+$b-0.1), "SSE");
ok($obj->bearing($a+$b), "S");
ok($obj->bearing($a+$b+0.1), "S");
$a+=$b*2;
ok($a, 180);
ok($obj->bearing($a), "S");
ok($obj->bearing_rad(4*atan2(1,1)), "S");
ok($obj->bearing($a+$b-0.1), "S");
ok($obj->bearing($a+$b), "SSW");
ok($obj->bearing($a+$b+0.1), "SSW");
$a+=$b*2;
ok($a, 202.5);
ok($obj->bearing($a), "SSW");
ok($obj->bearing($a+$b-0.1), "SSW");
ok($obj->bearing($a+$b), "SW");
ok($obj->bearing($a+$b+0.1), "SW");
$a+=$b*2;
ok($a, 225);
ok($obj->bearing($a), "SW");
ok($obj->bearing($a+$b-0.1), "SW");
ok($obj->bearing($a+$b), "WSW");
ok($obj->bearing($a+$b+0.1), "WSW");
$a+=$b*2;
ok($a, 247.5);
ok($obj->bearing($a), "WSW");
ok($obj->bearing($a+$b-0.1), "WSW");
ok($obj->bearing($a+$b), "W");
ok($obj->bearing($a+$b+0.1), "W");
$a+=$b*2;
ok($a, 270);
ok($obj->bearing($a), "W");
ok($obj->bearing_rad(6*atan2(1,1)), "W");
ok($obj->bearing($a+$b-0.1), "W");
ok($obj->bearing($a+$b), "WNW");
ok($obj->bearing($a+$b+0.1), "WNW");
$a+=$b*2;
ok($a, 292.5);
ok($obj->bearing($a), "WNW");
ok($obj->bearing($a+$b-0.1), "WNW");
ok($obj->bearing($a+$b), "NW");
ok($obj->bearing($a+$b+0.1), "NW");
$a+=$b*2;
ok($a, 315);
ok($obj->bearing($a), "NW");
ok($obj->bearing($a+$b-0.1), "NW");
ok($obj->bearing($a+$b), "NNW");
ok($obj->bearing($a+$b+0.1), "NNW");
$a+=$b*2;
ok($a, 337.5);
ok($obj->bearing($a), "NNW");
ok($obj->bearing($a+$b-0.1), "NNW");
ok($obj->bearing($a+$b), "N");
ok($obj->bearing($a+$b+0.1), "N");
$a+=$b*2;
ok($a, 360);
ok($obj->bearing($a), "N");
ok($obj->bearing_rad(8*atan2(1,1)), "N");
ok($obj->bearing($a+$b-0.1), "N");
ok($obj->bearing($a+$b), "NNE");
ok($obj->bearing($a+$b+0.1), "NNE");
$a+=$b*2;
ok($a, 382.5);
ok($obj->bearing($a), "NNE");
ok($obj->bearing($a+$b-0.1), "NNE");
ok($obj->bearing($a+$b), "NE");
ok($obj->bearing($a+$b+0.1), "NE");
