use strict;
use warnings;
use Carp qw(croak);

sub make_box {
    my %args = (width => 1, height => 1, label => "box", @_);
    my @unknown = grep { !/^(?:width|height|label)$/ } keys %args;
    croak "unknown args: @unknown" if @unknown;
    return { %args, area => $args{width} * $args{height} };
}

my $b = make_box(width => 4, height => 3);
print "$b->{label}: area=$b->{area}\n";

my $c = make_box(label => "unit");
print "$c->{label}: area=$c->{area}\n";

eval { make_box(colour => "red") };
print "error: $@" if $@;
