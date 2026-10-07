<?php
$start = new DateTimeImmutable('2024-01-31', new DateTimeZone('UTC'));
$next = $start->add(new DateInterval('P1M'));
echo $next->format('Y-m-d'), "\n";
$end = new DateTimeImmutable('2024-03-15', new DateTimeZone('UTC'));
$diff = $start->diff($end);
echo $diff->days, " days, ", $diff->m, " months\n";
echo $start->modify('+1 week')->format('D, d M Y'), "\n";
