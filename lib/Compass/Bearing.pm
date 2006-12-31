package Compass::Bearing;

=head1 NAME

Compass::Bearing - Convert angle to text bearing (aka Heading)

=head1 SYNOPSIS

  use Compass::Bearing;
  my $obj = Compass::Bearing->new(16);
  print "Bearing=", $obj->bearing(45), "\n";

=head1 DESCRIPTION

=cut

use strict;
use vars qw($VERSION);
use Geo::Functions qw{deg_rad round};

$VERSION = sprintf("%d.%02d", q{Revision: 0.01} =~ /(\d+)\.(\d+)/);

=head1 CONSTRUCTOR

=head2 new

The new() constructor may be called with any parameter that is appropriate to the set method.

  my $obj = Compass::Bearing->new();

=cut

sub new {
  my $this = shift();
  my $class = ref($this) || $this;
  my $self = {};
  bless $self, $class;
  $self->initialize(@_);
  return $self;
}

=head1 METHODS

=cut

sub initialize {
  my $self = shift();
  my $param = shift()||3;
  $self->set($param);
}

=head2 bearing

Method returns a text string based on bearing

  my $bearing=$obj->bearing($degrees_from_north);

=cut

sub bearing {
  my $self=shift();
  my $angle=shift()||0; #degrees
  $angle+=360 while ($angle < 0);
  my @data=$self->data;
  return $data[round($angle/360 * @data) % @data];
}

=head2 bearing_rad

Method returns a text string based on bearing

  my $bearing=$obj->bearing_rad($radians_from_north);

=cut

sub bearing_rad {
  my $self=shift();
  my $angle=deg_rad(shift()||0); #degrees
  return $self->bearing($angle);
}

=head2 set

Method sets of returns key for the bearing data structure.

  my $key=$self->set;
  my $key=$self->set(1);
  my $key=$self->set(2); #default value
  my $key=$self->set(3);

=cut

sub set {
  my $self=shift();
  my $param=shift();
  if (defined $param) {
    my %data=$self->dataraw;
    my @keys=sort keys %data;
    if (exists $data{$param}) {
      $self->{'set'}=$param;
    } else {
      die(qq{Error: "$param" is not a valid parameter to the set method.  Try }. join(", ", map {qq{"$_"}} @keys). ".\n")
    }
  }
  return $self->{'set'};
}

=head2 data

Method returns an array of text values.

  my $data=$self->data;

=cut

sub data {
  my $self=shift();
  my $data=$self->dataraw;
  my $return=$data->{$self->set};
  return wantarray ? @{$return} : $return;
}

sub dataraw {
  my %data=(1=>[qw{N E S W}],
            2=>[qw{N NE E SE S SW W NW}],
            3=>[qw{N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW}]);
  return wantarray ? %data : \%data;
}

1;

__END__

=head1 TODO

=head1 BUGS

Please send to the geo-perl email list.

=head1 LIMITS

=head1 AUTHOR

Michael R. Davis qw/perl michaelrdavis com/

=head1 LICENSE

Copyright (c) 2006 Michael R. Davis (mrdvt92)

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO
