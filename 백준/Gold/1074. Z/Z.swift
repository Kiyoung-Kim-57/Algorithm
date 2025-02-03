import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }
let n = Int(input[0])!
let r = Int(input[1])!
let c = Int(input[2])!
var maxCount = powerTwo(n)
var pivotX = 0
var pivotY = 0
var board: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: maxCount), count: maxCount)
board[0][0] = 0

func checkPivot(idx: Int, target: (Int, Int)) {
    guard n >= idx else { return }
    let temp = powerTwo(n - idx)
    let newX = temp * (target.1 / temp)
    let newY = temp * (target.0 / temp)
    let multiplier = checkMultiplier(origin: (pivotX, pivotY), target: (newX, newY))
    board[newY][newX] = board[pivotY][pivotX] + (temp * temp * multiplier)
    pivotX = newX
    pivotY = newY
    checkPivot(idx: idx + 1, target: target)
}

func checkMultiplier(origin: (Int, Int), target: (Int, Int)) -> Int {
    if origin.0 != target.0 && origin.1 == target.1 {
        return 1
    } else if origin.0 == target.0 && origin.1 != target.1 {
        return 2
    } else if origin.0 != target.0 && origin.1 != target.1 {
        return 3
    } else { return 0 }
}

func powerTwo(_ num: Int) -> Int {
    var result = 2
    guard num > 0 else { return 1 }
    for _ in 1..<num {
        result *= 2
    }
    return result
}

checkPivot(idx: 1, target: (r, c))
print(board[r][c])
