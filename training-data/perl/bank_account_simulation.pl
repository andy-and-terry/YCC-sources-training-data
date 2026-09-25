use strict;
use warnings;

package BankAccount;
use Carp qw(croak);

sub new {
    my ($class, %args) = @_;
    return bless { owner => $args{owner}, balance => $args{balance} // 0, history => [] }, $class;
}

sub deposit {
    my ($self, $amt) = @_;
    croak 'amount must be positive' if $amt <= 0;
    $self->{balance} += $amt;
    push @{ $self->{history} }, "deposit $amt";
    return $self;
}

sub withdraw {
    my ($self, $amt) = @_;
    croak 'insufficient funds' if $amt > $self->{balance};
    $self->{balance} -= $amt;
    push @{ $self->{history} }, "withdraw $amt";
    return $self;
}

sub transfer {
    my ($self, $to, $amt) = @_;
    $self->withdraw($amt);
    $to->deposit($amt);
}

sub balance { $_[0]{balance} }
sub history { @{ $_[0]{history} } }

package main;

my $alice = BankAccount->new(owner => 'Alice', balance => 100);
my $bob   = BankAccount->new(owner => 'Bob');
$alice->deposit(50)->withdraw(30);
$alice->transfer($bob, 70);
eval { $bob->withdraw(500); 1 } or print 'error: ', $@ =~ s/ at .*//sr, "\n";
printf "alice=%d bob=%d\n", $alice->balance, $bob->balance;
print join(', ', $alice->history), "\n";
