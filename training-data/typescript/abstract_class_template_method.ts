abstract class Report {
  run(): string { return [this.header(), this.body(), "--"].join("\n"); }
  protected abstract header(): string;
  protected abstract body(): string;
}
class Sales extends Report {
  protected header() { return "SALES"; }
  protected body() { return "total: 10"; }
}
console.log(new Sales().run());
