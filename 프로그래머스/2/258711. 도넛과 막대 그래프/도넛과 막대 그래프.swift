import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var graph: [Int: [Int]] = [:]
    var toMe: [Int: [Int]] = [:]
    var nums: Set<Int> = []
    var results = [0,0,0,0]
    for edge in edges {
        let start = edge[0]
        let end = edge[1]
        nums.insert(start)
        nums.insert(end)
        graph[start, default: []].append(end)
        toMe[end, default: []].append(start)
    }
    let startPoint = findStart(graph, toMe ,nums.count)
    results[0] = startPoint
    guard let roots = graph[startPoint] else { return results }
    
    for root in roots {
        let counts = dfs(graph, root)
        
        switch counts[0] - counts[1] {
            case 0: results[1] += 1
            case 1: results[2] += 1
            case -1: results[3] += 1
            default: continue
        }
    }
    
    return results
}

func findStart(_ graph:[Int: [Int]],_ toMe: [Int: [Int]] ,_ total: Int) -> Int {
    let nodes = graph.keys
    for node in nodes {
        guard let toward = graph[node] else { continue }
        if toMe[node] == nil && toward.count >= 2 { return node }
        else { continue }
    }
    return 0
}

// [edge, node]
func dfs(_ graph:[Int: [Int]], _ start: Int) -> [Int] {
    var needToVisit: [Int] = [start]
    var visited: Set<Int> = []
    var edgeCount: Int = 0
    
    while !needToVisit.isEmpty {
        let visitNode = needToVisit.removeLast()
        
        guard !visited.contains(visitNode) else { continue }
        visited.insert(visitNode)
        
        guard let nextNodes = graph[visitNode] else { continue }
        
        edgeCount += nextNodes.count  // 현재 노드에서 나가는 간선 수 추가
        needToVisit += nextNodes
    }
    
    return [visited.count, edgeCount]
}