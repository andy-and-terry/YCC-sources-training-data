use strict;
use warnings;
use List::Util qw(min);

sub retry {
    my ($code, %opt) = @_;
    my $max   = $opt{max_attempts} // 5;
    my $base  = $opt{base_ms}      // 50;
    my $cap   = $opt{cap_ms}       // 1000;
    my $sleep = $opt{sleep}        // sub { select undef, undef, undef, $_[0] / 1000 };
    for my $attempt (1 .. $max) {
        my @result = eval { $code->($attempt) };
        return wantarray ? @result : $result[0] unless $@;
        die $@ if $attempt == $max;
        chomp(my $err = $@);
        my $delay = int rand(1 + min($cap, $base * 2**($attempt - 1)));    # full jitter
        print "attempt $attempt failed ($err), sleeping ${delay}ms\n";
        $sleep->($delay);
    }
}

srand 42;
my $no_sleep = sub { };
print retry(sub { my $n = shift; die "service unavailable\n" if $n < 3; "ok on attempt $n" }, sleep => $no_sleep), "\n";
eval { retry(sub { die "always down\n" }, max_attempts => 2, sleep => $no_sleep) };
print "gave up: $@";
