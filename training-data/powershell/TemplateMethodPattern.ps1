class ReportGenerator {
    [string] Generate() {
        $header = $this.BuildHeader()
        $body = $this.BuildBody()
        return "$header`n$body`n--- end of report ---"
    }
    [string] BuildHeader() { throw "must override BuildHeader" }
    [string] BuildBody() { throw "must override BuildBody" }
}

class SalesReport : ReportGenerator {
    [string] BuildHeader() { return "Sales Report" }
    [string] BuildBody() { return 'Total sales: $1000' }
}

class InventoryReport : ReportGenerator {
    [string] BuildHeader() { return "Inventory Report" }
    [string] BuildBody() { return "Items in stock: 42" }
}

$reports = @([SalesReport]::new(), [InventoryReport]::new())
foreach ($report in $reports) {
    $report.Generate()
}
