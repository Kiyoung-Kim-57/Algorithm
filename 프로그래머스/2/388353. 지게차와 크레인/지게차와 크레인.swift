import Foundation

func solution(_ storage:[String], _ requests:[String]) -> Int {
    var board: [[String]] = []
    
    for line in storage {
        let chrs = line.map { String($0) }
        board.append(chrs)
    }
    
    var width: Int = board[0].count
    var height: Int = board.count
    
    func checkWayOut(_ boardInput: [[String]], x: Int, y: Int) -> Bool {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
        var queue: [(Int, Int)] = [(x, y)]
        let dx = [1, -1,  0,  0]
        let dy = [0,  0,  1, -1]
        visited[y][x] = true
        
        while !queue.isEmpty {
            var point = queue.removeFirst()
            
            for i in 0..<4 {
                let newX = point.0 + dx[i]
                let newY = point.1 + dy[i]

                if newX < 0 
                || newX >= width
                || newY < 0 
                || newY >= height {
                    return true
                }
                
                if boardInput[newY][newX] == "0" && !visited[newY][newX] {
                    visited[newY][newX] = true
                    queue.append((newX, newY))
                }
            }
        }
        
        
        return false
    }
    
    for request in requests {
        if request.count == 1 {
            let boardBeforeChanged = board
            let target = request
            //지게차
            for y in 0..<height {
                for x in 0..<width {
                    if board[y][x] == target {
                        if checkWayOut(boardBeforeChanged, x: x, y: y) {
                            board[y][x] = "0"
                        }
                    }
                }
            }
            //지게차 끝
        }
        else {
            //크레인
            let target = String(request.first!)
            
            for y in 0..<height {
                for x in 0..<width {
                    if board[y][x] == target {
                        board[y][x] = "0"
                    }
                }
            }
            //크레인 끝
        }
    }
    return board.map { line in line.filter { $0 != "0" }.count}.reduce(0, +)
}