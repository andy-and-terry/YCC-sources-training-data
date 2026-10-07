use strict;
use warnings;

sub exists_word {
    my ($board, $word) = @_;
    my @b = map { [split //] } @$board;
    my @w = split //, $word;
    my $dfs;
    $dfs = sub {
        my ($r, $c, $i) = @_;
        return 1 if $i == @w;
        return 0 if $r < 0 || $c < 0 || $r > $#b || $c > $#{ $b[0] } || $b[$r][$c] ne $w[$i];
        my $saved = $b[$r][$c];
        $b[$r][$c] = '#';
        my $found = $dfs->($r + 1, $c, $i + 1) || $dfs->($r - 1, $c, $i + 1) || $dfs->($r, $c + 1, $i + 1) || $dfs->($r, $c - 1, $i + 1);
        $b[$r][$c] = $saved;
        return $found;
    };
    for my $r (0 .. $#b) {
        for my $c (0 .. $#{ $b[0] }) {
            if ($dfs->($r, $c, 0)) { undef $dfs; return 1 }
        }
    }
    undef $dfs;
    return 0;
}

my @board = qw(ABCE SFCS ADEE);
print "$_: ", (exists_word(\@board, $_) ? 'yes' : 'no'), "\n" for qw(ABCCED SEE ABCB);
