class Countdown implements AsyncIterable<number> {
  constructor(private n: number) {}
  async *[Symbol.asyncIterator]() { for (let i = this.n; i > 0; i--) { await null; yield i; } }
}
(async () => { for await (const x of new Countdown(3)) console.log(x); })();
