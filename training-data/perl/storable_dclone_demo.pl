use strict;
use warnings;
use Storable qw(dclone freeze thaw);

my %original = (
    name  => 'config',
    tags  => [qw(a b c)],
    nested => { depth => 1, list => [1, 2, 3] },
);

# a plain copy is shallow: references are shared
my %shallow = %original;
push @{ $shallow{tags} }, 'shared';

# dclone makes an independent deep copy
my $deep = dclone(\%original);
push @{ $deep->{tags} }, 'private';
$deep->{nested}{depth} = 99;

print "original tags: @{ $original{tags} }\n";
print "shallow tags:  @{ $shallow{tags} }\n";
print "deep tags:     @{ $deep->{tags} }\n";
print "original depth: $original{nested}{depth}\n";
print "deep depth:     $deep->{nested}{depth}\n";

# freeze/thaw round trip through a string
my $bytes = freeze(\%original);
my $copy  = thaw($bytes);
print "thawed name: $copy->{name}\n";
print "same ref? ", ($copy->{tags} == $original{tags} ? "yes" : "no"), "\n";

# cycles survive cloning
my $node = { id => 1 };
$node->{self} = $node;
my $clone = dclone($node);
print "cycle preserved: ", ($clone->{self} == $clone ? "yes" : "no"), "\n";
