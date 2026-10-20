import Foundation

var cal = Calendar(identifier: .gregorian)
cal.timeZone = TimeZone(identifier: "UTC")!
let d = cal.date(from: DateComponents(year: 2024, month: 2, day: 28, hour: 12))!
let next = cal.date(byAdding: .day, value: 2, to: d)!
let f = DateFormatter()
f.dateFormat = "yyyy-MM-dd EEE"
f.timeZone = cal.timeZone
f.locale = Locale(identifier: "en_US_POSIX")
print(f.string(from: d), f.string(from: next))
print(cal.dateComponents([.day], from: d, to: next).day!, cal.component(.weekday, from: d))
print(Int(next.timeIntervalSince(d)) / 3600)
