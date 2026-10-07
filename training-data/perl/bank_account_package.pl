use strict;
use warnings;

package BankAccount;

sub new {
    my ($class, %args) = @_;
    return bless { balance => $args{balance} // 0, history => [] }, $class;
}

sub balance { $_[0]{balance} }

sub deposit {
    my ($self, $amt) = @_;
    die "amount must be positive\n" unless $amt > 0;
    $self->{balance} += $amt;
    push @{ $self->{history} }, "+$amt";
    return $self;
}

sub withdraw {
    my ($self, $amt) = @_;
    die "insufficient funds: requested $amt, have $self->{balance}\n" if $amt > $self->{balance};
    $self->{balance} -= $amt;
    push @{ $self->{history} }, "-$amt";
    return $self;
}

package main;

my $acct = BankAccount->new(balance => 100);
$acct->deposit(50)->withdraw(30);
eval { $acct->withdraw(1000) };
print "error: $@" if $@;
print $acct->balance, " [@{ $acct->{history} }]\n";
