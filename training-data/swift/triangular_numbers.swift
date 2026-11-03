let triangular = sequence(state: (n: 0, sum: 0)) { state -> Int? in
    state.n += 1
    state.sum += state.n
    return state.sum
}

print(Array(triangular.prefix(10)))
