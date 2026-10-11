<?php

$list = new SplDoublyLinkedList();
foreach ([10, 20, 30] as $v) {
    $list->push($v);
}
$list->unshift(5);
$list->add(2, 15);

$list->setIteratorMode(SplDoublyLinkedList::IT_MODE_FIFO);
foreach ($list as $i => $v) {
    echo "$i:$v ";
}
echo "\n";

$list->setIteratorMode(SplDoublyLinkedList::IT_MODE_LIFO);
foreach ($list as $v) {
    echo "$v ";
}
echo "\n";
echo 'top=' . $list->top() . ' bottom=' . $list->bottom() . "\n";
