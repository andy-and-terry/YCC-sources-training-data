function pluck<T, K extends keyof T>(items: T[], key: K): T[K][] {
    return items.map((item) => item[key]);
}

function pick<T, K extends keyof T>(obj: T, keys: K[]): Pick<T, K> {
    const result = {} as Pick<T, K>;
    for (const k of keys) {
        result[k] = obj[k];
    }
    return result;
}

interface Person {
    name: string;
    age: number;
    email: string;
}

const people: Person[] = [
    { name: "Ada", age: 36, email: "ada@example.com" },
    { name: "Bob", age: 41, email: "bob@example.com" },
];

const ages: number[] = pluck(people, "age");
console.log(ages);
console.log(pick(people[0], ["name", "email"]));
