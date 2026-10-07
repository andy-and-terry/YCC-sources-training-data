use strict;
use warnings;

# Prototypes let user subs behave like built-ins.
sub apply_block(&@) {
    my ($code, @list) = @_;
    return map { $code->($_) } @list;
}

sub max2($$) { $_[0] > $_[1] ? $_[0] : $_[1] }

sub push_twice(\@$) {
    my ($array, $v) = @_;
    push @$array, $v, $v;
}

print join(",", apply_block { $_[0] ** 2 } 1 .. 5), "\n";
print max2(3, 9), "\n";

my @a = (1);
push_twice(@a, 7);
print "@a\n";
