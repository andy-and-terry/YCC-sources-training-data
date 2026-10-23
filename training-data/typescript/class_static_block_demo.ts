class Registry {
    static readonly items = new Map<string, number>();
    static count = 0;

    // runs once when the class is defined
    static {
        Registry.items.set("alpha", 1);
        Registry.items.set("beta", 2);
        Registry.count = Registry.items.size;
    }

    static lookup(key: string): number | undefined {
        return Registry.items.get(key);
    }
}

console.log(Registry.count);
console.log(Registry.lookup("beta"));
console.log(Registry.lookup("gamma"));
