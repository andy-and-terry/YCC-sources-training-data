use strict;
use warnings;

package MyException;

sub new {
    my ($class, $message) = @_;
    return bless { message => $message }, $class;
}

sub message {
    my $self = shift;
    return $self->{message};
}

package NotFoundException;

our @ISA = ('MyException');

package main;

sub find_item {
    my ($items, $key) = @_;
    die NotFoundException->new("item '$key' not found") unless exists $items->{$key};
    return $items->{$key};
}

my %items = (apple => 1.5, banana => 0.5);

for my $key ("apple", "kiwi") {
    my $result = eval { find_item(\%items, $key) };
    if (my $err = $@) {
        if (ref($err) && $err->isa('NotFoundException')) {
            print "caught: ", $err->message, "\n";
        } else {
            print "unexpected error: $err\n";
        }
    } else {
        print "$key costs $result\n";
    }
}
