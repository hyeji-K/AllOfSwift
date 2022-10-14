//
//  TextFieldContentView.swift
//  Today
//
//  Created by heyji on 2022/10/14.
//

import UIKit

class TextFieldContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        var onChange: (String)->Void = { _ in } // 이 빈 클로저는 사용자가 텍스트 필드의 텍스트를 편집할 때 수행하려는 동작을 포함합니다.
        
        func makeContentView() -> UIView & UIContentView {
            return TextFieldContentView(self)
        }
    }
    
    let textField = UITextField()
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        // 먼저 크기가 없는 보기를 초기화한 다음 제약 조건을 사용하여 최종 레이아웃을 제어합니다.
        super.init(frame: .zero)
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.addTarget(self, action: #selector(didChange(_:)), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        textField.text = configuration.text
    }
    
    @objc private func didChange(_ sender: UITextField) {
        guard let configuration = configuration as? TextFieldContentView.Configuration else { return }
        configuration.onChange(textField.text ?? "")
    }
}

extension UICollectionViewListCell {
    func textFieldConfiguration() -> TextFieldContentView.Configuration {
        TextFieldContentView.Configuration()
    }
}
