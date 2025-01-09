class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp:[Int] = [Int](repeating: .max, count: n + 1)
        dp[0] = 0

        for i in 1...n {
            var k = Int(sqrt(Double(i)))
            
            for j in 1...k {
                let square = j * j
                dp[i] = min(dp[i - square] + 1, dp[i])
            }
        }

        return dp[n]
    }
}