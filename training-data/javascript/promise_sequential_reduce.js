const jobs = [1, 2, 3].map((n) => () => new Promise((r) => setTimeout(() => r(n * 10), 5)));
jobs.reduce((p, job) => p.then((acc) => job().then((v) => [...acc, v])), Promise.resolve([])).then(console.log);
