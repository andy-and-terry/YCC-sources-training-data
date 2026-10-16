import std/strtabs

let env = newStringTable({"HOME": "/root", "USER": "me"}, modeCaseSensitive)
echo env["HOME"]
env["SHELL"] = "/bin/sh"
echo env.hasKey("SHELL"), " ", env.len
for k, v in env.pairs:
  if k == "USER": echo k, "=", v
echo env.getOrDefault("NOPE", "none")
echo env.len
