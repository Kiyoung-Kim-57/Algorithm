import Foundation
//dfs solution
func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count: Int = 0
    count = dfs(numbers, target, 0, 0)
    return count
    
}

func dfs( _ numbers: [Int], _ target: Int, _ start: Int, _ depth: Int) -> Int {
    var sum: Int = start
    var count: Int = 0
    if depth == numbers.count {
        return sum == target ?  1 : 0
    } else {
        count += dfs(numbers, target, sum + numbers[depth], depth + 1)
        count += dfs(numbers, target, sum - numbers[depth], depth + 1)
        return count
    }
}

//bfs solution
// func solution(_ numbers:[Int], _ target:Int) -> Int {
//     var sumArray: [Int] = [0]
//     var index: Int = 0
//     for i in 0..<numbers.count {
//         var temp: [Int] = []
//         for sum in sumArray {
//             temp.append(sum + numbers[i])
//             temp.append(sum - numbers[i])  
//         }
//         sumArray = temp
//     }
//     return sumArray.filter{ $0 == target }.count
// }