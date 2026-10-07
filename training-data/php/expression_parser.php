<?php

/** Recursive-descent parser producing an array-based AST, then evaluating it. */
final class ExprParser
{
    private array $tokens;
    private int $pos = 0;

    public function __construct(string $src)
    {
        preg_match_all('/\d+(?:\.\d+)?|[a-z]\w*|[-+*\/^()]/i', $src, $m);
        $this->tokens = $m[0];
    }

    public function parse(): array
    {
        $ast = $this->expr();
        if ($this->peek() !== null) {
            throw new ParseError('unexpected ' . $this->peek());
        }
        return $ast;
    }

    private function peek(): ?string
    {
        return $this->tokens[$this->pos] ?? null;
    }

    private function take(): ?string
    {
        return $this->tokens[$this->pos++] ?? null;
    }

    private function expr(): array
    {
        $node = $this->term();
        while (in_array($this->peek(), ['+', '-'], true)) {
            $node = [$this->take(), $node, $this->term()];
        }
        return $node;
    }

    private function term(): array
    {
        $node = $this->power();
        while (in_array($this->peek(), ['*', '/'], true)) {
            $node = [$this->take(), $node, $this->power()];
        }
        return $node;
    }

    private function power(): array
    {
        $base = $this->unary();
        if ($this->peek() === '^') {
            $this->take();
            return ['^', $base, $this->power()];
        }
        return $base;
    }

    private function unary(): array
    {
        if ($this->peek() === '-') {
            $this->take();
            return ['neg', $this->unary()];
        }
        return $this->primary();
    }

    private function primary(): array
    {
        $tok = $this->take();
        if ($tok === '(') {
            $node = $this->expr();
            if ($this->take() !== ')') {
                throw new ParseError('expected )');
            }
            return $node;
        }
        if ($tok !== null && is_numeric($tok)) {
            return ['num', (float) $tok];
        }
        if ($tok !== null && ctype_alpha($tok[0])) {
            return ['var', $tok];
        }
        throw new ParseError('unexpected ' . var_export($tok, true));
    }
}

function evaluate(array $n, array $env): float
{
    return match ($n[0]) {
        'num' => $n[1],
        'var' => $env[$n[1]] ?? throw new RuntimeException("unbound {$n[1]}"),
        'neg' => -evaluate($n[1], $env),
        '+' => evaluate($n[1], $env) + evaluate($n[2], $env),
        '-' => evaluate($n[1], $env) - evaluate($n[2], $env),
        '*' => evaluate($n[1], $env) * evaluate($n[2], $env),
        '/' => evaluate($n[1], $env) / evaluate($n[2], $env),
        '^' => evaluate($n[1], $env) ** evaluate($n[2], $env),
    };
}

$env = ['x' => 2.0, 'y' => 4.0];
foreach (['1 + 2 * 3', '2 ^ 3 ^ 2', '-(x + 3) * y', '(1 + 2', 'x / 0.5'] as $src) {
    try {
        printf("%-14s = %s\n", $src, evaluate((new ExprParser($src))->parse(), $env));
    } catch (ParseError $e) {
        printf("%-14s error: %s\n", $src, $e->getMessage());
    }
}
