<?php

interface JsonExporter
{
    public function exportAsJson(): string;
}

class LegacyXmlReport
{
    public function __construct(private array $rows)
    {
    }

    public function toXml(): string
    {
        $items = array_map(
            fn ($row) => "<row><name>{$row['name']}</name><value>{$row['value']}</value></row>",
            $this->rows
        );
        return '<report>' . implode('', $items) . '</report>';
    }
}

class XmlReportAdapter implements JsonExporter
{
    public function __construct(private LegacyXmlReport $legacyReport)
    {
    }

    public function exportAsJson(): string
    {
        $xml = simplexml_load_string($this->legacyReport->toXml());
        $rows = [];
        foreach ($xml->row as $row) {
            $rows[] = ['name' => (string) $row->name, 'value' => (string) $row->value];
        }
        return json_encode($rows);
    }
}

$legacy = new LegacyXmlReport([
    ['name' => 'apples', 'value' => 5],
    ['name' => 'oranges', 'value' => 3],
]);
$adapter = new XmlReportAdapter($legacy);
echo $adapter->exportAsJson() . "\n";
