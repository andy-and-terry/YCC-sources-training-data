const tasks = [Promise.resolve(1), Promise.reject(new Error("boom")), Promise.resolve(3)];

Promise.allSettled(tasks).then((rs) => {
  for (const r of rs) {
    console.log(r.status, r.status === "fulfilled" ? r.value : r.reason.message);
  }
});
