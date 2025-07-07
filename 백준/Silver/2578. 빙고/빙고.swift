var bingo: [[Int]] = []
var checked: [[Int]] = [[Int]](repeating:[Int](repeating: 0, count: 5), count: 5)
// 빙고판 입력
for _ in 0..<5 {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    bingo.append(line)
}
// 호출 넘버
var numCalled: [Int] = []
for _ in 0..<5 {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    numCalled += line
}

for i in 0..<25 {
    checkNum(numCalled[i])
    
    let linesCount = checkH() + checkV() + checkX()
    if linesCount >= 3 {
        print(i + 1)
        break
    } 
}

// 빙고 숫자 체크
func checkNum(_ num: Int) {
    for y in 0..<5 {
        for x in 0..<5 {
            if bingo[y][x] == num {
                checked[y][x] = 1
                return
            }
        }
    }
}
// 빙고 라인 수 체크
func checkH() -> Int {
    let hCount = checked.filter { line in line.filter { $0 == 1 }.count == 5 }.count
    return hCount
}

func checkV() -> Int {
    var count = 0
    
    outerLoop: for i in 0..<5 {
        for line in checked {
            if line[i] != 1 {
                continue outerLoop
            }
        }
        
        count += 1
    }
    
    return count
}

func checkX() -> Int {
    let start = [(0,0), (4,0)]
    let dx = [1, -1]
    let dy = [1, 1]
    var result: Int = 0
    
    for i in 0..<2 {
        var sp = start[i]
        var count: Int = 0
        for _ in 0..<5 {
            if checked[sp.1][sp.0] == 1 {
                count += 1
            }
            
            sp.0 += dx[i]
            sp.1 += dy[i]
        }
        
        if count == 5 {
            result += 1
        }
    }
    
    return result
}
