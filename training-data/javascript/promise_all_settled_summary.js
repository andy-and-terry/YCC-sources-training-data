const tasks = [
  Promise.resolve(1),
  Promise.reject(new Error("boom")),
  new Promise((r) => setTimeout(() => r(3), 10)),
];

Promise.allSettled(tasks).then((results) => {
  const ok = results.filter((r) => r.status === "fulfilled").map((r) => r.value);
  const failed = results.filter((r) => r.status === "rejected").map((r) => r.reason.message);
  console.log({ ok, failed });
});
