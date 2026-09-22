make_hash_map <- function() {
  new.env(hash = TRUE, parent = emptyenv())
}

hm_set <- function(map, key, value) {
  assign(key, value, envir = map)
}

hm_get <- function(map, key, default = NULL) {
  if (exists(key, envir = map, inherits = FALSE)) get(key, envir = map) else default
}

hm_has <- function(map, key) {
  exists(key, envir = map, inherits = FALSE)
}

hm_remove <- function(map, key) {
  if (hm_has(map, key)) rm(list = key, envir = map)
}

hm_keys <- function(map) {
  ls(envir = map)
}

map <- make_hash_map()
hm_set(map, "apple", 3)
hm_set(map, "banana", 5)
hm_set(map, "cherry", 7)

print(hm_get(map, "banana"))
print(hm_get(map, "missing", default = 0))
print(sort(hm_keys(map)))

hm_remove(map, "banana")
print(hm_has(map, "banana"))
print(sort(hm_keys(map)))
