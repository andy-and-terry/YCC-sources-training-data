func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty else { return [] }
    var top = 0, bottom = matrix.count - 1
    var left = 0, right = matrix[0].count - 1
    var result: [Int] = []

    while top <= bottom && left <= right {
        for c in left...right { result.append(matrix[top][c]) }
        top += 1
        if top <= bottom {
            for r in top...bottom { result.append(matrix[r][right]) }
        }
        right -= 1
        if top <= bottom && left <= right {
            for c in stride(from: right, through: left, by: -1) { result.append(matrix[bottom][c]) }
            bottom -= 1
        }
        if left <= right && top <= bottom {
            for r in stride(from: bottom, through: top, by: -1) { result.append(matrix[r][left]) }
            left += 1
        }
    }
    return result
}

let grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(spiralOrder(grid))
