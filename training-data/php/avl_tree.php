<?php

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
        return $node === null ? 0 : $node->height;
    }

    private function balanceFactor(?AvlNode $node): int
    {
        return $node === null ? 0 : $this->nodeHeight($node->left) - $this->nodeHeight($node->right);
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

    public function inOrder(): array
    {
        $result = [];
        $this->inOrderNode($this->root, $result);
        return $result;
    }

    private function inOrderNode(?AvlNode $node, array &$result): void
    {
        if ($node === null) {
            return;
        }
        $this->inOrderNode($node->left, $result);
        $result[] = $node->value;
        $this->inOrderNode($node->right, $result);
    }

    public function height(): int
    {
        return $this->nodeHeight($this->root);
    }
}

$tree = new AvlTree();
foreach ([10, 20, 30, 40, 50, 25] as $v) {
    $tree->insert($v);
}
echo implode(',', $tree->inOrder()) . "\n";
echo "height: " . $tree->height() . "\n";
