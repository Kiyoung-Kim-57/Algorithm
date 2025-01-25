import Foundation

func solution(_ s:String) -> [Int] {
    var convertCount: Int = 0
    var zeroCount: Int = 0
    var binaryNum = s.map { $0 }
    var prevLength = s.count
    
    while binaryNum != ["1"] {
        convertCount += 1
        let filtered = binaryNum.filter { $0 != "0" }
        zeroCount += prevLength - filtered.count
        
        let newNum = String(filtered.count, radix: 2)
        binaryNum = newNum.map { $0 }
        prevLength = newNum.count
    }
    
    return [convertCount, zeroCount]
}