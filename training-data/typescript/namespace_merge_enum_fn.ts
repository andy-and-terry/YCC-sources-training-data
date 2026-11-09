function greet(n: string) { return `${greet.prefix} ${n}`; }
namespace greet { export let prefix = "Hello,"; }
console.log(greet("Ann"));
