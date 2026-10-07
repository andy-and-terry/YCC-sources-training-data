class DataExporter {
  export(records) {
    const header = this.formatHeader();
    const rows = records.map((r) => this.formatRow(r));
    return this.combine(header, rows);
  }
  formatHeader() {
    throw new Error('not implemented');
  }
  formatRow() {
    throw new Error('not implemented');
  }
  combine(header, rows) {
    return [header, ...rows].join('\n');
  }
}

class CsvExporter extends DataExporter {
  formatHeader() {
    return 'name,age';
  }
  formatRow(record) {
    return `${record.name},${record.age}`;
  }
}

class MarkdownExporter extends DataExporter {
  formatHeader() {
    return '| name | age |\n| --- | --- |';
  }
  formatRow(record) {
    return `| ${record.name} | ${record.age} |`;
  }
}

const records = [
  { name: 'Alice', age: 30 },
  { name: 'Bob', age: 25 },
];

console.log(new CsvExporter().export(records));
console.log(new MarkdownExporter().export(records));
module.exports = { DataExporter, CsvExporter, MarkdownExporter };
