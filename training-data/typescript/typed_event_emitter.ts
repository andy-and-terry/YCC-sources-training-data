type UserEvents = {
  login: { userId: string };
  logout: { userId: string; reason: string };
  error: { message: string };
};

class TypedEmitter<Events extends Record<string, unknown>> {
  private listeners: { [K in keyof Events]?: Array<(payload: Events[K]) => void> } = {};

  on<K extends keyof Events>(event: K, listener: (payload: Events[K]) => void): void {
    (this.listeners[event] ??= []).push(listener);
  }

  emit<K extends keyof Events>(event: K, payload: Events[K]): void {
    for (const listener of this.listeners[event] ?? []) listener(payload);
  }
}

const emitter = new TypedEmitter<UserEvents>();

emitter.on("login", (payload) => console.log(`user ${payload.userId} logged in`));
emitter.on("logout", (payload) => console.log(`user ${payload.userId} logged out: ${payload.reason}`));
emitter.on("error", (payload) => console.log(`error: ${payload.message}`));

emitter.emit("login", { userId: "u1" });
emitter.emit("logout", { userId: "u1", reason: "timeout" });
// emitter.emit("login", { reason: "bad" }); // compile-time error: wrong payload shape for "login"
