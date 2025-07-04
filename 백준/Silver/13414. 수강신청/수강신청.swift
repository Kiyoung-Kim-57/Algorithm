let input = readLine()!.split(separator:" ").map{ Int($0)! }
var dict: [String: Int] = [:]

for i in 0..<input[1] {
    let num = readLine()!
    dict[num] = i
}

let keys = dict.keys.sorted(by: { dict[$0]! < dict[$1]! })


if input[0] <= keys.count {
    for j in 0..<input[0] {
        print(keys[j])
    }
} else {
    for key in keys {
        print(key)
    }
}