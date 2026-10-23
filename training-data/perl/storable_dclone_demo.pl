use strict;
use warnings;
use Storable qw(dclone freeze thaw);

my $original = {
    name  => 'config',
    ports => [80, 443],
    opts  => { debug => 0, tags => ['a', 'b'] },
};

my $shallow = { %$original };
my $deep    = dclone($original);

push @{ $original->{ports} }, 8080;
$original->{opts}{tags}[0] = 'changed';

print "original ports: @{ $original->{ports} }\n";
print "shallow ports:  @{ $shallow->{ports} }\n";
print "deep ports:     @{ $deep->{ports} }\n";
print "deep tag:       $deep->{opts}{tags}[0]\n";

my $frozen = freeze($deep);
my $thawed = thaw($frozen);
print "thawed name:    $thawed->{name}\n";
print "same ref? ", ($thawed == $deep ? "yes" : "no"), "\n";
