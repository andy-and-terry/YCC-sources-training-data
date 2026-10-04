<?php

$date = new DateTimeImmutable('2024-03-15 13:45:30', new DateTimeZone('UTC'));

echo $date->format('Y-m-d H:i:s'), "\n";
echo $date->format('l, jS F Y'), "\n";

$later = $date->modify('+20 days');
echo "later: ", $later->format('Y-m-d'), "\n";
echo "original unchanged: ", $date->format('Y-m-d'), "\n";

$diff = $date->diff(new DateTimeImmutable('2025-01-01', new DateTimeZone('UTC')));
echo "days until 2025: ", $diff->days, " (", $diff->m, " months, ", $diff->d, " days)\n";

$period = new DatePeriod($date, new DateInterval('P1W'), 3);
foreach ($period as $d) {
    echo "week: ", $d->format('M d'), "\n";
}

$tokyo = $date->setTimezone(new DateTimeZone('Asia/Tokyo'));
echo "Tokyo: ", $tokyo->format('H:i T'), "\n";
echo "leap year? ", $date->format('L') === '1' ? 'yes' : 'no', "\n";
