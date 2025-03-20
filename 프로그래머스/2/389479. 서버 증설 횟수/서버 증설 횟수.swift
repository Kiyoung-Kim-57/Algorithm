import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var presentServer: Int = 1
    var userLimit: Int { presentServer * m }
    var serverLifeTime: [Int] = [Int](repeating: 0, count: k)
    var lifeTimeHead: Int = 0
    var result: Int = 0
    
    func calculateServerToAdd(_ player: Int) -> Int {
        guard player >= userLimit else { return 0 }
        let totalNeeded = ((player - userLimit) / m) + 1
        return totalNeeded
    }
    
    for player in players {
        presentServer -= serverLifeTime[lifeTimeHead]
        let supplement = calculateServerToAdd(player)
        if supplement > 0 {
            result += supplement
            presentServer += supplement
            serverLifeTime.append(supplement)
            lifeTimeHead += 1
        } else {
            serverLifeTime.append(0)
            lifeTimeHead += 1
        }
    }
    
    return result
}