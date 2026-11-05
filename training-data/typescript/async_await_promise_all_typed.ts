const delay = <T>(v: T, ms: number): Promise<T> =>
  new Promise(res => setTimeout(() => res(v), ms));

async function main() {
  const [a, b, c] = await Promise.all([delay(1, 10), delay("two", 5), delay(true, 1)]);
  console.log(a + 1, b.toUpperCase(), !c);
}
main();
