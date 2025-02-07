import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var visited: [Bool] = [Bool](repeating: false, count: dungeons.count)
    var result: Int = 0
    func dfs(_ hp: Int,_ depth: Int) {
        result = max(result, depth)
        
        for i in 0..<dungeons.count {
            if !visited[i] && hp >= dungeons[i][0] {
                visited[i] = true
                dfs(hp - dungeons[i][1], depth + 1)
                visited[i] = false
            }
        }
    }
    
    for i in 0..<dungeons.count {
        if k >= dungeons[i][0] {
            visited[i] = true
            dfs(k - dungeons[i][1], 1)
            visited[i] = false
        }
    }
    
    return result
}