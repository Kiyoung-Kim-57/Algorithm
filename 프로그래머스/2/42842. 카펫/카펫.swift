import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var width: Int = 0
    var height: Int = 0
    
    for h in 3...brown {
        let w = (brown - (2 * h) + 4) / 2
        if (w - 2) * (h - 2) == yellow {
            width = w
            height = h
            break
        }
    }
    
    return [width, height]
}