import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = Int.max
    
    func dfs(_ idx: Int, _ word: String, _ needToVisit: [String], _ visited: Set<String>) {
        let filtered = needToVisit.filter { check(word, $0) }
        
        if filtered.isEmpty { return }
        
        for next in filtered {
            if next == target { 
                result = min(result, idx + 1)
                return
            }
            var newVisited = visited
            newVisited.insert(next)
            
            dfs(idx + 1, next, words.filter { !newVisited.contains($0)}, newVisited)
        }
    }
    
    func check(_ compare: String, _ to: String) -> Bool {
        let first = Array(compare)
        let second = Array(to)
        var diffCount = 0
        
        for i in 0..<first.count {
            if first[i] != second[i] { diffCount += 1 }
            if diffCount > 1 { return false }
        }
        return true
    }   
    
    dfs(0, begin, words, Set<String>())
    return result == Int.max ? 0 : result
}