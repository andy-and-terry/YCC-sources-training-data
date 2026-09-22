abstract class DataExporter {
  export(records: Record<string, unknown>[]): string {
    const header = this.formatHeader(records);
    const rows = records.map((r) => this.formatRow(r));
    return this.assemble(header, rows);
  }

  protected abstract formatHeader(records: Record<string, unknown>[]): string;
  protected abstract formatRow(record: Record<string, unknown>): string;

  protected assemble(header: string, rows: string[]): string {
    return [header, ...rows].join("\n");
  }
}

class CsvExporter extends DataExporter {
  protected formatHeader(records: Record<string, unknown>[]): string {
    return Object.keys(records[0] ?? {}).join(",");
  }

  protected formatRow(record: Record<string, unknown>): string {
    return Object.values(record).join(",");
  }
}

class MarkdownTableExporter extends DataExporter {
  protected formatHeader(records: Record<string, unknown>[]): string {
    const keys = Object.keys(records[0] ?? {});
    return `${keys.join(" | ")}\n${keys.map(() => "---").join(" | ")}`;
  }

  protected formatRow(record: Record<string, unknown>): string {
    return Object.values(record).join(" | ");
  }
}

const rows = [
  { name: "Ada", age: 36 },
  { name: "Bob", age: 29 },
];

console.log(new CsvExporter().export(rows));
console.log("---");
console.log(new MarkdownTableExporter().export(rows));
