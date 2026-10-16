class Thermometer extends EventTarget {
  #temp = 20;

  set(value) {
    const old = this.#temp;
    this.#temp = value;
    this.dispatchEvent(new CustomEvent("change", { detail: { old, value } }));
  }
}

const t = new Thermometer();
const handler = (e) => console.log(`changed ${e.detail.old} -> ${e.detail.value}`);
t.addEventListener("change", handler);
t.addEventListener("change", () => console.log("once only"), { once: true });

t.set(25);
t.set(30);
t.removeEventListener("change", handler);
t.set(35);
console.log("done");
