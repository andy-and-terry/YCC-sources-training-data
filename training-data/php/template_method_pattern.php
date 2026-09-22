<?php

abstract class DataExporter
{
    final public function export(array $rows): string
    {
        $header = $this->formatHeader();
        $body = implode($this->rowSeparator(), array_map(fn ($row) => $this->formatRow($row), $rows));
        return $header . $body;
    }

    abstract protected function formatHeader(): string;
    abstract protected function formatRow(array $row): string;

    protected function rowSeparator(): string
    {
        return "\n";
    }
}

class CsvExporter extends DataExporter
{
    protected function formatHeader(): string
    {
        return "name,age\n";
    }

    protected function formatRow(array $row): string
    {
        return "{$row['name']},{$row['age']}";
    }
}

class JsonLinesExporter extends DataExporter
{
    protected function formatHeader(): string
    {
        return '';
    }

    protected function formatRow(array $row): string
    {
        return json_encode($row);
    }
}

$rows = [['name' => 'Alice', 'age' => 30], ['name' => 'Bob', 'age' => 25]];
echo (new CsvExporter())->export($rows) . "\n";
echo (new JsonLinesExporter())->export($rows) . "\n";
