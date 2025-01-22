class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.contains(target) else { return -1 }
        return binarySearch(low: 0, high: nums.count - 1, target: target, nums: nums)
    }

    func binarySearch(low: Int, high: Int, target: Int, nums: [Int]) -> Int {
        let mid = (low + high) / 2
        if target > nums[mid] {
            return binarySearch(low: mid + 1, high: high, target: target, nums: nums)
        } else if target < nums[mid] {
            return binarySearch(low: low, high: mid - 1, target: target, nums: nums)
        } else {
            return mid
        }
    }
}