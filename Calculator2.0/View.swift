//
//  View.swift
//  Calculator2.0
//
//  Created by Filipp Krupnov on 10/16/20.
//

import UIKit

class CalcView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let calcGridStackView = UIStackView()
        calcGridStackView.axis = .vertical
        calcGridStackView.distribution = .fillEqually
        calcGridStackView.spacing = 0.6
        calcGridStackView.translatesAutoresizingMaskIntoConstraints = false
    
        let calcTextField = UITextField()
        calcTextField.backgroundColor = .darkGray
        calcTextField.text = "0"
        calcTextField.font = UIFont(name: "Helvetica-Light", size: 48)
        calcTextField.textAlignment = .right
        calcTextField.textColor = .white
        calcTextField.contentVerticalAlignment = .bottom
        calcGridStackView.addArrangedSubview(calcTextField)
        
        let btnsValues = [["0", ".", "="], ["1", "2", "3", "+"], ["4", "5", "6", "-"], ["7", "8", "9", "x"], ["AC", "+/-", "%", "/"]]
        for buttonValuesArray in btnsValues.reversed() {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 0.6
            rowStackView.distribution = .fillEqually
            
 
            
            for buttonValue in buttonValuesArray {
                let button = UIButton()
                button.setTitle(buttonValue, for: .normal)
                button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 26.0)
                if buttonValue == buttonValuesArray.last {
                    button.backgroundColor = .orange
                } else {
                    if btnsValues.last == buttonValuesArray {
                        button.backgroundColor = .gray
                    } else {
                        button.backgroundColor = .lightGray
                    }
                }
                rowStackView.addArrangedSubview(button)
            }
            calcGridStackView.addArrangedSubview(rowStackView)
        }
    
        
        addSubview(calcGridStackView)
        setupLayout(calcGridStackView: calcGridStackView)
        
        setNeedsUpdateConstraints()
    }
    
    private func setupLayout(calcGridStackView: UIStackView) {
        let calcGridStackViewConstraints = [
            calcGridStackView.topAnchor.constraint(equalTo: topAnchor),
            calcGridStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            calcGridStackView.leftAnchor.constraint(equalTo: leftAnchor),
            calcGridStackView.rightAnchor.constraint(equalTo: rightAnchor)
        ]
        NSLayoutConstraint.activate(calcGridStackViewConstraints)
    }
}
