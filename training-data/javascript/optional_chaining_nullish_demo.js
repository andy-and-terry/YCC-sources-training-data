const user = { profile: { name: "Ada", tags: null } };
console.log(user.profile?.name ?? "anon");
console.log(user.settings?.theme ?? "default");
console.log(user.profile.tags?.[0] ?? "none");
console.log(user.greet?.() ?? "no greet");
