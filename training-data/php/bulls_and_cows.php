<?php
// Bulls and Cows scoring for equal-length digit strings.
function score(string $secret, string $guess): array {
    $bulls = 0;
    $sc = $gc = [];
    for ($i = 0; $i < strlen($secret); $i++) {
        if ($secret[$i] === $guess[$i]) {
            $bulls++;
        } else {
            $sc[$secret[$i]] = ($sc[$secret[$i]] ?? 0) + 1;
            $gc[$guess[$i]] = ($gc[$guess[$i]] ?? 0) + 1;
        }
    }
    $cows = 0;
    foreach ($sc as $c => $n) {
        $cows += min($n, $gc[$c] ?? 0);
    }
    return [$bulls, $cows];
}

[$b, $c] = score("1807", "7810");
echo "$b bull(s), $c cow(s)\n";
