let rows = Int(readLine()!)!
// N X N ChessBoard & N Queens
var board: [Int] = [Int](repeating: -1, count: rows)
var result = 0

func backtracking(_ row: Int) {
    guard row < rows else {
        result += 1
        return
    }
    
    for i in 0..<rows {
        if checkValidity(row, col: i) {
            board[row] = i
            backtracking(row + 1)
            board[row] = -1
        }
    }
}

func checkValidity(_ row: Int, col: Int) -> Bool {
    for prevRow in 0..<row {
        let prevCol = board[prevRow]
        if col == prevCol { return false }
        if abs(row - prevRow) == abs(col - prevCol) { return false }
    }
    return true
}

backtracking(0)
print(result)
