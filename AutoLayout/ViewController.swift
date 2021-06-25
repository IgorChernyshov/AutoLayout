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

		let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]

		viewsDictionary.values.forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.sizeToFit()
			view.addSubview($0)
		}

		viewsDictionary.keys.forEach {
			view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\($0)]|", options: [], metrics: nil, views: viewsDictionary))
		}
		view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]", options: [], metrics: nil, views: viewsDictionary))
	}
}

