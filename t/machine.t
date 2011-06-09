use Test::More;
use FindBin;
use lib "$FindBin::Bin/lib";
use_ok('Magpie::Machine');

my $m = Magpie::Machine->new();

ok( $m );

$m->pipeline(qw( Magpie::Pipeline::Moe ));

$m->run( {} );

done_testing();