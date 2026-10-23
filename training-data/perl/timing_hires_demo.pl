use strict;
use warnings;
use Time::HiRes qw(time sleep usleep gettimeofday tv_interval);

# Measure elapsed wall time with sub-second precision
my $t0 = [gettimeofday];
my $sum = 0;
$sum += $_ for 1 .. 200_000;
my $elapsed = tv_interval($t0);
printf "sum=%d, took less than 5s: %s\n", $sum, $elapsed < 5 ? 'yes' : 'no';

# Fractional sleeping
my $start = time;
sleep(0.15);
usleep(50_000);                       # microseconds
my $waited = time - $start;
printf "slept at least 0.19s: %s\n", $waited >= 0.19 ? 'yes' : 'no';

# A tiny benchmark helper that takes a code ref
sub bench {
    my ($label, $code, $n) = @_;
    my $t = [gettimeofday];
    $code->() for 1 .. $n;
    printf "%-8s ran %d times, elapsed >= 0: %s\n", $label, $n,
        tv_interval($t) >= 0 ? 'yes' : 'no';
}
bench('join',   sub { my $s = join ',', 1 .. 20 }, 2000);
bench('concat', sub { my $s = ''; $s .= "$_," for 1 .. 20 }, 2000);
