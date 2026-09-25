use strict;
use warnings;

my @SPEC = (
    [WS      => qr/\s+/],
    [COMMENT => qr{//[^\n]*}],
    [NUMBER  => qr/\d+(?:\.\d+)?/],
    [STRING  => qr/"(?:\\.|[^"\\])*"/],
    [IDENT   => qr/[A-Za-z_]\w*/],
    [OP      => qr/==|!=|<=|>=|&&|\|\||[-+*\/=<>!]/],
    [PUNCT   => qr/[(){};,]/],
);
my %KEYWORDS = map { $_ => 1 } qw(let if else while return fn);

sub tokenize {
    my $src = shift;
    my ($line, @tokens) = (1);
    pos($src) = 0;
    TOKEN: while (pos($src) < length $src) {
        for my $rule (@SPEC) {
            my ($type, $re) = @$rule;
            next unless $src =~ /\G($re)/gc;
            my $text = $1;
            $type = 'KEYWORD' if $type eq 'IDENT' && $KEYWORDS{$text};
            push @tokens, [$type, $text, $line] unless $type eq 'WS' || $type eq 'COMMENT';
            $line += ($text =~ tr/\n//);
            next TOKEN;
        }
        die sprintf "unexpected '%s' on line %d\n", substr($src, pos($src), 1), $line;
    }
    return @tokens;
}

my $src = <<'SRC';
let x = 42; // answer
if (x >= 10 && name != "a \"b\"") {
    return x * 2.5;
}
SRC
printf "%d %-8s %s\n", @$_[2, 0, 1] for tokenize($src);
eval { tokenize('let y = 3 @ 4;') } or print "error: $@";
