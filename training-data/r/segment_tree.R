build_segment_tree <- function(arr) {
  n <- length(arr)
  tree <- numeric(4 * n)
  build <- function(node, start, end) {
    if (start == end) {
      tree[node] <<- arr[start]
      return(invisible(NULL))
    }
    mid <- (start + end) %/% 2
    build(2 * node, start, mid)
    build(2 * node + 1, mid + 1, end)
    tree[node] <<- tree[2 * node] + tree[2 * node + 1]
  }
  build(1, 1, n)
  list(tree = tree, n = n)
}

segment_query <- function(seg, node, start, end, l, r) {
  if (r < start || end < l) return(0)
  if (l <= start && end <= r) return(seg$tree[node])
  mid <- (start + end) %/% 2
  left_sum <- segment_query(seg, 2 * node, start, mid, l, r)
  right_sum <- segment_query(seg, 2 * node + 1, mid + 1, end, l, r)
  left_sum + right_sum
}

segment_update <- function(seg, node, start, end, idx, value) {
  if (start == end) {
    seg$tree[node] <- value
    return(seg)
  }
  mid <- (start + end) %/% 2
  if (idx <= mid) {
    seg <- segment_update(seg, 2 * node, start, mid, idx, value)
  } else {
    seg <- segment_update(seg, 2 * node + 1, mid + 1, end, idx, value)
  }
  seg$tree[node] <- seg$tree[2 * node] + seg$tree[2 * node + 1]
  seg
}

arr <- c(1, 3, 5, 7, 9, 11)
seg <- build_segment_tree(arr)
print(segment_query(seg, 1, 1, seg$n, 2, 5))
seg <- segment_update(seg, 1, 1, seg$n, 3, 10)
print(segment_query(seg, 1, 1, seg$n, 2, 5))
