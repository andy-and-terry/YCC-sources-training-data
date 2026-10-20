const READ = 1, WRITE = 2, EXEC = 4;
let perm = READ | WRITE;
console.log((perm & WRITE) !== 0, (perm & EXEC) !== 0);
perm ^= WRITE;
perm |= EXEC;
console.log(perm.toString(2).padStart(3, "0"));
