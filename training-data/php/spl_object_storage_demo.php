<?php

class Session
{
    public function __construct(public string $user) {}
}

$storage = new SplObjectStorage();
$a = new Session('alice');
$b = new Session('bob');

$storage->attach($a, ['logins' => 3]);
$storage->attach($b, ['logins' => 1]);
$storage->attach($a, ['logins' => 4]); // same object: data replaced

echo count($storage), " sessions\n";
foreach ($storage as $i => $session) {
    echo $session->user, ' => ', $storage[$session]['logins'], "\n";
}
var_dump($storage->contains($b));
$storage->detach($b);
echo count($storage), " left\n";
