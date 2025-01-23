import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var discountRates: [Int] = [10, 20, 30, 40]
    var result: [Int] = [0, 0]
    
    func dfs(idx: Int, discounts: [Int]) {
        if idx == emoticons.count {
            let tmp = checkPayment(users: users, discounts: discounts, emoticons: emoticons)
            if result[0] < tmp[0] {
                result = tmp
            } else if result[0] == tmp[0] {
                result = result[1] < tmp[1] ? tmp : result
            }
            return
        }
        
        for rate in discountRates {
            dfs(idx: idx + 1, discounts: discounts + [rate] )
        }
    }
    
    dfs(idx: 0, discounts: [])
    return result
}

func checkPayment(users: [[Int]], discounts:[Int], emoticons: [Int]) -> [Int] {
    var plusCount = 0
    var total: Double = 0
    
    guard discounts.count == emoticons.count else { 
        print("Something Wrong")
        return [0, 0]
    }
    
    for user in users {
        var tmpTotal: Double = 0
        
        for i in 0..<discounts.count {
            guard user[0] <= discounts[i] else { continue }
            
            tmpTotal += Double(emoticons[i]) * ( (100 - Double(discounts[i])) / 100)
        }
        
        if user[1] <= Int(tmpTotal) {
            plusCount += 1
        } else {
           total += tmpTotal 
        }
    }
    
    return [plusCount, Int(total)]
}