interface Entity {
  id: string;
}

interface Repository<T extends Entity> {
  findById(id: string): T | undefined;
  findAll(predicate?: (item: T) => boolean): T[];
  save(item: T): void;
  delete(id: string): boolean;
}

class InMemoryRepository<T extends Entity> implements Repository<T> {
  private items = new Map<string, T>();

  findById(id: string): T | undefined {
    return this.items.get(id);
  }

  findAll(predicate?: (item: T) => boolean): T[] {
    const all = [...this.items.values()];
    return predicate ? all.filter(predicate) : all;
  }

  save(item: T): void {
    this.items.set(item.id, item);
  }

  delete(id: string): boolean {
    return this.items.delete(id);
  }
}

interface User extends Entity {
  name: string;
  email: string;
  active: boolean;
}

class UserService {
  constructor(private repo: Repository<User>) {}

  register(id: string, name: string, email: string): User {
    const user: User = { id, name, email, active: true };
    this.repo.save(user);
    return user;
  }

  deactivate(id: string): boolean {
    const user = this.repo.findById(id);
    if (!user) return false;
    this.repo.save({ ...user, active: false });
    return true;
  }

  activeUsers(): User[] {
    return this.repo.findAll((u) => u.active);
  }
}

const service = new UserService(new InMemoryRepository<User>());
service.register("1", "Alice", "alice@example.com");
service.register("2", "Bob", "bob@example.com");
service.deactivate("2");
console.log(service.activeUsers());
