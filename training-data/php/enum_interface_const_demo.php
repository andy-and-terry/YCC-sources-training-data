<?php

interface HasLabel
{
    public function label(): string;
}

enum Status: string implements HasLabel
{
    case Draft = 'draft';
    case Published = 'published';
    case Archived = 'archived';

    const DEFAULT = self::Draft;

    public function label(): string
    {
        return ucfirst($this->value);
    }

    public function canEdit(): bool
    {
        return $this === self::Draft;
    }

    public static function fromLabel(string $label): self
    {
        return self::from(strtolower($label));
    }
}

echo Status::DEFAULT->label() . "\n";
echo Status::fromLabel('Published')->name . "\n";
echo json_encode(array_map(fn(Status $s) => $s->canEdit(), Status::cases())) . "\n";
echo var_export(Status::tryFrom('gone'), true) . "\n";
echo Status::Archived instanceof HasLabel ? "has label\n" : "no label\n";
