import Foundation

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    var result: Int = Int.max
    var visited = Array(repeating:
        Array(repeating:
            Array(repeating: false, count: m),
        count: n),
    count: info.count + 1)
    
    func backtracking(depth: Int, aTotal: Int, bTotal: Int) {
        if visited[depth][aTotal][bTotal] {
            return
        }
        
        visited[depth][aTotal][bTotal] = true
        
        if depth == info.count {
            result = min(result, aTotal)
            return
        }
        
        var aTrace = info[depth][0]
        var bTrace = info[depth][1]
        
        if aTotal + aTrace >= n && bTotal + bTrace >= m {
            return
        }
        
        if bTotal + bTrace < m {
            var newB = bTotal + bTrace
            backtracking(depth: depth + 1, aTotal: aTotal, bTotal: newB)
        }
        
        if aTotal + aTrace < n {
            var newA = aTotal + aTrace
            backtracking(depth: depth + 1, aTotal: newA, bTotal: bTotal)
        }
    }
    
    backtracking(depth: 0, aTotal: 0, bTotal: 0)
    
    return result == Int.max ? -1 : result
}