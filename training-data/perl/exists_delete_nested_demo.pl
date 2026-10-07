#!/usr/bin/perl
use strict;
use warnings;

my %config = (
    db => { host => 'localhost', port => 5432 },
    cache => {},
);

print "db.host exists\n" if exists $config{db}{host};
print "db.user missing\n" unless exists $config{db}{user};

# testing a deep path without autovivifying the intermediate levels
print "cache.ttl missing\n" unless exists $config{cache} && exists $config{cache}{ttl};
print "keys before: ", join(",", sort keys %config), "\n";

my $x = $config{queue}{size};
print "keys after careless read: ", join(",", sort keys %config), "\n";

my $removed = delete $config{db}{port};
print "removed port $removed\n";
my @gone = delete @{ $config{db} }{qw(host nothing)};
print defined $gone[1] ? "both\n" : "second was undef\n";
