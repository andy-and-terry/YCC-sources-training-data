use strict;
use warnings;

my %DEFAULT_PORT = (http => 80, https => 443, ftp => 21);

sub parse_url {
    my $url = shift;
    $url =~ m{^
        (?<scheme>[a-z][a-z0-9+.-]*)://
        (?:(?<user>[^@/]*)@)?
        (?<host>[^:/?#]+)
        (?::(?<port>\d+))?
        (?<path>/[^?#]*)?
        (?:\?(?<query>[^#]*))?
        (?:\#(?<frag>.*))?
    $}xi or die "invalid URL: $url\n";
    my %u = %+;
    $u{scheme} = lc $u{scheme};
    $u{host}   = lc $u{host};
    $u{port} //= $DEFAULT_PORT{ $u{scheme} } // 0;
    $u{path} //= '/';
    my %q;
    for (split /&/, $u{query} // '') {
        my ($k, $v) = split /=/, $_, 2;
        s/\+/ /g, s/%([0-9A-Fa-f]{2})/chr hex $1/ge for $k, $v //= '';
        $q{$k} = $v;
    }
    $u{query} = \%q;
    return \%u;
}

for my $url ('https://user:pw@Example.com:8443/a/b?x=1&y=hello+world#top', 'http://localhost', 'not a url') {
    my $u = eval { parse_url($url) } or print("error: $@"), next;
    print join(' ', map { my $v = $u->{$_}; "$_=" . (ref $v ? '{' . join(',', map { "$_:$v->{$_}" } sort keys %$v) . '}' : $v // '-') }
        qw(scheme user host port path query frag)), "\n";
}
