use strict;
use warnings;

package LegacyLogger;

sub new {
    my ($class) = @_;
    return bless {}, $class;
}

sub write_entry {
    my ($self, $text) = @_;
    return "LEGACY: $text";
}

package LoggerAdapter;

sub new {
    my ($class, $legacy) = @_;
    return bless { legacy => $legacy }, $class;
}

sub log {
    my ($self, $message) = @_;
    return $self->{legacy}->write_entry($message);
}

package main;

my $adapter = LoggerAdapter->new(LegacyLogger->new);
print $adapter->log("service started"), "\n";
