let count = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var operators = readLine()!.split(separator: " ").map { Int(String($0))! }

var maxNum: Int = .min
var minNum: Int = .max

func dfs(_ index: Int, result: Int) {
    if index == count {
        maxNum = max(maxNum, result)
        minNum = min(minNum, result)
        return
    }
    
    for i in 0..<operators.count {
        var tempResult = result
        
        if operators[i] > 0 {
            operators[i] -= 1
            switch i {
            case 0: tempResult += nums[index]
            case 1: tempResult -= nums[index]
            case 2: tempResult *= nums[index]
            case 3: tempResult /= nums[index]
            default: break
            }
            dfs(index + 1, result: tempResult)
            operators[i] += 1
        }
    }
}

dfs(1, result: nums[0])

print("\(maxNum)\n\(minNum)")