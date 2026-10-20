const opts = { retries: 0, name: "" , cache: null };
opts.retries ||= 3;
opts.name ??= "default";
opts.cache ??= new Map();
opts.retries &&= opts.retries + 1;
console.log(opts);
