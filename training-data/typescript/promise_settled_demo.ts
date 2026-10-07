function fetchUser(id: number): Promise<{ id: number; name: string }> {
  return id % 2 === 0
    ? Promise.resolve({ id, name: `user${id}` })
    : Promise.reject(new Error(`user ${id} not found`));
}

async function main(): Promise<void> {
  const results = await Promise.allSettled([1, 2, 3, 4].map(fetchUser));

  for (const r of results) {
    if (r.status === "fulfilled") {
      console.log("ok:", r.value.name);
    } else {
      console.log("failed:", (r.reason as Error).message);
    }
  }

  const succeeded = results.filter(
    (r): r is PromiseFulfilledResult<{ id: number; name: string }> => r.status === "fulfilled",
  );
  console.log(succeeded.map((r) => r.value.id));

  const first = await Promise.any([fetchUser(1), fetchUser(2), fetchUser(3)]);
  console.log("first success:", first.name);
}

main();
