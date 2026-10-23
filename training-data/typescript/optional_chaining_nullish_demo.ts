interface Address {
    city?: string;
    zip?: string;
}

interface User {
    name: string;
    address?: Address;
    nickname?: string;
    greet?: () => string;
}

const users: User[] = [
    { name: "Ada", address: { city: "London" }, nickname: "" },
    { name: "Bob" },
    { name: "Cy", greet: () => "hi" },
];

for (const u of users) {
    const city = u.address?.city ?? "unknown";
    // ?? keeps empty strings, || would replace them
    const nick = u.nickname ?? "none";
    const nickOr = u.nickname || "none";
    console.log(u.name, city, JSON.stringify(nick), nickOr, u.greet?.());
}
