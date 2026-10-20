class PubSub {
  constructor() { this.subs = new Map(); }
  on(topic, fn) { (this.subs.get(topic) ?? this.subs.set(topic, []).get(topic)).push(fn); }
  emit(topic, data) {
    for (const [t, fns] of this.subs) {
      const re = new RegExp("^" + t.replace(/\*/g, "[^.]+") + "$");
      if (re.test(topic)) fns.forEach((f) => f(data, topic));
    }
  }
}
const ps = new PubSub();
ps.on("user.*", (d, t) => console.log(t, d));
ps.emit("user.login", { id: 1 });
