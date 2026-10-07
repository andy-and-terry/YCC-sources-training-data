<?php

function solveMaze(array $maze): array
{
    $n = count($maze);
    $paths = [];
    $seen = [];
    $moves = ['D' => [1, 0], 'L' => [0, -1], 'R' => [0, 1], 'U' => [-1, 0]];
    $dfs = function (int $r, int $c, string $path) use (&$dfs, &$paths, &$seen, $maze, $n, $moves): void {
        if ($r === $n - 1 && $c === $n - 1) {
            $paths[] = $path;
            return;
        }
        $seen["$r,$c"] = true;
        foreach ($moves as $dir => [$dr, $dc]) {
            [$nr, $nc] = [$r + $dr, $c + $dc];
            if ($nr >= 0 && $nc >= 0 && $nr < $n && $nc < $n && $maze[$nr][$nc] === 1 && !isset($seen["$nr,$nc"])) {
                $dfs($nr, $nc, $path . $dir);
            }
        }
        unset($seen["$r,$c"]);
    };
    if ($maze[0][0] === 1) {
        $dfs(0, 0, '');
    }
    return $paths;
}

$maze = [
    [1, 0, 0, 0],
    [1, 1, 0, 1],
    [1, 1, 0, 0],
    [0, 1, 1, 1],
];
echo implode(' ', solveMaze($maze)), PHP_EOL;
