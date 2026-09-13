<?php

interface Logger
{
    public function log(string $message): void;
}

class ConsoleLogger implements Logger
{
    public function log(string $message): void
    {
        echo "[console] $message\n";
    }
}

class NullLogger implements Logger
{
    public function log(string $message): void
    {
    }
}

class ReportGenerator
{
    private function __construct(private Logger $logger, private string $title)
    {
    }

    public static function create(string $title, ?Logger $logger = null): self
    {
        return new self($logger ?? new NullLogger(), $title);
    }

    public function generate(): void
    {
        $this->logger->log("generating report: {$this->title}");
    }
}

$reportWithLogging = ReportGenerator::create('Sales', new ConsoleLogger());
$reportWithLogging->generate();

$silentReport = ReportGenerator::create('Internal');
$silentReport->generate();
echo "done\n";
