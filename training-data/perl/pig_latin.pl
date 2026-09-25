use strict;
use warnings;

sub pig_word {
    my $w = shift;
    return "${w}ay" if $w =~ /^(?:[aeiou]|xr|yt)/;
    return "$2$1ay" if $w =~ /^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$/;
    return "${w}ay";
}

print join(' ', map { pig_word($_) } split ' ', 'quick fast run apple rhythm square'), "\n";
