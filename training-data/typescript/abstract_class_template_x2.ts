abstract class Job {
  run(): void { this.setup(); this.exec(); }
  protected setup(): void { console.log("setup"); }
  protected abstract exec(): void;
}
new (class extends Job { protected exec() { console.log("exec"); } })().run();
