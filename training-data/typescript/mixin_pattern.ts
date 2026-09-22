type Constructor<T = {}> = new (...args: any[]) => T;

function Timestamped<TBase extends Constructor>(Base: TBase) {
  return class extends Base {
    createdAt = new Date();
  };
}

function Serializable<TBase extends Constructor>(Base: TBase) {
  return class extends Base {
    serialize(): string {
      return JSON.stringify(this);
    }
  };
}

class Task {
  constructor(public title: string) {}
}

const TrackedTask = Serializable(Timestamped(Task));

const task = new TrackedTask("write mixin demo");
console.log(task.title, task.createdAt instanceof Date, task.serialize().includes("title"));
