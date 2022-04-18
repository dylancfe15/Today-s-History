//
//  HomeHeaderStackView.swift
//  Today's History
//
//  Created by Difeng Chen on 4/17/22.
//

import UIKit

protocol HomeHeaderStackViewDelegate: AnyObject {

    func toPreviousDay()
    func toNextDay()
}

class HomeHeaderStackView: UIStackView {
    // MARK: - Views
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [toPreviousDayButton, toNextDayButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var toPreviousDayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous Day", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.delegate?.toPreviousDay()
        }), for: .touchUpInside)
        return button
    }()

    private lazy var toNextDayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next Day", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.delegate?.toNextDay()
        }), for: .touchUpInside)
        return button
    }()

    // MARK: - Properties

    weak var delegate: HomeHeaderStackViewDelegate?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)

        configureUI()
    }

    // MARK: - Functions

    private func configureUI() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(buttonStackView)

        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        axis = .vertical
        alignment = .center
    }

    func setTitle(with date: Date) {
        let formatter = DateFormatter()

        formatter.dateFormat = "MM/dd/yyyy"

        titleLabel.text = formatter.string(from: date)
    }
}
