import Foundation

func solution(_ cards:[Int]) -> Int {
    let maxResult = (cards.count / 2) * (cards.count - (cards.count / 2))
    var visited: [Bool] = [Bool](repeating: false, count: cards.count)
    var counts: [Int] = []
    var result: Int = 0
    func dfs(_ start: Int, _ depth: Int) {
        if visited[start - 1] {
            counts.append(depth)
            return
        }
        
        visited[start - 1] = true
        dfs(cards[start - 1], depth + 1)
    }
    
    for i in 1..<cards.count {
        for j in i...cards.count {
            dfs(j, 0)
        }
        
        if counts.count >= 2 {
            counts.sort(by: >)
            result = max(result, counts[0] * counts[1])
            if result == maxResult { return result }
        }
        
        visited = [Bool](repeating: false, count: cards.count)
        counts = []
    }
    
    return result
}