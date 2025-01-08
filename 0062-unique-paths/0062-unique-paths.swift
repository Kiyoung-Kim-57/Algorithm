class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var graph = [[Int]](repeating: [Int](repeating: 0, count: n) , count: m)

        for y in 0..<m {
            for x in 0..<n {
                guard !(x == 0 || y == 0) else { 
                    graph[y][x] = 1
                    continue
                }

                graph[y][x] = graph[y - 1][x] + graph[y][x - 1]
            }
        }

        return graph[m - 1][n - 1]
    }
}