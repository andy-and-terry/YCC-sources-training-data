const u = new URL("https://example.com/search?q=a+b");
u.searchParams.append("page", "2");
u.searchParams.set("q", "hello world");
console.log(u.href, [...u.searchParams.keys()]);
