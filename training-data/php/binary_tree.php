<?php

class TreeNode
{
    public int $value;
    public ?TreeNode $left = null;
    public ?TreeNode $right = null;

    public function __construct(int $value)
    {
        $this->value = $value;
    }
}

class BinaryTree
{
    private ?TreeNode $root = null;

    public function insert(int $value): void
    {
        $this->root = $this->insertNode($this->root, $value);
    }

    private function insertNode(?TreeNode $node, int $value): TreeNode
    {
        if ($node === null) {
            return new TreeNode($value);
        }
        if ($value < $node->value) {
            $node->left = $this->insertNode($node->left, $value);
        } else {
            $node->right = $this->insertNode($node->right, $value);
        }
        return $node;
    }

    public function inOrder(): array
    {
        $result = [];
        $this->inOrderVisit($this->root, $result);
        return $result;
    }

    private function inOrderVisit(?TreeNode $node, array &$result): void
    {
        if ($node === null) {
            return;
        }
        $this->inOrderVisit($node->left, $result);
        $result[] = $node->value;
        $this->inOrderVisit($node->right, $result);
    }
}

$tree = new BinaryTree();
foreach ([5, 3, 8, 1, 4, 7, 9] as $v) {
    $tree->insert($v);
}
print_r($tree->inOrder());
