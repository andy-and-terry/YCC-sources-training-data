<?php
$d = new DateTimeImmutable('2024-01-31', new DateTimeZone('UTC'));
echo $d->modify('+1 month')->format('Y-m-d'), PHP_EOL;
echo $d->add(new DateInterval('P1W2D'))->format('D, d M Y'), PHP_EOL;
$diff = $d->diff(new DateTimeImmutable('2024-12-25', new DateTimeZone('UTC')));
echo $diff->m, 'm ', $diff->d, 'd total ', $diff->days, PHP_EOL;
foreach (new DatePeriod($d, new DateInterval('P1D'), 2) as $day) echo $day->format('md '), '';
echo PHP_EOL, $d->format('N jS z t L'), PHP_EOL;
