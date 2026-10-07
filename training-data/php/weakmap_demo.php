<?php

class Document
{
    public function __construct(public string $title) {}
}

$cache = new WeakMap();

$a = new Document('Report');
$b = new Document('Memo');

$cache[$a] = ['words' => 1200];
$cache[$b] = ['words' => 300];

echo "entries: ", count($cache), "\n";
echo "report words: ", $cache[$a]['words'], "\n";
echo "has memo: ", isset($cache[$b]) ? 'yes' : 'no', "\n";

unset($b);   // the object is destroyed, so its cache entry disappears
echo "entries after unset: ", count($cache), "\n";

foreach ($cache as $doc => $meta) {
    echo $doc->title, " => ", $meta['words'], "\n";
}

unset($doc);
$ref = WeakReference::create($a);
echo "alive: ", $ref->get() === null ? 'no' : 'yes', "\n";
unset($a);
echo "alive after unset: ", $ref->get() === null ? 'no' : 'yes', "\n";
