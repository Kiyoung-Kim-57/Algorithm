let count = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

func binarySearch(_ arr: [Int], _ target: Int) -> Int {
    var leftNum: Int = 0
    var rightNum: Int = arr.count - 1
    
    while leftNum <= rightNum {
        let midNum = (leftNum + rightNum) / 2
        let numToCompare = arr[midNum]
        if target <= numToCompare {
            rightNum = midNum - 1
        } else {
            leftNum = midNum + 1
        }
    }
    
    return leftNum
}

func lisSearch(nums: [Int]) -> Int {
    var lis: [Int] = []
    
    for num in nums {
        guard !lis.isEmpty else {
            lis.append(num)
            continue
        }

        let pos = binarySearch(lis, num)
        
        if pos == lis.count {
            lis.append(num)
        } else {
            lis[pos] = num
        }
    }
    
    return lis.count
}

let result = lisSearch(nums: input)
print(result)