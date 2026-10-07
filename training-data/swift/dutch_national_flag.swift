// Sort an array of 0s, 1s and 2s in a single pass.
func dutchFlagSort(_ a: inout [Int]) {
    var low = 0, mid = 0, high = a.count - 1
    while mid <= high {
        switch a[mid] {
        case 0:
            a.swapAt(low, mid)
            low += 1
            mid += 1
        case 1:
            mid += 1
        default:
            a.swapAt(mid, high)
            high -= 1
        }
    }
}

var colors = [2, 0, 2, 1, 1, 0, 0, 2]
dutchFlagSort(&colors)
print(colors)
