class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        var result: [String] = []
        let sorted = words.sorted(by: { $0.count < $1.count })
        let reversed = sorted.reversed()
        for word in sorted  {
            var isSubstring: Bool = false

            for target in reversed {
                guard target != word else { continue }

                if target.contains(word) {
                    isSubstring = true
                    break
                }
            }

            if isSubstring {
                result.append(word)
            }
        }

        return result
    }
}