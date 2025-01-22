class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numSet = Set(nums)
        var result: [Int] = []

        for i in 0..<nums.count - 1 {
            guard numSet.contains(target - nums[i]) else { continue }
            guard let idx = nums[i+1...nums.count - 1].firstIndex(of: target - nums[i]) else { continue }
            result = [i, idx]
            break
        }

        return result
    }
}