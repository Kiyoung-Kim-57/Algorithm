import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var routes: [String: [String]] = [:]
    var visited: [String: [Int]] = [:]
    var results: [[String]] = []
    
    for ticket in tickets {
        routes[ticket[0], default: []].append(ticket[1])
        routes[ticket[0]]?.sort()
    }
    
    for start in routes.keys {
        visited[start, default: []] = [Int](repeating: 0, count: routes[start]!.count)
    }
    
    func dfs(_ start: String,_ journey: [String]) {
        guard journey.count < tickets.count + 1 else {
            results.append(journey)
            return
        }
        
        guard let route = routes[start] else { return }
        for (idx, next) in route.enumerated() {
            guard visited[start]![idx] == 0 else { continue }
            visited[start]![idx] = 1
            dfs(next, journey + [next])
            visited[start]![idx] = 0
        }
    }
    
    dfs("ICN", ["ICN"])
    return results[0]
}