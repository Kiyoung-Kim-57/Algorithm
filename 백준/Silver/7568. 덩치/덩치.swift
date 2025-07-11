let count = Int(readLine()!)!
var bodies: [(Int, Int)] = []
var result: [Int] = []
for i in 0..<count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var body = (input[0], input[1])
    
    bodies.append(body)
}

func isLargerThanMe(_ body: (Int, Int), _ compare: (Int, Int)) ->  Bool {
    if body.0 < compare.0 && body.1 < compare.1 {
        return true
    }
    
    return false
}

result = bodies.map { body in bodies.filter { isLargerThanMe(body, $0) }.count }

for r in result {
    print(r + 1, terminator: " ")
}