<?php

$start = new DateTimeImmutable('2024-02-27 10:00:00', new DateTimeZone('UTC'));
$later = $start->modify('+3 days');
echo $later->format('Y-m-d l'), "\n";

$diff = $start->diff(new DateTimeImmutable('2024-12-25', new DateTimeZone('UTC')));
echo "days until Christmas: ", $diff->days, "\n";

$interval = new DateInterval('P1M2D');
echo $start->add($interval)->format('D, d M Y'), "\n";

$period = new DatePeriod($start, new DateInterval('P1W'), 3);
foreach ($period as $d) {
    echo $d->format('m/d'), " ";
}
echo "\n";
echo $start->setTimezone(new DateTimeZone('Asia/Tokyo'))->format('H:i T'), "\n";
