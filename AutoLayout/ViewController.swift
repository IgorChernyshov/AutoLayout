//
//  ViewController.swift
//  AutoLayout
//
//  Created by Igor Chernyshov on 25.06.2021.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let label1 = UILabel()
		label1.backgroundColor = UIColor.red
		label1.text = "THESE"

		let label2 = UILabel()
		label2.backgroundColor = UIColor.cyan
		label2.text = "ARE"

		let label3 = UILabel()
		label3.backgroundColor = UIColor.yellow
		label3.text = "SOME"

		let label4 = UILabel()
		label4.backgroundColor = UIColor.green
		label4.text = "AWESOME"

		let label5 = UILabel()
		label5.backgroundColor = UIColor.orange
		label5.text = "LABELS"

		let labels = [label1, label2, label3, label4, label5]
		var viewsDictionary = [String: UILabel]()
		for (index, label) in labels.enumerated() {
			viewsDictionary["label\(index)"] = label
		}

		var previous: UILabel?

		labels.forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.sizeToFit()
			view.addSubview($0)

			// Constraints
			$0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
			$0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true

			$0.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: -10).isActive = true

			if let previous = previous {
				$0.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
			} else {
				$0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
			}
			previous = $0
		}
	}

	private func createVFLConstraints(viewsDictionary: [String: UIView]) {
		// An example of Visual Formatting Language constraints
		viewsDictionary.keys.forEach {
			view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\($0)]|", options: [], metrics: nil, views: viewsDictionary))
		}

		let metrics = ["labelHeight": 88]
		view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]->=10-|", options: [], metrics: metrics, views: viewsDictionary))
	}
}
