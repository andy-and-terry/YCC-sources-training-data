<?php

function exists(array $board, string $word): bool
{
    $rows = count($board);
    $cols = count($board[0]);
    $dfs = function (int $r, int $c, int $i) use (&$dfs, &$board, $word, $rows, $cols): bool {
        if ($i === strlen($word)) {
            return true;
        }
        if ($r < 0 || $c < 0 || $r >= $rows || $c >= $cols || $board[$r][$c] !== $word[$i]) {
            return false;
        }
        $saved = $board[$r][$c];
        $board[$r][$c] = '#';
        $found = $dfs($r + 1, $c, $i + 1) || $dfs($r - 1, $c, $i + 1) || $dfs($r, $c + 1, $i + 1) || $dfs($r, $c - 1, $i + 1);
        $board[$r][$c] = $saved;
        return $found;
    };
    for ($r = 0; $r < $rows; $r++) {
        for ($c = 0; $c < $cols; $c++) {
            if ($dfs($r, $c, 0)) {
                return true;
            }
        }
    }
    return false;
}

$board = array_map('str_split', ['ABCE', 'SFCS', 'ADEE']);
foreach (['ABCCED', 'SEE', 'ABCB'] as $w) {
    echo $w, ': ', exists($board, $w) ? 'yes' : 'no', PHP_EOL;
}
