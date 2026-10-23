interface Repository<T extends { id: number }> {
  add(item: T): void;
  get(id: number): T | undefined;
  all(): readonly T[];
}

class InMemoryRepository<T extends { id: number }> implements Repository<T> {
  private items = new Map<number, T>();

  add(item: T): void {
    this.items.set(item.id, item);
  }

  get(id: number): T | undefined {
    return this.items.get(id);
  }

  all(): readonly T[] {
    return [...this.items.values()];
  }
}

const repo = new InMemoryRepository<{ id: number; title: string }>();
repo.add({ id: 1, title: "first" });
repo.add({ id: 2, title: "second" });
console.log(repo.get(2)?.title, repo.all().length);
