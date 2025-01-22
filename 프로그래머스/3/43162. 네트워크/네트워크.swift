import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var graph: [Int : [Int]] = [:]
    var visited = Set<Int>()
    var result: Int = 0
    
    for i in 0..<n {
        let connected = computers[i]
        graph.updateValue([],forKey:i + 1)
        
        for (idx, value) in connected.enumerated() {
            guard idx != i && value == 1 else { continue }
            graph[i+1]!.append(idx+1)
        }
    }
    
    for i in 1...n {
        guard !visited.contains(i) else { continue }
        dfs(node: i, visited: &visited, graph: graph)
        result += 1
    }
    
    
    
    return result
}

func dfs(node: Int, visited: inout Set<Int>, graph: [Int: [Int]]) {
    guard let connected = graph[node], !connected.isEmpty else { return }
    visited.insert(node)
    
    connected.forEach { 
        guard !visited.contains($0) else { return }
        dfs(node: $0, visited: &visited, graph: graph ) 
    }
}