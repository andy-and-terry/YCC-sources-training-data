function clamp(x, lo, hi) {
    return x < lo ? lo : (x > hi ? hi : x)
}
{ print clamp($1, 0, 100) }
