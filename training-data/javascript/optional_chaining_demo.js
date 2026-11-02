const user = { profile: { address: null } };
console.log(user.profile?.address?.city ?? "unknown");
console.log(user.settings?.theme ?? "default");
