import Foundation

func solution(_ numbers:String) -> Int {
    let nums = numbers.map { String($0) }
    var checked = Set<Int>()
    var visited = [Int](repeating: 0, count: numbers.count)
    var result = 0
    
    func dfs(_ number: String) {
        if checkValidity(Int(number)!) && !checked.contains(Int(number)!) { 
            result += 1 
        }
        
        checked.insert(Int(number)!)
        
        if number.count == numbers.count { return } 
        
        for (idx, value) in nums.enumerated() {
            if visited[idx] == 0 {
                visited[idx] = 1
                dfs(number + value)
                visited[idx] = 0
            }
        }
    }
    
    for (idx,start) in nums.enumerated() {
        visited[idx] = 1
        dfs(start)
        visited[idx] = 0
    }
    
    return result
}

func checkValidity(_ num: Int) -> Bool {
    guard num >= 4 else { 
        if num <= 1 { return false }
        return true
    }
    for i in 2...num / 2 {
        if num % i == 0 {
            return false
        } 
    }
    
    return true
}