import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var original: [Int : [Int]] = [:]
    var counts: [Int] = []
    var result: Int = .max
    for i in 1...n {
        original.updateValue([], forKey: i)
    }
    
    for wire in wires {
        let num1 = wire[0]
        let num2 = wire[1]
        
        original[num1]!.append(num2)
        original[num2]!.append(num1)
    }
    
    func dfs(_ node: Int , graph: [Int : [Int]], visited: inout Set<Int>) {
        visited.insert(node)
        let connected = graph[node]!.filter { !visited.contains($0) }
        if connected.isEmpty {
            return
        }
        
        for next in connected {
            dfs(next, graph: graph, visited: &visited)
        }
    }
    
    for wire in wires {
        let newGraph = excludeWire(wire, graph: original)
        var needToVisit: [Int] = Array(newGraph.keys)
        var visited = Set<Int>()
        var counts: [Int] = []
        
        while !needToVisit.isEmpty {
            dfs(needToVisit[0], graph: newGraph, visited: &visited)
            needToVisit = needToVisit.filter { !visited.contains($0) }
            
            counts.append(visited.count)
            if counts.count == 2 {
                break
            }
            visited = Set<Int>()
        }
        
        let temp = abs(counts[0] - counts[1])
        result = min(temp, result)
    }
    
    return result
}

func excludeWire(_ wire: [Int], graph: [Int : [Int]]) -> [Int : [Int]] {
    var newGraph = graph
    newGraph[wire[0]] = newGraph[wire[0]]!.filter { $0 != wire[1] }
    newGraph[wire[1]] = newGraph[wire[1]]!.filter { $0 != wire[0] }
    return newGraph
}