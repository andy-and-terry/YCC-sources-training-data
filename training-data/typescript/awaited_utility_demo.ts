async function fetchUser(): Promise<{ id: number; name: string }> {
  return { id: 1, name: "Ada" };
}

type User = Awaited<ReturnType<typeof fetchUser>>;
type Nested = Awaited<Promise<Promise<string>>>;

async function loadAll<T extends readonly unknown[]>(
  ...tasks: { [K in keyof T]: Promise<T[K]> }
): Promise<T> {
  return (await Promise.all(tasks)) as unknown as T;
}

async function main(): Promise<void> {
  const user: User = await fetchUser();
  const nested: Nested = "flattened";
  const [n, s] = await loadAll(Promise.resolve(42), Promise.resolve("text"));
  console.log(user.name, nested, n + 1, s.toUpperCase());
}

void main();
