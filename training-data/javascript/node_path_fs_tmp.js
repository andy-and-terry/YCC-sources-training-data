const fs = require("fs"), os = require("os"), path = require("path");
const f = path.join(os.tmpdir(), "demo.txt");
fs.writeFileSync(f, "line1\nline2\n");
console.log(fs.readFileSync(f, "utf8").split("\n").filter(Boolean), path.extname(f), path.basename(f, ".txt"));
fs.unlinkSync(f);
