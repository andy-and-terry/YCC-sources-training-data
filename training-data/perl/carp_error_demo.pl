use strict;
use warnings;
use Carp qw(croak carp confess);

sub withdraw {
    my ($balance, $amount) = @_;
    croak "amount must be positive" unless $amount > 0;
    croak "insufficient funds: have $balance, need $amount" if $amount > $balance;
    return $balance - $amount;
}

for my $amt (30, -5, 500) {
    my $result = eval { withdraw(100, $amt) };
    if ($@) {
        (my $msg = $@) =~ s/ at .*//s;     # drop location for readable output
        print "failed: $msg\n";
    } else {
        print "new balance: $result\n";
    }
}

local $SIG{__WARN__} = sub { print "warning caught: ", $_[0] =~ s/ at .*//sr, "\n" };
carp "this is a warning";
warn "plain warning\n";
