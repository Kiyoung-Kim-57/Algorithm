class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var low = 0
        var high = letters.count - 1

        while low <= high {
            let mid = (low + high) / 2

            if target >= letters[mid] {
                low = mid + 1
                continue
            } else if target < letters[mid] {
                high = mid - 1
                continue
            } 
        }

        return low <= letters.count - 1 ? letters[low] :  letters[0]
    }
}