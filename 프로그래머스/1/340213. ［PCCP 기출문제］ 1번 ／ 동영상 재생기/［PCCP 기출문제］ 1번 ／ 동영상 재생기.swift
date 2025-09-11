import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    // Int 타입의 초로 변환
    let videoLen = toSec(video_len)
    var position = toSec(pos)
    let start = toSec(op_start)
    let end = toSec(op_end)
    
    func skipOP() {
        if isOP(position, start, end) { position = end }
    }
    
    skipOP()
    
    for command in commands {
        switch command {
            case "prev":
                position -= 10
                position = max(position, 0)
                skipOP()
            case "next":
                position += 10
                position = min(position, videoLen)
                skipOP()
            default: continue
        }
    }
    
    
    return toMMss(position)
}

func isOP(_ target: Int, _ start: Int, _ end: Int) -> Bool {
    return target >= start && target <= end
}

func toSec(_ time: String) -> Int {
    var splited = time.split(separator: ":").map { Int($0)! }
    
    return splited[0] * 60 + splited[1]
}

func toMMss(_ sec: Int) -> String {
    let minute = sec / 60
    let second = sec % 60
    
    let mString = (minute >= 10) ? "\(minute)" : "0\(minute)"
    let sString = (second >= 10) ? "\(second)" : "0\(second)"
    
    return mString + ":" + sString
}