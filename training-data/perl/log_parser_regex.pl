use strict;
use warnings;

my @log_lines = (
    '203.0.113.5 - - [22/Sep/2026:10:00:01] "GET /index.html HTTP/1.1" 200 512',
    '203.0.113.9 - - [22/Sep/2026:10:00:03] "POST /login HTTP/1.1" 401 128',
    '198.51.100.2 - - [22/Sep/2026:10:00:07] "GET /missing HTTP/1.1" 404 0',
    '203.0.113.5 - - [22/Sep/2026:10:00:09] "GET /about HTTP/1.1" 200 256',
);

my %status_counts;
for my $line (@log_lines) {
    if ($line =~ /^(\S+) \S+ \S+ \[([^\]]+)\] "(\S+) (\S+) [^"]*" (\d{3}) (\d+)/) {
        my ($ip, $timestamp, $method, $path, $status, $size) = ($1, $2, $3, $4, $5, $6);
        $status_counts{$status}++;
        print "$ip requested $method $path -> $status ($size bytes) at $timestamp\n";
    }
}

print "\nStatus code totals:\n";
for my $status (sort keys %status_counts) {
    print "  $status: $status_counts{$status}\n";
}
