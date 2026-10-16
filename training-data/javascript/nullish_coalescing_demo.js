const config = { retries: 0, name: "", debug: false, timeout: null };

console.log(config.retries || 3, config.retries ?? 3);
console.log(config.name || "anon", config.name ?? "anon");
console.log(config.debug || true, config.debug ?? true);
console.log(config.timeout ?? 5000, config.missing ?? "default");

let cache;
cache ??= new Map();
cache.set("k", 1);
console.log(cache.size);

const user = { profile: null };
console.log(user.profile?.email ?? "no email");
console.log((null ?? undefined) ?? "both nullish");
