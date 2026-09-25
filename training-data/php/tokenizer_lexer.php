<?php

enum TokenType: string
{
    case Number = 'NUMBER';
    case Ident = 'IDENT';
    case Keyword = 'KEYWORD';
    case String = 'STRING';
    case Op = 'OP';
    case Punct = 'PUNCT';
}

final class Token
{
    public function __construct(public readonly TokenType $type, public readonly string $text, public readonly int $line)
    {
    }
}

function tokenize(string $src): array
{
    $spec = [
        'WS' => '\s+',
        'COMMENT' => '\/\/[^\n]*',
        'NUMBER' => '\d+(?:\.\d+)?',
        'STRING' => '"(?:\\\\.|[^"\\\\])*"',
        'IDENT' => '[A-Za-z_]\w*',
        'OP' => '==|!=|<=|>=|&&|\|\||[-+*\/=<>!]',
        'PUNCT' => '[(){};,]',
    ];
    $regex = '/' . implode('|', array_map(fn ($k, $v) => "(?P<$k>$v)", array_keys($spec), $spec)) . '/A';
    $keywords = ['let', 'if', 'else', 'while', 'return', 'fn'];
    [$pos, $line, $tokens] = [0, 1, []];
    while ($pos < strlen($src)) {
        if (!preg_match($regex, $src, $m, 0, $pos)) {
            throw new RuntimeException("unexpected '{$src[$pos]}' on line $line");
        }
        $kind = array_key_first(array_filter($m, fn ($v, $k) => is_string($k) && $v !== '', ARRAY_FILTER_USE_BOTH));
        if ($kind !== 'WS' && $kind !== 'COMMENT') {
            $type = $kind === 'IDENT' && in_array($m[0], $keywords, true) ? TokenType::Keyword : TokenType::from($kind);
            $tokens[] = new Token($type, $m[0], $line);
        }
        $line += substr_count($m[0], "\n");
        $pos += strlen($m[0]);
    }
    return $tokens;
}

$src = <<<'SRC'
let x = 42; // answer
if (x >= 10 && name != "a \"b\"") {
    return x * 2.5;
}
SRC;
foreach (tokenize($src) as $t) {
    printf("%d %-8s %s\n", $t->line, $t->type->value, $t->text);
}
