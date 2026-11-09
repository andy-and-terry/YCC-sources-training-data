async function fetchNum(n: number): Promise<number> {
  return new Promise(res => setTimeout(() => res(n * 2), 10));
}

async function main(): Promise<void> {
  const rs: number[] = await Promise.all([1, 2, 3].map(fetchNum));
  console.log(rs);
}
main();
