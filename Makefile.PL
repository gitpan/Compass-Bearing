use ExtUtils::MakeMaker;
WriteMakefile(
  NAME      => q{Compass::Bearing},
  VERSION_FROM => q{lib/Compass/Bearing.pm},
  PREREQ_PM => {
                 strict            => 0,
                 vars              => 0,
                 Geo::Functions    => 0.03, 
               },
               ($] >= 5.005 ? 
                 (
                   ABSTRACT_FROM => 'lib/Compass/Bearing.pm',
                 ) : ()
               ),
             );
