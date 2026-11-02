const tasks = [Promise.resolve(1), Promise.reject(new Error("bad")), Promise.resolve(3)];
Promise.allSettled(tasks).then((rs) => {
  for (const r of rs) console.log(r.status, r.value ?? r.reason.message);
});
