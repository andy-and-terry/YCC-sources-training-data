use strict;
use warnings;

my %MORSE = (
    A => '.-',   B => '-...', C => '-.-.', D => '-..',  E => '.',    F => '..-.', G => '--.',
    H => '....', I => '..',   J => '.---', K => '-.-',  L => '.-..', M => '--',   N => '-.',
    O => '---',  P => '.--.', Q => '--.-', R => '.-.',  S => '...',  T => '-',    U => '..-',
    V => '...-', W => '.--',  X => '-..-', Y => '-.--', Z => '--..',
    0 => '-----', 1 => '.----', 2 => '..---', 3 => '...--', 4 => '....-',
    5 => '.....', 6 => '-....', 7 => '--...', 8 => '---..', 9 => '----.',
);
my %TEXT = reverse %MORSE;

sub encode { join ' / ', map { join ' ', grep { defined } @MORSE{ split // } } split ' ', uc shift }
sub decode { join ' ', map { join '', map { $TEXT{$_} // '?' } split / / } split m{ / }, shift }

my $m = encode('SOS help 2024');
print "$m\n", decode($m), "\n";
