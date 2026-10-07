use strict;
use warnings;

my %to_c   = (C => sub { $_[0] }, F => sub { ($_[0] - 32) * 5 / 9 }, K => sub { $_[0] - 273.15 });
my %from_c = (C => sub { $_[0] }, F => sub { $_[0] * 9 / 5 + 32 },   K => sub { $_[0] + 273.15 });

sub convert {
    my ($v, $from, $to) = @_;
    die "unknown unit\n" unless $to_c{$from} && $from_c{$to};
    return $from_c{$to}->($to_c{$from}->($v));
}

printf "%.2f %.2f\n", convert(100, 'C', 'F'), convert(212, 'F', 'K');
