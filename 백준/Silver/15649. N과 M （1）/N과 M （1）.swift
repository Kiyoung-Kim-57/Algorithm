let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] //1부터 n까지
let m = input[1] //m개로 이루어진 조합
var visited: [Bool] = [Bool](repeating: false, count: n + 1) // Index 0 은 버리자
var stack: [Int] = []
var results: [String] = []
func dfs(_ count: Int) {
    if count == m {
        results.append(stack.map { String($0) }.joined(separator: " "))
        return 
    }
    
    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            stack.append(i)
            dfs(count + 1)
            visited[i] = false
            stack.removeLast()
        }
    }
}

dfs(0)

for result in results.sorted() {
    print(result)
}
