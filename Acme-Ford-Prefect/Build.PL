use strict;
use warnings;

use Module::Build;
use Acme::Alien::DontPanic;

my $dontpanic = Acme::Alien::DontPanic->new;

my $cflags = $dontpanic->cflags;
my $libs   = $dontpanic->libs;

my $builder = Module::Build->new(
    module_name       => 'Acme::Ford::Prefect',
    dist_abstract     => 'Part of the test framework for Alien::Base',
    dist_author       => 'Joel Berger <joel.a.berger@gmail.com>',
    license           => 'perl',
    requires          => {
      'perl' => '5.008',
    },
    configure_requires => {
      'Module::Build' => 0.38,
      'Acme::Alien::DontPanic' => 0.005,
    },
    build_requires    => {
      'ExtUtils::CBuilder' => 0,
    },
    extra_compiler_flags => $cflags,
    extra_linker_flags   => $libs, 
);

$builder->create_build_script;

