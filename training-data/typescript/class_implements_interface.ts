interface Logger { log(m: string): void }
class Console implements Logger { log(m: string) { console.log("[c]", m); } }
class Prefixed implements Logger { constructor(private inner: Logger, private p: string) {} log(m: string) { this.inner.log(this.p + m); } }
new Prefixed(new Console(), "> ").log("hi");
