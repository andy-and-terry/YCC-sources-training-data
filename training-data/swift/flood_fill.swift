func floodFill(_ image: inout [[Int]], row: Int, col: Int, newColor: Int) {
    let original = image[row][col]
    guard original != newColor else { return }
    var stack = [(row, col)]

    while let (r, c) = stack.popLast() {
        guard r >= 0, r < image.count, c >= 0, c < image[r].count else { continue }
        guard image[r][c] == original else { continue }
        image[r][c] = newColor
        stack.append((r + 1, c))
        stack.append((r - 1, c))
        stack.append((r, c + 1))
        stack.append((r, c - 1))
    }
}

var image = [
    [1, 1, 0],
    [1, 0, 0],
    [1, 1, 1],
]
floodFill(&image, row: 0, col: 0, newColor: 7)
image.forEach { print($0) }
