//
//  DetailViewControllerReminderViewController+Section.swift
//  Today
//
//  Created by heyji on 2022/10/14.
//

import UIKit

extension ReminderViewController {
    // Hashable 데이터 원본이 해시 값을 사용하여 데이터의 변경 사항을 결정 하기 때문에 섹션 및 항목 식별자 유형을 준수해야 합니다 .
    enum Section: Int, Hashable {
        case view
        case title
        case date
        case notes
        
        var name: String {
            switch self {
            case .view: return ""
            case .title:
                return NSLocalizedString("Title", comment: "Title section name")
            case .date:
                return NSLocalizedString("Date", comment: "Date section name")
            case .notes:
                return NSLocalizedString("Notes", comment: "Notes section name")
            }
        }
    }
}

