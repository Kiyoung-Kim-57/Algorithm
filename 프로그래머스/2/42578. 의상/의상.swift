import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict: [String: [String]] = [:]
    
    for cloth in clothes {
        let name = cloth[0]
        let kind = cloth[1]
        
        dict[kind, default: []].append(name)
    }
    
    let keys = dict.keys
    
    if keys.count == 1 {
        let firstKey = keys.first!
        
        return dict[firstKey]!.count
    }
    
    return keys.map { dict[$0]!.count + 1 }.reduce(1, *) - 1
}