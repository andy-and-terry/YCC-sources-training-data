use strict;
use warnings;

package Inventory;
use Carp qw(croak);

sub new { bless { items => {}, log => [] }, shift }

sub add_item {
    my ($s, %a) = @_;
    croak "duplicate sku $a{sku}" if $s->{items}{ $a{sku} };
    $s->{items}{ $a{sku} } = { name => $a{name}, qty => $a{qty} // 0, price => $a{price}, reorder => $a{reorder} // 5 };
}

sub restock { my ($s, $sku, $n) = @_; $s->_item($sku)->{qty} += $n; push @{ $s->{log} }, "+$n $sku" }

sub sell {
    my ($s, $sku, $n) = @_;
    my $it = $s->_item($sku);
    croak "only $it->{qty} $sku left" if $it->{qty} < $n;
    $it->{qty} -= $n;
    push @{ $s->{log} }, "-$n $sku";
    return $n * $it->{price};
}

sub _item { my ($s, $sku) = @_; $s->{items}{$sku} or croak "unknown sku $sku" }

sub low_stock { my $s = shift; grep { $s->{items}{$_}{qty} <= $s->{items}{$_}{reorder} } sort keys %{ $s->{items} } }

sub value { my $s = shift; my $v = 0; $v += $_->{qty} * $_->{price} for values %{ $s->{items} }; $v }

sub report {
    my $s = shift;
    return map { sprintf "%-6s %-10s %4d @ %6.2f", $_, @{ $s->{items}{$_} }{qw(name qty price)} } sort keys %{ $s->{items} };
}

package main;

my $inv = Inventory->new;
$inv->add_item(sku => 'A100', name => 'Widget', qty => 20, price => 2.50);
$inv->add_item(sku => 'B200', name => 'Gadget', qty => 4,  price => 12.00, reorder => 3);
$inv->add_item(sku => 'C300', name => 'Doohickey', qty => 8, price => 7.25, reorder => 10);
my $revenue = $inv->sell('A100', 16) + $inv->sell('B200', 2);
$inv->restock('C300', 5);
eval { $inv->sell('B200', 10); 1 } or print 'error: ', $@ =~ s/ at .*//sr, "\n";
print "$_\n" for $inv->report;
printf "revenue=%.2f stock value=%.2f low stock: %s\n", $revenue, $inv->value, join(', ', $inv->low_stock);
print 'log: ', join(', ', @{ $inv->{log} }), "\n";
