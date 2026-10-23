interface User {
  id: number;
  name: string;
  email: string;
  isAdmin: boolean;
}

type PublicUser = Omit<User, "email" | "isAdmin">;
type UserSummary = Pick<User, "id" | "name">;
type RolePermissions = Record<"admin" | "editor" | "viewer", string[]>;

const user: User = { id: 1, name: "Ada", email: "ada@example.com", isAdmin: true };

const publicUser: PublicUser = { id: user.id, name: user.name };
const summary: UserSummary = { id: user.id, name: user.name };
const permissions: RolePermissions = {
  admin: ["read", "write", "delete"],
  editor: ["read", "write"],
  viewer: ["read"],
};

console.log(publicUser, summary);
console.log(permissions.editor.join(","));
