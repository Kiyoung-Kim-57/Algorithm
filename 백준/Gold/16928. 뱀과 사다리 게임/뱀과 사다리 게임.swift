
let ladderSnake = readLine()!.split(separator: " ").map { Int($0)! }
let total = ladderSnake[0] + ladderSnake[1]
var portal: [Int:Int] = [:]
var result = 0
var depth = 0

for _ in 0..<total {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    portal[input[0], default: 0] = input[1]
}

func bfs() {
    var visited = [Int](repeating: 0, count: 101)
    var presentPosition = Set([1])
    
    whileLoop: while true {
        var newPositions = Set<Int>()
        depth += 1
        for pos in presentPosition {
            for add in 1...6 {
                let added = pos + add
                let newPos = portal[added] ?? added
                if newPos >= 94 {
                    
                    result = depth + 1
                    break whileLoop
                }
                
                if visited[newPos] == 0 {
                    newPositions.insert(newPos)
                    visited[newPos] = 1
                }
            }
        }
        presentPosition = newPositions
    }
}

bfs()

print(result)
