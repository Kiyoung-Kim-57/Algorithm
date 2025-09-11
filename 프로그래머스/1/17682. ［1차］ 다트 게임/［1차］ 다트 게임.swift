func solution(_ dartResult:String) -> Int {
    var results: [[Character]] = []
    var scores: [Int] = []
    var temp: [Int] = []
    // 먼저 점수 옵션을 숫자 기준으로 분리
    for chr in dartResult {
        if let score = Int(String(chr)) {
            // 10일 경우를 대비해 우선 temp에 추가해둠
            if temp.isEmpty { results.append([]) }
            temp.append(score)
            continue
        } else {
            // 각 옵션들에 담김 숫자들을 배열에 담음
            if temp.count == 2 {
                scores.append(10)
            } else if temp.count == 1 {
                scores.append(temp[0])
            }
            temp = []
            
            results[results.count - 1].append(chr)
        }
    }
    
    // 그 이후 각 점수 옵션의 옵션들을 파싱하여 숫자 배열에 연산 적용
    for (idx, option) in results.enumerated() {
        for chr in option {
            switch chr {
                case "S":
                    continue
                case "D":
                    var num = scores[idx]
                    scores[idx] = power(of: 2, to: num)
                case "T":
                    var num = scores[idx]
                    scores[idx] = power(of: 3, to: num)
                case "*":
                    if idx > 0 { scores[idx - 1] *= 2 }
                    scores[idx] *= 2
                case "#":
                    scores[idx] *= -1
                default: continue
            }
        }
    }
    // 마지막에 배열에 있는 숫자의 합을 반환
    return scores.reduce(0, +)
}

func power(of num1: Int, to num2: Int) -> Int {
    var result = 1
    for i in 0..<num1 {
        result *= num2
    }
    
    return result
}