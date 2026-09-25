use strict;
use warnings;

sub pig_word {
    my $w = shift;
    my $cap = $w =~ /^[A-Z]/;
    my $out = lc $w;
    if ($out =~ /^[aeiou]/)                          { $out .= 'way' }
    elsif ($out =~ /^([^aeiou]*?qu|[^aeiouy]+)(.*)$/) { $out = "$2$1ay" }
    else                                               { $out .= 'ay' }
    return $cap ? ucfirst $out : $out;
}

sub pig_latin { (my $s = shift) =~ s/([A-Za-z]+)/pig_word($1)/ge; $s }

print pig_latin('The quick brown fox jumps over the lazy dog'), "\n";
print pig_latin('Hello, rhythm and apple!'), "\n";
