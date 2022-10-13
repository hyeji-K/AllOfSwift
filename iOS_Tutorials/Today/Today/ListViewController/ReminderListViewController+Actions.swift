//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by heyji on 2022/10/13.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
