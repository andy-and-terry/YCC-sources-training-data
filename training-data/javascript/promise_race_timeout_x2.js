const timeout = (ms) => new Promise((_, rej) => setTimeout(() => rej(new Error("timeout")), ms));
const slow = new Promise((res) => setTimeout(() => res("done"), 50));
Promise.race([slow, timeout(10)]).catch((e) => console.log(e.message));
