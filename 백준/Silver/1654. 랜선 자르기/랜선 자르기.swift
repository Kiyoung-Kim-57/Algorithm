let input = readLine()!.split(separator: " ").map { Int($0)! }
let k = input[0]
let n = input[1]
var lines:[Int] = []

for _ in 0..<k {
    let line = Int(readLine()!)!
    lines.append(line)
}

var result = 0

func binarySearch() {
    var minN: Int = 1
    var maxN: Int = lines.max()!
    
    while minN <= maxN {
        let mid = (minN + maxN) / 2
      
        if checkCount(mid) >= n {
            result = max(result, mid)
            minN = mid + 1
        } else {
            maxN = mid - 1
        }
    }
}

func checkCount(_ num: Int) -> Int { return lines.reduce(0, { $0 + ($1 / num) }) }
binarySearch()

print(result)
