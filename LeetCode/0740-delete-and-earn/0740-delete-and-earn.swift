class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        // 1. 숫자의 최대값 계산
        let maxNum = nums.max()!
        
        // 2. 빈도 배열 생성
        var count = [Int](repeating: 0, count: maxNum + 1)
        for num in nums {
            count[num] += num // count[num]에 num의 점수를 누적
        }
        
        // 3. DP 배열 계산
        var dp = [Int](repeating: 0, count: maxNum + 1)
        dp[1] = count[1]
        
        guard maxNum > 1 else { return dp[maxNum]}
        
        for num in 2...maxNum {
            dp[num] = max(dp[num - 1], dp[num - 2] + count[num])
        }
        
        return dp[maxNum]
    }
}