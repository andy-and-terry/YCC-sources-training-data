const delay = (ms, v, fail) => new Promise((res, rej) => setTimeout(() => (fail ? rej(new Error(v)) : res(v)), ms));
Promise.any([delay(30, "slow"), delay(10, "fast"), delay(5, "err", true)]).then(console.log);
Promise.race([delay(20, "a"), delay(10, "b")]).then(console.log);
