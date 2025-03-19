import Foundation

struct Queue<T> {
    private var array: [T] = []
    private var head = 0
    
    var isEmpty: Bool { head >= array.count }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        let element = array[head]
        head += 1
        
        if head > 5000 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

let caseCount = Int(readLine()!)!
var results: [String] = []

enum DSLR: String, CaseIterable {
    case d, s, l, r
    
    func calculate(_ num: Int) -> Int {
        switch self {
        case .d: return (num * 2) % 10000
        case .s: return num == 0 ? 9999 : num - 1
        case .l: return (num % 1000) * 10 + num / 1000
        case .r: return (num % 10) * 1000 + num / 10
        }
    }
    
    var upper: String { self.rawValue.uppercased() }
}

func bfs(_ start: Int, _ end: Int) {
    var queue = Queue<(Int, String)>()
    var visited = [Bool](repeating: false, count: 10000)
    
    queue.enqueue((start, ""))
    visited[start] = true
    
    while let (current, path) = queue.dequeue() {
        for command in DSLR.allCases {
            let next = command.calculate(current)
            
            if next == end {
                results.append(path + command.upper)
                return
            }
            
            if !visited[next] {
                visited[next] = true
                queue.enqueue((next, path + command.upper))
            }
        }
    }
}

for _ in 0..<caseCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    bfs(input[0], input[1])
}

print(results.joined(separator: "\n"))