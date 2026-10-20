const tasks = [Promise.resolve(1), Promise.reject(new Error("bad")), Promise.resolve(3)];
Promise.allSettled(tasks).then((results) => {
  for (const r of results) {
    console.log(r.status, r.status === "fulfilled" ? r.value : r.reason.message);
  }
});
