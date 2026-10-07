<?php

$start = new DateTimeImmutable('2024-01-31 09:00:00', new DateTimeZone('UTC'));
$next  = $start->modify('+1 month');
echo $start->format('Y-m-d l'), "\n";
echo $next->format('Y-m-d'), "\n";

$end  = new DateTimeImmutable('2024-03-15', new DateTimeZone('UTC'));
$diff = $start->diff($end);
echo "{$diff->m} months, {$diff->d} days (total {$diff->days})\n";

$period = new DatePeriod($start, new DateInterval('P1W'), 3);
foreach ($period as $d) {
    echo $d->format('D, d M'), "\n";
}

echo $start->setTimezone(new DateTimeZone('Asia/Tokyo'))->format('H:i T'), "\n";
