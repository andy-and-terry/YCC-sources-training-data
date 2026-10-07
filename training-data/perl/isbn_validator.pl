use strict;
use warnings;
use List::Util qw(sum);

sub isbn10_ok {
    my @c = split //, shift;
    return 0 unless @c == 10 && join('', @c) =~ /^\d{9}[\dX]$/;
    $c[9] = 10 if $c[9] eq 'X';
    return sum(map { $c[$_] * (10 - $_) } 0 .. 9) % 11 == 0;
}

sub isbn13_ok {
    my @d = split //, shift;
    return 0 unless @d == 13 && join('', @d) =~ /^\d+$/;
    return sum(map { $d[$_] * ($_ % 2 ? 3 : 1) } 0 .. 12) % 10 == 0;
}

sub validate {
    (my $s = uc shift) =~ s/[-\s]//g;
    return length $s == 10 ? (isbn10_ok($s) ? 'valid ISBN-10' : 'bad ISBN-10 checksum')
         : length $s == 13 ? (isbn13_ok($s) ? 'valid ISBN-13' : 'bad ISBN-13 checksum')
         : 'invalid length ' . length $s;
}

sub to13 {
    (my $s = shift) =~ s/-//g;
    my $core = '978' . substr($s, 0, 9);
    my @d = split //, $core;
    return $core . (10 - sum(map { $d[$_] * ($_ % 2 ? 3 : 1) } 0 .. 11) % 10) % 10;
}

printf "%-18s %s\n", $_, validate($_) for '0-306-40615-2', '0-306-40615-3', '978-0-306-40615-7', '0-8044-2957-X', '12345';
print 'to ISBN-13: ', to13('0-306-40615-2'), "\n";
