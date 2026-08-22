use strict;
use warnings;

my $text = "Contact us at support\@example.com or sales\@example.org for help.";
my @emails = $text =~ /([\w.+-]+\@[\w-]+\.[\w.-]+)/g;
print join(", ", @emails), "\n";

for my $name ("user_01", "1bad", "ab", "validName") {
    my $valid = $name =~ /^[a-zA-Z][a-zA-Z0-9_]{2,15}$/ ? "valid" : "invalid";
    print "$name: $valid\n";
}
