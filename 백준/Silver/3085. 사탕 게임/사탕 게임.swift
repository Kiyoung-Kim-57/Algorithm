let input = Int(readLine()!)!
var candyBoard: [[String]] = []

for i in 0..<input {
    let candies = readLine()!.map { String($0) }
    candyBoard.append(candies)
}
//CPZY
//주어진 보드 내에서 최대로 먹을 수 있는 사탕 개수 구하는 함수
func checkCandies(_ line: [String]) -> Int {
    var maxLen = 1
    var currentLen = 1
    
    for i in 1..<line.count {
        if line[i] == line[i-1] {
            currentLen += 1
        } else {
            maxLen = max(maxLen, currentLen)
            currentLen = 1
        }
    }
    
    return max(maxLen, currentLen)
}
//행 탐색으로 최대 사탕 개수 구하기
func checkH(_ board:[[String]]) -> Int {
    var result: Int = 0
    
    for n in 0..<input {
        let line = board[n]
        
        let maxCandy = checkCandies(line)
        result = max(result, maxCandy)
        
    }
    
    return result
}
//열 탐색으로 최대 사탕 개수 구하기
func checkV(_ board: [[String]]) -> Int {
    var result: Int = 0
    
    for n in 0..<input {
        var column: [String] = []
        for m in 0..<input {
            column.append(board[m][n])
        }
        
        
        result = max(result, checkCandies(column))
    }

    return result
}

func checkMaxCandy(_ array: [[String]]) -> Int {
    let hMax = checkH(array)
    let vMax = checkV(array)
    return max(hMax, vMax)
}
//보드 탐색하면서 인접 사탕과 색이 다를 경우 교체하면서 사탕 개수 구해보기

func checkAfterSwitch(x: Int, y: Int) -> Int {
    let dx = [1, 0]
    let dy = [0, 1]
    var result: Int = 0
    for i in 0..<2 {
        let toX = x + dx[i]
        let toY = y + dy[i]
        
        guard toX < input && toY < input else { continue }
        guard candyBoard[y][x] != candyBoard[toY][toX] else { continue }
        var newBoard = candyBoard
        let temp = newBoard[toY][toX]
        
        newBoard[toY][toX] = newBoard[y][x]
        newBoard[y][x] = temp
        let maxCount = checkMaxCandy(newBoard)
        
        result = max(result, maxCount)
    }
    
    return result
}

var finalResult: Int = 0

for y in 0..<input {
    for x in 0..<input {
        let tempCount = checkAfterSwitch(x: x, y: y)
        
        finalResult = max(finalResult, tempCount)
    }
}

print(finalResult)