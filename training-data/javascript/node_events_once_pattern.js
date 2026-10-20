const { EventEmitter, once } = require("events");
const em = new EventEmitter();
setTimeout(() => em.emit("ready", 42), 5);
once(em, "ready").then(([v]) => console.log("ready", v));
