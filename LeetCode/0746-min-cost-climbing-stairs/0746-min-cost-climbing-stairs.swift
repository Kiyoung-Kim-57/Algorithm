class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var tmp = [0, 0]

        guard cost.count > 2 else { return min(cost[0], cost[1]) }

        for n in 2...cost.count {
            let min = min(tmp[n - 2] + cost[n - 2], tmp[n - 1] + cost[n - 1])
            tmp.append(min)
        }

        return tmp.removeLast()
    }
}