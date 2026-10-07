<?php

const PREC = ['+' => [1, 'L'], '-' => [1, 'L'], '*' => [2, 'L'], '/' => [2, 'L'], '^' => [3, 'R']];

function toRpn(string $expr): array
{
    preg_match_all('/\d+(?:\.\d+)?|[-+*\/^()]/', $expr, $m);
    [$out, $ops] = [[], []];
    foreach ($m[0] as $tok) {
        if (is_numeric($tok)) {
            $out[] = $tok;
        } elseif ($tok === '(') {
            $ops[] = $tok;
        } elseif ($tok === ')') {
            while (end($ops) !== '(') {
                $out[] = array_pop($ops);
            }
            array_pop($ops);
        } else {
            [$p, $assoc] = PREC[$tok];
            while ($ops && end($ops) !== '(' && (PREC[end($ops)][0] > $p || (PREC[end($ops)][0] === $p && $assoc === 'L'))) {
                $out[] = array_pop($ops);
            }
            $ops[] = $tok;
        }
    }
    return array_merge($out, array_reverse($ops));
}

function evalRpn(array $rpn): float
{
    $st = [];
    foreach ($rpn as $t) {
        if (is_numeric($t)) {
            $st[] = (float) $t;
            continue;
        }
        $b = array_pop($st);
        $a = array_pop($st);
        $st[] = match ($t) { '+' => $a + $b, '-' => $a - $b, '*' => $a * $b, '/' => $a / $b, '^' => $a ** $b };
    }
    return $st[0];
}

foreach (['3 + 4 * 2 / (1 - 5) ^ 2 ^ 3', '(1 + 2) * (3 + 4)', '2 ^ 3 ^ 2'] as $e) {
    $rpn = toRpn($e);
    echo $e, ' => ', implode(' ', $rpn), ' = ', evalRpn($rpn), PHP_EOL;
}
