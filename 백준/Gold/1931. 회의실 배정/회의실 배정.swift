let n = Int(readLine()!)!
var books:[[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split(separator:" ").map{Int($0)!}
    books.append(input)
}
var count = 0
var end = 0
books.sort(by: {$0[0] < $1[0]})
books.sort(by: {$0[1] < $1[1]})

for book in books {
    if book[0] >= end {
        count += 1
        end = book[1]
    }
}

print(count)