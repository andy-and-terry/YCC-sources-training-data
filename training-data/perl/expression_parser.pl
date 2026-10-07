use strict;
use warnings;

# Recursive-descent parser:
#   expr   := term (('+'|'-') term)*
#   term   := factor (('*'|'/'|'%') factor)*
#   factor := unary ('^' factor)?
#   unary  := '-' unary | primary
#   primary:= NUMBER | IDENT | IDENT '(' expr ')' | '(' expr ')'
my %FUNCS = (sqrt => sub { sqrt $_[0] }, abs => sub { abs $_[0] }, sin => sub { sin $_[0] });

sub evaluate {
    my ($src, $vars) = @_;
    my @tok = $src =~ /\s*(\d+(?:\.\d+)?|[A-Za-z_]\w*|\S)/g;
    my $peek = sub { $tok[0] // '' };
    my $take = sub { my $want = shift; die "expected '$want' but got '" . $peek->() . "'\n" if defined $want && $peek->() ne $want; shift @tok };
    my ($expr, $term, $factor, $unary, $primary);
    $expr = sub {
        my $v = $term->();
        while ($peek->() =~ /^[-+]$/) { my $op = $take->(); my $r = $term->(); $v = $op eq '+' ? $v + $r : $v - $r }
        $v;
    };
    $term = sub {
        my $v = $factor->();
        while ($peek->() =~ m{^[*/%]$}) {
            my $op = $take->();
            my $r = $factor->();
            die "division by zero\n" if $op ne '*' && $r == 0;
            $v = $op eq '*' ? $v * $r : $op eq '/' ? $v / $r : $v % $r;
        }
        $v;
    };
    $factor = sub { my $b = $unary->(); if ($peek->() eq '^') { $take->(); return $b**$factor->() } $b };
    $unary = sub { if ($peek->() eq '-') { $take->(); return -$unary->() } $primary->() };
    $primary = sub {
        my $t = $take->() // die "unexpected end of input\n";
        return $t if $t =~ /^\d/;
        if ($t eq '(') { my $v = $expr->(); $take->(')'); return $v }
        if ($t =~ /^[A-Za-z_]/) {
            if ($peek->() eq '(') {
                my $f = $FUNCS{$t} or die "unknown function $t\n";
                $take->('(');
                my $v = $expr->();
                $take->(')');
                return $f->($v);
            }
            exists $vars->{$t} or die "unknown variable $t\n";
            return $vars->{$t};
        }
        die "unexpected '$t'\n";
    };
    my $v = $expr->();
    die "trailing input '$tok[0]'\n" if @tok;
    undef $_ for $expr, $term, $factor, $unary, $primary;    # break closure cycles
    return $v;
}

for my $e ('1 + 2 * 3', '(1 + 2) * 3', '2 ^ 3 ^ 2', '-x^2 + sqrt(16) * y', '10 % 4 - -3', '7 / (3 - 3)', '(1 + 2') {
    my $r = eval { evaluate($e, { x => 3, y => 2.5 }) };
    printf "%-22s => %s\n", $e, defined $r ? $r : "error: $@" =~ s/\n//r;
}
