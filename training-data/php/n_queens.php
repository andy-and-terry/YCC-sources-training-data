<?php

function solveNQueens(int $n): array
{
    $solutions = [];
    $cols = [];

    $isSafe = function (array $cols, int $row, int $col) {
        foreach ($cols as $r => $c) {
            if ($c === $col || abs($c - $col) === abs($r - $row)) {
                return false;
            }
        }
        return true;
    };

    $backtrack = function (int $row) use (&$backtrack, &$cols, &$solutions, $n, $isSafe) {
        if ($row === $n) {
            $solutions[] = $cols;
            return;
        }
        for ($col = 0; $col < $n; $col++) {
            if ($isSafe($cols, $row, $col)) {
                $cols[$row] = $col;
                $backtrack($row + 1);
                unset($cols[$row]);
            }
        }
    };

    $backtrack(0);
    return $solutions;
}

$solutions = solveNQueens(6);
echo count($solutions) . " solutions\n";
echo implode(',', $solutions[0]) . "\n";
