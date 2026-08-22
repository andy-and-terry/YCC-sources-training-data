<?php

class TrieNode
{
    public array $children = [];
    public bool $isWord = false;
}

class Trie
{
    private TrieNode $root;

    public function __construct()
    {
        $this->root = new TrieNode();
    }

    public function insert(string $word): void
    {
        $node = $this->root;
        foreach (str_split($word) as $ch) {
            if (!isset($node->children[$ch])) {
                $node->children[$ch] = new TrieNode();
            }
            $node = $node->children[$ch];
        }
        $node->isWord = true;
    }

    private function find(string $s): ?TrieNode
    {
        $node = $this->root;
        foreach (str_split($s) as $ch) {
            if (!isset($node->children[$ch])) {
                return null;
            }
            $node = $node->children[$ch];
        }
        return $node;
    }

    public function search(string $word): bool
    {
        $node = $this->find($word);
        return $node !== null && $node->isWord;
    }

    public function startsWith(string $prefix): bool
    {
        return $this->find($prefix) !== null;
    }
}

$trie = new Trie();
foreach (['cat', 'car', 'card', 'care'] as $word) {
    $trie->insert($word);
}
var_dump($trie->search('car'), $trie->search('ca'), $trie->startsWith('ca'));
