<?php
$pdo = new PDO('sqlite::memory:');
$pdo->exec('CREATE TABLE t (id INTEGER PRIMARY KEY, name TEXT)');
$st = $pdo->prepare('INSERT INTO t (name) VALUES (:n)');
foreach (['a', 'b'] as $n) $st->execute([':n' => $n]);
foreach ($pdo->query('SELECT * FROM t') as $row) echo $row['id'], $row['name'], "\n";
