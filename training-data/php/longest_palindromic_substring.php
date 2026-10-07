<?php

function longestPalindrome(string $s): string
{
    if ($s === '') {
        return '';
    }

    $start = 0;
    $maxLength = 1;

    $expand = function (int $left, int $right) use ($s): array {
        while ($left >= 0 && $right < strlen($s) && $s[$left] === $s[$right]) {
            $left--;
            $right++;
        }
        return [$left + 1, $right - $left - 1];
    };

    for ($i = 0; $i < strlen($s); $i++) {
        [$oddStart, $oddLength] = $expand($i, $i);
        if ($oddLength > $maxLength) {
            [$start, $maxLength] = [$oddStart, $oddLength];
        }

        [$evenStart, $evenLength] = $expand($i, $i + 1);
        if ($evenLength > $maxLength) {
            [$start, $maxLength] = [$evenStart, $evenLength];
        }
    }

    return substr($s, $start, $maxLength);
}

echo longestPalindrome('babad') . "\n";
echo longestPalindrome('cbbd') . "\n";
echo longestPalindrome('racecarxyz') . "\n";
