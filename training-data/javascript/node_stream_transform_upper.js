const { Transform, Readable } = require("stream");
const upper = new Transform({ transform(chunk, enc, cb) { cb(null, chunk.toString().toUpperCase()); } });
Readable.from(["abc ", "def"]).pipe(upper).on("data", (d) => process.stdout.write(d)).on("end", () => console.log());
