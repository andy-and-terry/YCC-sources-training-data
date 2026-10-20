async function load(): Promise<[number, string]> {
  const [n, s] = await Promise.all([Promise.resolve(1), Promise.resolve("a")]);
  return [n, s];
}
load().then(([n, s]) => console.log(n + 1, s.toUpperCase()));
