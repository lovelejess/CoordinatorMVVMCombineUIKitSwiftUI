//
//  FirstViewController.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Combine
import UIKit

class FirstViewController: UIViewController {

    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var detailButton: UIButton = {
       let button = UIButton()
        button.setTitle("Go to Details", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(onButtonPress), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var viewModel: FirstTabViewModel!
    var showDetailRequested: () -> () = {}
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        viewModel.$email.combineLatest(viewModel.$name)
            .sink { [weak self] (email, name) in
                guard let self = self else { return }
                if name.count + email.count > 0 {
                    self.infoLabel.text = "\(name) with email: \(email)"
                } else {
                    self.infoLabel.text = ""
                }
            }.store(in: &subscriptions)
    }

    private func addViews() {
        view.addSubview(infoLabel)
        view.addSubview(detailButton)
        setupLayoutForInfoLabel()
        setupLayoutForDetailButton()
    }

    @objc
    private func onButtonPress() {
        showDetailRequested()
    }

    private func setupLayoutForInfoLabel() {
        let constraints = [
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 300),
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setupLayoutForDetailButton() {
        let constraints = [
            detailButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 100),
            detailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailButton.widthAnchor.constraint(equalToConstant: 200),
            detailButton.heightAnchor.constraint(equalToConstant: 60),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
