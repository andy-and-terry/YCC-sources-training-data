describe <- function(x) {
  switch(x,
    "a" = ,
    "b" = "early letter",
    "c" = "middle letter",
    "unknown")
}

print(describe("a"))
print(describe("c"))
print(describe("z"))
print(switch(2, "one", "two", "three"))
