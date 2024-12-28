class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var result = 0

        for array in grid {
            result += array.filter { $0 < 0 }.count
        }

        return result
    }
}