import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    let targetLocation = location(num, w)
    var result: Int = 1
    var totalFloor = (n % w != 0) ? (n / w) + 1 : (n / w)
    var stackedNum = 0
    if targetLocation.0 == totalFloor {
        return result
    }
    
    for f in targetLocation.0...totalFloor {
        let addNum = (f % 2 != 0) ? (2 * (w - targetLocation.1 + 1)) - 1 : (2 * targetLocation.1) - 1
        
        stackedNum += addNum
        
        if num + stackedNum <= n {
            result += 1
        }
    }
    
    return result
}

func location(_ target: Int, _ w: Int) -> (Int, Int) {
    // n번째 층, m번째 위치
    let floor = (target % w != 0) ? (target / w) + 1 : (target / w)
    let columnInFloor = target % w == 0 ? w : target % w
    let location = (floor % 2 != 0) ? columnInFloor : (w + 1 - columnInFloor)
    return (floor, location)
}