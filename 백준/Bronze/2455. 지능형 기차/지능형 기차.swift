var result: Int = 0
var present: Int = 0
for i in 0..<4 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    present -= input[0]
    present += input[1]
    if present > 10000 {
        present = 10000
    }
    
    result = max(result, present)
}

print(result)