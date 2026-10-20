use strict; use warnings;
my %h = (a => 1, b => 2, c => 3, d => 4);
my @vals = @h{qw(a c)};
my %sub; @sub{qw(b d)} = @h{qw(b d)};
print "@vals ", join(",", map {"$_=$sub{$_}"} sort keys %sub), "\n";
my %tree = (root => { kids => [ { name => 'x' }, { name => 'y' } ] });
print join(" ", map { $_->{name} } @{ $tree{root}{kids} }), "\n";
