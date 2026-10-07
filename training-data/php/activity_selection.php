<?php

function activitySelection(array $activities): array
{
    usort($activities, fn(array $a, array $b) => $a[1] <=> $b[1]);

    $selected = [$activities[0]];
    $lastEnd = $activities[0][1];
    for ($i = 1; $i < count($activities); $i++) {
        [$start, $end] = $activities[$i];
        if ($start >= $lastEnd) {
            $selected[] = $activities[$i];
            $lastEnd = $end;
        }
    }
    return $selected;
}

$activities = [[1, 4], [3, 5], [0, 6], [5, 7], [3, 9], [5, 9], [6, 10], [8, 11], [8, 12], [2, 14], [12, 16]];
foreach (activitySelection($activities) as [$start, $end]) {
    echo "[$start,$end] ";
}
echo "\n";
