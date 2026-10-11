<?php

$start = new DateTimeImmutable('2024-01-29');
$end = new DateTimeImmutable('2024-02-05');
$period = new DatePeriod($start, new DateInterval('P1D'), $end);

foreach ($period as $day) {
    $weekend = in_array($day->format('N'), ['6', '7'], true) ? ' (weekend)' : '';
    echo $day->format('D Y-m-d') . $weekend . "\n";
}

$diff = $start->diff($end);
echo "days apart: {$diff->days}\n";
