class Solution {
    func rob(_ nums: [Int]) -> Int {
        var tmp = [0, nums[0]]

        guard nums.count > 1 else { return tmp.removeLast() }

        for i in 2...nums.count {
            let max = max(tmp[i - 2] + nums[i - 1], tmp[i - 1])
            tmp.append(max)
        }

        return tmp.removeLast()
    }
}