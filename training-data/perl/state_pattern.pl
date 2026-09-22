use strict;
use warnings;

# GoF State pattern: each state is its own package with its own behavior
# for the same messages, and transitions swap the object's blessed class
# instead of branching on a status flag.

package OrderNew;

sub new { return bless {}, shift; }

sub submit {
    my ($self, $order) = @_;
    print "order submitted\n";
    $order->{state} = OrderSubmitted->new;
}

sub name { return 'New'; }

package OrderSubmitted;

sub new { return bless {}, shift; }

sub ship {
    my ($self, $order) = @_;
    print "order shipped\n";
    $order->{state} = OrderShipped->new;
}

sub name { return 'Submitted'; }

package OrderShipped;

sub new { return bless {}, shift; }

sub deliver {
    my ($self, $order) = @_;
    print "order delivered\n";
    $order->{state} = OrderDelivered->new;
}

sub name { return 'Shipped'; }

package OrderDelivered;

sub new { return bless {}, shift; }

sub name { return 'Delivered'; }

package Order;

sub new {
    my ($class) = @_;
    return bless { state => OrderNew->new }, $class;
}

sub submit  { my ($self) = @_; $self->{state}->submit($self)  if $self->{state}->can('submit'); }
sub ship    { my ($self) = @_; $self->{state}->ship($self)    if $self->{state}->can('ship'); }
sub deliver { my ($self) = @_; $self->{state}->deliver($self) if $self->{state}->can('deliver'); }
sub status  { my ($self) = @_; return $self->{state}->name; }

package main;

my $order = Order->new;
print $order->status, "\n";
$order->submit;
print $order->status, "\n";
$order->ship;
print $order->status, "\n";
$order->deliver;
print $order->status, "\n";
