use ExtUtils::MakeMaker;
WriteMakefile(
  NAME      => q{Compass::Bearing},
  VERSION_FROM => q{lib/Compass/Bearing.pm},
  PREREQ_PM => {
                 strict            => 0,
                 vars              => 0,
                 Geo::Functions    => 0.03, 
                 GD::Graph::Polar  => 0.09, 
               },
               ($] >= 5.005 ? 
                 (
                   ABSTRACT_FROM => 'lib/Compass/Bearing.pm',
                 ) : ()
               ),
             );
