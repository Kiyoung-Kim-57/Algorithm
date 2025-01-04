class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        let chrArr = s.map { $0 }

        var firstIndices: [Character: Int] = [:]
        var lastIndices: [Character: Int] = [:]

        var uniqueSet = Set<String>()

        for (index,chr) in chrArr.enumerated() {
            if firstIndices[chr] == nil {
                firstIndices.updateValue(index, forKey: chr) 
            }

            lastIndices.updateValue(index, forKey: chr)
        }

        for chr in alphabets {
            guard let firstIndex = firstIndices[chr], 
                  let lastIndex = lastIndices[chr],
                  firstIndex < lastIndex 
                  else { continue }

            for mid in firstIndex + 1..<lastIndex {
                uniqueSet.insert("\(chrArr[firstIndex])\(chrArr[mid])\(chrArr[lastIndex])")

                if uniqueSet.count == 26 * 26 {
                    return 26 * 26
                }
            }
        }

        return uniqueSet.count
    }

    private var alphabets = "abcdefghijklmnopqrstuvwxyz".map{ $0 }
}