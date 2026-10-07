import std/times

let d = initDuration(hours = 1, minutes = 30, seconds = 15)
echo d
echo d.inSeconds
let t = dateTime(2024, mMar, 15, 12, 0, 0, zone = utc())
echo t.format("yyyy-MM-dd HH:mm")
echo (t + 2.days).format("yyyy-MM-dd")
echo t.weekday
