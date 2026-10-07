use strict;
use warnings;

# Tiny template engine: {{ var }}, {{ user.name }}, {{ name|upper }},
# {% if x %}...{% endif %}, {% for x in xs %}...{% endfor %}
my %FILTERS = (upper => sub { uc shift }, lower => sub { lc shift }, raw => sub { shift });

sub escape_html { my $s = shift; $s =~ s/([&<>"'])/'&#' . ord($1) . ';'/ge; $s }

sub lookup {
    my ($ctx, $path) = @_;
    my $v = $ctx;
    $v = ref $v eq 'HASH' ? $v->{$_} : undef for split /\./, $path;
    return $v;
}

sub render {
    my ($tpl, $ctx) = @_;
    $tpl =~ s/\{% for (\w+) in ([\w.]+) %\}(.*?)\{% endfor %\}/
        my ($var, $body) = ($1, $3);
        join '', map { render($body, { %$ctx, $var => $_ }) } @{ lookup($ctx, $2) || [] }
    /gse;
    $tpl =~ s/\{% if ([\w.]+) %\}(.*?)\{% endif %\}/lookup($ctx, $1) ? $2 : ''/gse;
    $tpl =~ s/\{\{\s*([\w.]+)(?:\|(\w+))?\s*\}\}/
        my $v = lookup($ctx, $1) \/\/ '';
        $2 ? ($FILTERS{$2} or die "unknown filter $2\n")->($v) : escape_html($v)
    /ge;
    return $tpl;
}

print render(<<'TPL', { user => { first => 'Ada', last => 'Lovelace' }, count => 3, noun => 'messages', admin => 1, tags => ['math', '<engines>'] });
Hello {{ user.first }} {{ user.last }}, you have {{ count }} new {{ noun|upper }}.
{% if admin %}[admin]
{% endif %}{% for t in tags %}- {{ t }}
{% endfor %}{% if missing %}hidden{% endif %}done
TPL
