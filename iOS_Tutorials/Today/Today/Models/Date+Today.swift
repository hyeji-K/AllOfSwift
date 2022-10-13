//
//  Date+Today.swift
//  Today
//
//  Created by heyji on 2022/10/13.
//

import Foundation

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened)
        // 앱은 현재 달력 날짜에 예약된 미리 알림에 대해 미리 알림 날짜를 "오늘 오후 3시"로 표시하여 긴박감을 전달합니다. 미리 알림 날짜가 현재 날짜가 아닌 경우 "Oct 22 at 3:00 PM"과 같은 문자열을 사용합니다.
        if Locale.current.calendar.isDateInToday(self) {
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else {
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            // 이 날짜가 현재 달력 날짜인 경우 정적 문자열을 반환
            return NSLocalizedString("Today", comment: "Today due date description")
        } else {
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}


