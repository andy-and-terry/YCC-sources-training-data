use strict;
use warnings;
use Scalar::Util qw(blessed reftype looks_like_number weaken refaddr dualvar);

my $obj = bless [], 'Foo';
print blessed($obj), " ", reftype($obj), " ", (blessed([]) // 'undef'), "\n";
print join(",", map { looks_like_number($_) ? 1 : 0 } (42, "4.2e3", "abc", "0x10", " 12 ", "")), "\n";
print ref(\1), ref([]), ref({}), ref(sub {}), ref(\\1), ref(qr/x/), "\n";
my $parent = { name => 'p' }; my $child = { parent => $parent }; $parent->{child} = $child;
weaken($child->{parent});
print defined $child->{parent} ? "alive" : "gone", "\n";
