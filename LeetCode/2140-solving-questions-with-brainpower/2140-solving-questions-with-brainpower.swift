class Solution {
    func mostPoints(_ questions: [[Int]]) -> Int {
        var dp: [Int] = [Int](repeating: 0, count: questions.count)
        dp[dp.count - 1] = questions[dp.count - 1][0]

        guard dp.count > 1 else { return dp[0] }
        
        for i in 2...dp.count {
            let idx = dp.count - i
            let nextIdx = idx + questions[idx][1] + 1
            let score = questions[idx][0]

            dp[idx] = max(dp[idx + 1], score + (nextIdx < dp.count ? dp[nextIdx] : 0))
        }

        return dp[0]
    }
}