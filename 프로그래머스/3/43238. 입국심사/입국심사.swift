import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var result: Int = times.max()! * n
    var minValue: Int = 1
    var maxValue: Int = result
    
    while minValue <= maxValue {
        let mid = (minValue + maxValue) / 2
        
        if countTime(mid, times: times) >= n {
            result = mid
            maxValue = mid - 1
        } else {
            minValue = mid + 1
        }
    }
    
    return Int64(result)
}

func countTime(_ num: Int, times: [Int]) -> Int {
    return times.reduce(0, { $0 + ( num  / $1 ) })
}