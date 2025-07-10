let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0]
let c = input[1]
let k = input[2]
var result: Int = 0

var board: [[String]] = []
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
for i in 0..<r {
    let line = readLine()!.map{ String($0) }
    
    board.append(line)
}

func dfs(_ idx: Int, _ x: Int, _ y: Int) {
    if idx == k - 1 {
        if x == c - 1 && y == 0 {
            result += 1
        }
        return 
    }
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    for i in 0..<4 {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        if newX < 0 
        || newX >= c
        || newY < 0
        || newY >= r
        || visited[newY][newX]
        || board[newY][newX] == "T" {
            continue
        }
        
        visited[newY][newX] = true
        dfs(idx+1, newX, newY)
        visited[newY][newX] = false
    }   
}

visited[r-1][0] = true
dfs(0, 0, r-1)
print(result)

