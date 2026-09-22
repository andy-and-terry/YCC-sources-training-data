<?php

// A self-balancing binary search tree (AVL tree): after every insert, the
// tree is rebalanced with single/double rotations so the height
// difference between left and right subtrees never exceeds 1.

class AvlNode
{
    public ?AvlNode $left = null;
    public ?AvlNode $right = null;
    public int $height = 1;

    public function __construct(public int $value)
    {
    }
}

class AvlTree
{
    private ?AvlNode $root = null;

    public function insert(int $value): void
    {
        $this->root = $this->insertNode($this->root, $value);
    }

    private function nodeHeight(?AvlNode $node): int
    {
        return $node?->height ?? 0;
    }

    private function balanceFactor(?AvlNode $node): int
    {
        if ($node === null) {
            return 0;
        }
        return $this->nodeHeight($node->left) - $this->nodeHeight($node->right);
    }

    private function updateHeight(AvlNode $node): void
    {
        $node->height = 1 + max($this->nodeHeight($node->left), $this->nodeHeight($node->right));
    }

    private function rotateRight(AvlNode $y): AvlNode
    {
        $x = $y->left;
        $t2 = $x->right;
        $x->right = $y;
        $y->left = $t2;
        $this->updateHeight($y);
        $this->updateHeight($x);
        return $x;
    }

    private function rotateLeft(AvlNode $x): AvlNode
    {
        $y = $x->right;
        $t2 = $y->left;
        $y->left = $x;
        $x->right = $t2;
        $this->updateHeight($x);
        $this->updateHeight($y);
        return $y;
    }

    private function insertNode(?AvlNode $node, int $value): AvlNode
    {
        if ($node === null) {
            return new AvlNode($value);
        }

        if ($value < $node->value) {
            $node->left = $this->insertNode($node->left, $value);
        } elseif ($value > $node->value) {
            $node->right = $this->insertNode($node->right, $value);
        } else {
            return $node;
        }

        $this->updateHeight($node);
        $balance = $this->balanceFactor($node);

        if ($balance > 1 && $value < $node->left->value) {
            return $this->rotateRight($node);
        }
        if ($balance < -1 && $value > $node->right->value) {
            return $this->rotateLeft($node);
        }
        if ($balance > 1 && $value > $node->left->value) {
            $node->left = $this->rotateLeft($node->left);
            return $this->rotateRight($node);
        }
        if ($balance < -1 && $value < $node->right->value) {
            $node->right = $this->rotateRight($node->right);
            return $this->rotateLeft($node);
        }

        return $node;
    }

    public function inorder(): array
    {
        $result = [];
        $this->inorderNode($this->root, $result);
        return $result;
    }

    private function inorderNode(?AvlNode $node, array &$result): void
    {
        if ($node === null) {
            return;
        }
        $this->inorderNode($node->left, $result);
        $result[] = $node->value;
        $this->inorderNode($node->right, $result);
    }

    public function rootValue(): ?int
    {
        return $this->root?->value;
    }

    public function height(): int
    {
        return $this->nodeHeight($this->root);
    }
}

$tree = new AvlTree();
foreach ([10, 20, 30, 40, 50, 25] as $value) {
    $tree->insert($value);
}

echo implode(',', $tree->inorder()) . "\n";
echo "root: {$tree->rootValue()}, height: {$tree->height()}\n";
