class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count) , count: board.count)
        var chrs = word.map { $0 }
        var result = false
        for y in 0..<board.count {
            for x in 0..<board[0].count {
                guard board[y][x] == chrs[0] else { continue }

                dfs(point: (y, x), idx: 0, visited: visited)
            } 
        }

        func dfs(point: (Int, Int), idx: Int, visited: [[Bool]]) { 
            var newVisited = visited
            let x = point.1
            let y = point.0
            guard board[y][x] == chrs[idx] else { return }
            if idx == chrs.count - 1 {
                result = true
                return
            }

            newVisited[y][x] = true

            for direction in directions {
                let newX = x + direction.1
                let newY = y + direction.0
                
                guard newX >= 0 && newY >= 0 && newX < board[0].count && newY < board.count else { continue }
                guard !visited[newY][newX] else { continue }
                dfs(point: (newY, newX), idx: idx + 1, visited: newVisited)
            }
        }

        return result
    }

    var directions: [(Int,Int)] = [
        (-1, 0),
        (1, 0),
        (0, -1),
        (0, 1)
    ] 
}