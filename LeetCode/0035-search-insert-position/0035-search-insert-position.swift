class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1

        while low <= high {
            var mid = (low + high) / 2

            if target > nums[mid] {
                low = mid + 1
                continue
            } else if target < nums[mid] {
                high = mid - 1
            } else {
                return mid
            }
        }

        return low
    }
}