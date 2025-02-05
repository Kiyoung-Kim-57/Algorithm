import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var operators = readLine()!.split(separator: " ").map { Int($0)! } // +, -, *, /

var maxResult = Int.min
var minResult = Int.max

func dfs(_ depth: Int, _ result: Int) {
    if depth == n { 
        maxResult = max(maxResult, result)
        minResult = min(minResult, result)
        return
    }
    
    for i in 0..<4 {
        if operators[i] > 0 {
            operators[i] -= 1
            let nextResult: Int
            switch i {
            case 0: nextResult = result + numbers[depth]
            case 1: nextResult = result - numbers[depth]
            case 2: nextResult = result * numbers[depth]
            case 3: nextResult = result / numbers[depth]
            default: continue
            }
            dfs(depth + 1, nextResult)
            operators[i] += 1 
        }
    }
}

dfs(1, numbers[0])

print(maxResult)
print(minResult)