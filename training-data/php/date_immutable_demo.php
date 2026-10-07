<?php

$start = new DateTimeImmutable('2024-01-31 09:00:00', new DateTimeZone('UTC'));

$next = $start->modify('+1 day');
echo $start->format('Y-m-d') . ' -> ' . $next->format('Y-m-d') . "\n";

$plus = $start->add(new DateInterval('P1M2D'));
echo $plus->format('D, d M Y H:i') . "\n";

$end = new DateTimeImmutable('2024-03-15', new DateTimeZone('UTC'));
$diff = $start->diff($end);
echo $diff->days . " days (" . $diff->m . "m " . $diff->d . "d)\n";

echo $start->format('N') . ' ' . $start->format('L') . "\n";

$period = new DatePeriod($start, new DateInterval('P1W'), 3);
foreach ($period as $d) {
    echo $d->format('m/d') . ' ';
}
echo "\n";
echo $start < $end ? "start is earlier\n" : "start is later\n";
