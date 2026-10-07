use strict;
use warnings;

# Lexer using \G and pos() with the /gc flags.
my $src = "x = 3 + 42 * (y - 1)";
my @tokens;

for ($src) {
    while (1) {
        if    (/\G\s+/gc)          { next }
        elsif (/\G(\d+)/gc)        { push @tokens, "NUM($1)" }
        elsif (/\G([A-Za-z_]\w*)/gc) { push @tokens, "ID($1)" }
        elsif (/\G([-+*\/=()])/gc) { push @tokens, "OP($1)" }
        elsif (/\G\z/gc)           { last }
        else { die "bad char at " . pos() }
    }
}

print join(" ", @tokens), "\n";
