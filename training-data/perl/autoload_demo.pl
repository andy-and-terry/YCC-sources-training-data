use strict;
use warnings;

package DynamicRecord;

our $AUTOLOAD;

sub new {
    my ($class, %fields) = @_;
    return bless { %fields }, $class;
}

sub AUTOLOAD {
    my ($self) = @_;
    my $name = $AUTOLOAD;
    $name =~ s/.*:://;
    return if $name eq 'DESTROY';

    if (exists $self->{$name}) {
        return $self->{$name};
    }
    die "no such field: $name\n";
}

package main;

my $record = DynamicRecord->new(name => "Ada", age => 37);
print $record->name, " is ", $record->age, "\n";

my $ok = eval { $record->missing_field; 1 };
print "error: $@" unless $ok;
