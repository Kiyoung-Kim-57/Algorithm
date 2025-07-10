let size = readLine()!.split(separator: " ").map { Int($0)! }
let width = size[1]
let height = size[0]
var board: [[Int]] = []
var result: Int = 0
// 봉우리 체크가 끝나면 봉우리 무리들을 방문했다고 기록
var visitedPole = [[Bool]](repeating: [Bool](repeating: false, count: size[1]), count: size[0])
var notPole = [[Bool]](repeating: [Bool](repeating: false, count: size[1]), count: size[0])

for i in 0..<size[0] {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    
    board.append(line)
}

func bfs(_ start: (Int, Int)) {
    // 탐색 중에만 사용하는 방문 기록
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: size[1]), count: size[0])
    var queue: [(Int, Int)] = [start]
    var pole: [(Int, Int)] = [start]
    visited[start.1][start.0] = true
    // 8방향
    let dx = [ 0,  1, 1, 1, 0, -1, -1, -1]
    let dy = [-1, -1, 0, 1, 1,  1,  0, -1]
    
    while !queue.isEmpty {
        let point = queue.removeFirst()
        
        for i in 0..<8 {
            let newPoint = (point.0 + dx[i], point.1 + dy[i])
            // 경계 처리와 방문 처리
            if newPoint.0 < 0
            || newPoint.0 >= width
            || newPoint.1 < 0
            || newPoint.1 >= height
            || visited[newPoint.1][newPoint.0] {
                continue
            }
            
            if board[newPoint.1][newPoint.0] > board[start.1][start.0] {
                // 인접 위치에 해당 격자보다 높은 곳이 있다면 봉우리가 아니므로 리턴
                notPole[start.1][start.0] = true
                return
            }
            
            if board[newPoint.1][newPoint.0] == board[start.1][start.0] {
                queue.append(newPoint)
                pole.append(newPoint)
            } else {
                notPole[newPoint.1][newPoint.0] = true
            }
            
            visited[newPoint.1][newPoint.0] = true
        }
    }
    
    result += 1
    for p in pole {
        visitedPole[p.1][p.0] = true
    }
}

for y in 0..<height {
    for x in 0..<width {
        if !visitedPole[y][x] && !notPole[y][x] {
            bfs((x, y))
        }
    }
}

print(result)