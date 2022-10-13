//
//  ListViewController+DataSource.swift
//  Today
//
//  Created by heyji on 2022/10/13.
//

import UIKit

extension ReminderListViewController {
    // 미리 알림 목록에 대한 데이터 소스 역할을 하는 모든 동작이 포함
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
        let reminder = Reminder.sampleData[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = reminder.title
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration
        
        var doneButtonConfiguration = doneButtonConfiguration(for: reminder)
        doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
        cell.accessories = [.customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always)]
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .todayListCellBackground
        // backgroundConfiguration.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.9, alpha: 1.0)
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1) // 기호는 이미지이지만 글꼴 스타일과 같이 텍스트와 연관되는 많은 특성을 지원합니다.
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
//        let otherImage = UIImage(systemName: "pencil", withConfiguration: symbolConfiguration)
//        button.setImage(otherImage, for: .highlighted)
        
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
