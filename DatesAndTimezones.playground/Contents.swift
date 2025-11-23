import Foundation

/// This function help us have our current date with a GTM offset
/// This solves a problem when comparing dates, for example if we have 14:28 UTC when printing this date we will get 20:28
/// As you see that makes the comparisson with remote dates flaky, for that reason we substract the offset (-6 in case of Mexico),
/// but the function is generic so it does not really matter where we are
private func getComparableGMTDate() -> Date {
    let date = Date()
    let timezone = TimeZone.current
    let hoursFromGMT: Int = Int(TimeInterval(timezone.secondsFromGMT(for: Date())) / (60*60))

    return Calendar.current.date(byAdding: .hour, value: hoursFromGMT, to: date) ?? date

}

var date = Date()

date.ISO8601Format()

Calendar.current.timeZone

Calendar.current.identifier

Calendar.current.locale

let formatter = ISO8601DateFormatter()
formatter.timeZone = Calendar.current.timeZone
formatter.string(from: date)

let formatter2 = ISO8601DateFormatter()
formatter2.timeZone = TimeZone(secondsFromGMT: 0)
let stringDate = formatter2.string(from: date)

formatter2.date(from: stringDate)

let timezone = TimeZone.current
let hoursFromGMT: Int = abs(Int(TimeInterval(timezone.secondsFromGMT(for: Date())) / (60*60)))

Calendar.current.date(byAdding: .hour, value: hoursFromGMT, to: date)
