class Singleton {
  private static instance: Singleton | null = null;
  value: number;

  private constructor(value: number) {
    this.value = value;
  }

  static getInstance(value: number): Singleton {
    if (!Singleton.instance) {
      Singleton.instance = new Singleton(value);
    }
    return Singleton.instance;
  }
}

const a = Singleton.getInstance(1);
const b = Singleton.getInstance(2);
console.log(a === b, a.value, b.value);
