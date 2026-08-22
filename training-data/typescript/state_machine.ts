type State = "idle" | "loading" | "success" | "error";

interface Transition<E extends string> {
  from: State;
  event: E;
  to: State;
}

class StateMachine<E extends string> {
  private current: State;
  private transitions: Transition<E>[];
  private listeners: Array<(from: State, to: State, event: E) => void> = [];

  constructor(initial: State, transitions: Transition<E>[]) {
    this.current = initial;
    this.transitions = transitions;
  }

  get state(): State {
    return this.current;
  }

  onTransition(listener: (from: State, to: State, event: E) => void): void {
    this.listeners.push(listener);
  }

  send(event: E): boolean {
    const transition = this.transitions.find(
      (t) => t.from === this.current && t.event === event
    );
    if (!transition) return false;

    const from = this.current;
    this.current = transition.to;
    for (const listener of this.listeners) {
      listener(from, this.current, event);
    }
    return true;
  }

  can(event: E): boolean {
    return this.transitions.some(
      (t) => t.from === this.current && t.event === event
    );
  }
}

type FetchEvent = "FETCH" | "RESOLVE" | "REJECT" | "RETRY";

const fetchMachine = new StateMachine<FetchEvent>("idle", [
  { from: "idle", event: "FETCH", to: "loading" },
  { from: "loading", event: "RESOLVE", to: "success" },
  { from: "loading", event: "REJECT", to: "error" },
  { from: "error", event: "RETRY", to: "loading" },
]);

fetchMachine.onTransition((from, to, event) =>
  console.log(`${from} --${event}--> ${to}`)
);
fetchMachine.send("FETCH");
fetchMachine.send("REJECT");
fetchMachine.send("RETRY");
