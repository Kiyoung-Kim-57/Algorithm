import Foundation

func solution(_ n:Int) -> Int {
    var board: [Int] = [Int](repeating: -1, count: n)
    var result = 0
    func backtracking(_ row: Int) {
        if row == n {
            result += 1
            return
        } 
        
        for col in 0..<n {
            if checkValidity(row, col) {
                board[row] = col
                backtracking(row + 1)
                board[row] = -1
            }
        }
    }
    
    func checkValidity(_ row: Int,_ col: Int) -> Bool {
        
        for prevRow in 0..<row {
            let prevCol = board[prevRow]
            if prevCol == col { return false }
            if abs(prevCol - col) == abs(prevRow - row) { return false}
        }
        
        return true
    }
    
    backtracking(0)
    
    return result
}