let count = Int(readLine()!)!

var graph: [Int: [Int]] = [:]
var result: Int = 0

for i in 0..<count {
    let links = readLine()!.map{ String($0) }
    graph[i] = []
    for (idx, link) in links.enumerated() {
        if link == "Y" {
            graph[i]!.append(idx)
        }
    }
}

func search(_ start: Int) -> Int {
    let list = graph[start]!
    var count = list.count
    var visited: Set<Int> = Set([start] + list)
    
    for node in list {
        let nextList = graph[node]!
        visited = visited.union(Set(nextList))
    }
    
    return visited.count - 1
}

for i in 0..<count {
    let linkCount = search(i)
    result = max(result, linkCount)
}

print(result)
