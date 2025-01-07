class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        var result: [String] = []

        for word in words.sorted(by: { $0.count < $1.count }) {
            var isSubstring: Bool = false

            for target in words.sorted(by: { $0.count > $1.count }) {
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