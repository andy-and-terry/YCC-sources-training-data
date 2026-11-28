abstract class Job {
  run() {
    this.setup();
    console.log(this.execute());
  }
  protected setup() { console.log("setup"); }
  protected abstract execute(): string;
}

class Hello extends Job {
  protected execute() { return "hello"; }
}

new Hello().run();
