class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        let sorted = Array(Set(nums)).sorted()
        let maxNum = sorted.max()!
        let minNum = sorted.min()!
        var dp: [Int] = [Int](repeating: 0, count: maxNum + 1)

        for num in 1...maxNum {
            guard nums.contains(num) else { 
                dp[num] = dp[num - 1] 
                continue 
            }
            guard num != 1 else { 
                dp[num] = nums.filter { $0 == 1 }.count
                continue
            }
            dp[num] = max(dp[num - 1], (dp[num - 2] + num * nums.filter{ $0 == num }.count))
        }
        
        return dp.removeLast()
    }
}