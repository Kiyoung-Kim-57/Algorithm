class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        let uniqueLetters = Array(Set(letters)).sorted()
        var low = 0
        var high = uniqueLetters.count - 1

        while low <= high {
            let mid = (low + high) / 2

            if target > uniqueLetters[mid] {
                low = mid + 1
                continue
            } else if target < uniqueLetters[mid] {
                high = mid - 1
                continue
            } else {
                return mid + 1 < uniqueLetters.count ? uniqueLetters[mid + 1] : uniqueLetters[0]
            }
        }

        return low <= uniqueLetters.count - 1 ? uniqueLetters[low] :  uniqueLetters[0]
    }
}