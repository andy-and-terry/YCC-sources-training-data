abstract class Report {
  run(): string {
    return [this.header(), this.body(), this.footer()].join("\n");
  }
  protected header() { return "== report =="; }
  protected abstract body(): string;
  protected footer() { return "== end =="; }
}

class Sales extends Report {
  protected body() { return "sales: 42"; }
}

console.log(new Sales().run());
