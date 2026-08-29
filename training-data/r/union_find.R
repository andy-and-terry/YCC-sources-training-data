UnionFind <- setRefClass("UnionFind",
  fields = list(parent = "numeric"),
  methods = list(
    initialize = function(n) {
      parent <<- 1:n
    },
    find = function(x) {
      if (parent[x] == x) return(x)
      find(parent[x])
    },
    union_sets = function(x, y) {
      root_x <- find(x)
      root_y <- find(y)
      if (root_x != root_y) {
        parent[root_x] <<- root_y
      }
    }
  )
)

uf <- UnionFind$new(5)
uf$union_sets(1, 2)
uf$union_sets(2, 3)
print(uf$find(1) == uf$find(3))
print(uf$find(1) == uf$find(4))
