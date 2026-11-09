function timeout<T>(p: Promise<T>, ms: number): Promise<T> {
  const t = new Promise<never>((_, rej) => setTimeout(() => rej(new Error("timeout")), ms));
  return Promise.race([p, t]);
}
timeout(new Promise<number>(r => setTimeout(() => r(1), 100)), 20).catch(e => console.log(e.message));
