use strict;
use warnings;
use Encode qw(decode encode);

sub url_decode { my $s = shift; $s =~ tr/+/ /; $s =~ s/%([0-9A-Fa-f]{2})/chr hex $1/ge; decode('UTF-8', $s) }
sub url_encode { my $s = encode('UTF-8', shift); $s =~ s/([^A-Za-z0-9\-_.~ ])/sprintf '%%%02X', ord $1/ge; $s =~ tr/ /+/; $s }

sub parse_query {
    my $qs = shift =~ s/^\?//r;
    my (%params, @order);
    for my $pair (grep { length } split /&/, $qs) {
        my ($k, $v) = map { url_decode($_) } split(/=/, $pair, 2), '';
        push @order, $k unless exists $params{$k};
        push @{ $params{$k} }, $v;
    }
    return (\%params, \@order);
}

sub build_query {
    my ($params, $order) = @_;
    return join '&', map { my $k = $_; map { url_encode($k) . '=' . url_encode($_) } @{ $params->{$k} } } @$order;
}

binmode STDOUT, ':encoding(UTF-8)';
my ($params, $order) = parse_query('?name=J%C3%BCrgen+M&tag=a&tag=b&empty=&flag');
print join(', ', map { "$_=[" . join(',', @{ $params->{$_} }) . ']' } @$order), "\n";
print build_query($params, $order), "\n";
