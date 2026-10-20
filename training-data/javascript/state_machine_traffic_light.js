const machine = {
  green: { next: "yellow" },
  yellow: { next: "red" },
  red: { next: "green" },
};
let state = "green";
for (let i = 0; i < 5; i++) {
  console.log(state);
  state = machine[state].next;
}
