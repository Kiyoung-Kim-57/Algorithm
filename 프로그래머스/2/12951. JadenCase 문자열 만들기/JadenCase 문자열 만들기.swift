func solution(_ s:String) -> String {
    var lowercased = s.lowercased().map { String($0) }
    var checkPrevBlank = true
    
    for i in 0..<lowercased.count {
        guard lowercased[i] != " " else {
            checkPrevBlank = (lowercased[i] == " ")
            continue
        }
        
        guard checkPrevBlank else { continue }
        lowercased[i] = lowercased[i].uppercased()
        checkPrevBlank = false
    }
    
    return lowercased.joined()
}