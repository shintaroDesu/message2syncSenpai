//
//  SettingViewController.swift
//  message2sync
//
//  Created by yuitora . on 30/10/2018.
//  Copyright © 2018 yuitora . All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {
	
	let screenWidth = UIScreen.main.bounds.width
	let screenHeight = UIScreen.main.bounds.height
	
	let xServerField = UIScreen.main.bounds.width/2
	let yServerField = UIScreen.main.bounds.height * 0.2
	let scrollView = UIScrollView()
	
	private func setupTextField() {
		let textfield = TextField(placeholder: "Enter server address here",
								  x: Int(xServerField), y: Int(yServerField))
		textfield.sampleTextField.delegate = self
		self.scrollView.addSubview(textfield.sampleTextField)
	}
	
	private func setupScrollView() {
		scrollView.frame = CGRect(x: 0, y: screenHeight * 0.05, width: screenWidth, height: screenHeight * 0.8)
		scrollView.contentSize = CGSize(width: screenWidth, height: 0)
		self.view.addSubview(scrollView)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupScrollView()
		setupTextField()
	}
	
	func rmSubview() {
		self.view.removeFromSuperview()
	}

}
