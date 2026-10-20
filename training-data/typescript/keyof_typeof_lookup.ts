const ROLES = { admin: 1, user: 2 } as const;
type Role = keyof typeof ROLES;
const lvl = (r: Role) => ROLES[r];
console.log(lvl("admin"));
