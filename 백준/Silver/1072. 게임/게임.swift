let input = readLine()!.split(separator: " ").map { Int($0)! }

let gameCount = input[0]
var winCount = input[1]
let z = (winCount * 100) / gameCount
if z >= 99 { print(-1) }
else {
    let result = binarySearch()
    print(result)
}

func binarySearch() -> Int {
    var rp = 1000000000
    var lp = 1
    while lp < rp {
        let mid = (lp + rp) / 2
        let newZ = (winCount + mid) * 100 / (gameCount + mid)

        if newZ > z {
            rp = mid
        } else {
            lp = mid + 1
        }
    }

    return lp
}
