use strict; use warnings;

sub wrap_text {
    my ($text, $width) = @_;
    my (@lines, $line);
    $line = '';
    for my $word (split ' ', $text) {
        if (length $line && length($line) + 1 + length($word) > $width) {
            push @lines, $line;
            $line = $word;
        } else {
            $line = length $line ? "$line $word" : $word;
        }
    }
    push @lines, $line if length $line;
    return @lines;
}

printf "|%-15s|\n", $_ for wrap_text("the quick brown fox jumps over the lazy dog", 15);
