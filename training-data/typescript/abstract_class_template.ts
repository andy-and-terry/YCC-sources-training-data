abstract class Report {
  generate(): string {
    return [this.header(), ...this.rows().map((r) => this.formatRow(r)), this.footer()].join("\n");
  }

  protected abstract header(): string;
  protected abstract rows(): string[][];

  protected formatRow(row: string[]): string {
    return row.join(" | ");
  }

  protected footer(): string {
    return `(${this.rows().length} rows)`;
  }
}

class SalesReport extends Report {
  protected header(): string {
    return "== Sales ==";
  }

  protected rows(): string[][] {
    return [
      ["north", "120"],
      ["south", "95"],
    ];
  }
}

class CsvReport extends Report {
  protected header(): string {
    return "region,total";
  }

  protected rows(): string[][] {
    return [["east", "70"]];
  }

  protected formatRow(row: string[]): string {
    return row.join(",");
  }

  protected footer(): string {
    return "";
  }
}

const reports: Report[] = [new SalesReport(), new CsvReport()];
for (const r of reports) {
  console.log(r.generate());
}
