class Solution {
    func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
        var chrs = s.map { $0 }

        let moves = calMoves(shifts: shifts, count: chrs.count)
        for i in 0..<chrs.count {
            chrs[i] = shiftLetter(chrs[i], move: moves[i])
        }

        return chrs.map { String($0) }.joined()
    }

    private func shiftLetter(_ chr: Character, move: Int) -> Character {
        let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
        let currentIdx = alphabets.firstIndex(of: chr)!

        var shiftedIdx = currentIdx + move

        shiftedIdx = shiftedIdx % 26

        if shiftedIdx < 0 {
            shiftedIdx += 26
        }

        return alphabets[shiftedIdx]
    }

    private func calMoves(shifts: [[Int]], count: Int) -> [Int] {
        var moves: [Int] = [Int](repeating: 0, count: count + 1)
        for shift in shifts {
            let start = shift[0]
            let end = shift[1] + 1

            moves[start] += (shift[2] == 1) ? 1 : -1
            moves[end] -= (shift[2] == 1) ? 1 : -1
        }

        for i in 1..<moves.count {
            moves[i] += moves[i - 1]
        }

        return moves
    }
}