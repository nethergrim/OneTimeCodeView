//
//  OneTimeCodeView.swift
//  OneTimeCodeView
//
//  Created by Андрей Дробязко on 04.05.2020.
//  Copyright © 2020 Andrii Drobiazko. All rights reserved.
//

import Foundation
import UIKit

class OneTimeCodeView: UITextField {
    
    var didEnterLastDigit: ((String) -> Void)?
    var defaultChar = "-"
    
    private var isConfigured = false
    private var labels = [UILabel]()
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(countOfDigits: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured = true
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
         if #available(iOS 12.0, *) {
                   textContentType = .oneTimeCode
               } else {
                   // Fallback on earlier versions
               }
        addTarget(self, action: #selector(textChanged), for: .editingChanged)
        delegate = self
        let labelsStackView = createLabels(count: countOfDigits)
        addSubview(labelsStackView)
        addGestureRecognizer(tapRecognizer)
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    
    private func createLabels(count: Int) -> UIStackView {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 1 ... count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 36)
            label.isUserInteractionEnabled = true
            label.text = defaultChar
            sv.addArrangedSubview(label)
            labels.append(label)
        }
        
        return sv
    }
    
    @objc
    private func textChanged() {
        guard let text = self.text, text.count <= labels.count else { return }
        for i in 0 ..< labels.count {
            let label = labels[i]
            if (i < text.count) {
                let index = text.index(text.startIndex, offsetBy: i)
                label.text = String(text[index])
            } else {
                label.text = defaultChar
            }
        }
        
        if text.count == labels.count {
            didEnterLastDigit?(text)
        }
    }
    
    
}

extension OneTimeCodeView: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < labels.count || string == ""
    }

}
