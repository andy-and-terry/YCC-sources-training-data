<?php

class QueryBuilder
{
    protected array $parts = [];

    public function select(string ...$cols): static
    {
        $this->parts['select'] = implode(', ', $cols);
        return $this;
    }

    public function from(string $table): static
    {
        $this->parts['from'] = $table;
        return $this;
    }

    public function where(string $cond): static
    {
        $this->parts['where'][] = $cond;
        return $this;
    }

    public function __toString(): string
    {
        $sql = "SELECT {$this->parts['select']} FROM {$this->parts['from']}";
        if (!empty($this->parts['where'])) {
            $sql .= ' WHERE ' . implode(' AND ', $this->parts['where']);
        }
        return $sql;
    }
}

echo (new QueryBuilder())->select('id', 'name')->from('users')->where('age > 18')->where("active = 1") . "\n";
