use strict;
use warnings;

my $csv = 'name=Ada;age=36;city=London';
while ($csv =~ /(\w+)=(\w+)/g) {
    printf "%-5s => %-6s (ends at %d)\n", $1, $2, pos($csv);
}

my @numbers = "10 apples, 25 pears, 7 figs" =~ /(\d+)/g;
print "numbers: @numbers\n";

# lexer using \G and /gc
my $src = "x = 42 + y";
my @tokens;
for ($src) {
    while (1) {
        if    (/\G\s+/gc)         { next }
        elsif (/\G(\d+)/gc)       { push @tokens, "NUM($1)" }
        elsif (/\G([A-Za-z_]\w*)/gc) { push @tokens, "ID($1)" }
        elsif (/\G([=+])/gc)      { push @tokens, "OP($1)" }
        else                      { last }
    }
}
print join(" ", @tokens), "\n";

(my $s = "a1b2c3") =~ s/(\d)/<$1>/g;
print "$s\n";
my $count = () = "banana" =~ /a/g;
print "a appears $count times\n";
