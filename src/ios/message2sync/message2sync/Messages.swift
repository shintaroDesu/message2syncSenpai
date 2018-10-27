//
//  Messages.swift
//  testboi
//
//  Created by yuitora . on 24/10/2018.
//  Copyright © 2018 yuitora . All rights reserved.
//

import Foundation
import UIKit

class Messages {
	let manager: Manager
	var staticHeight = 0
	let normalWidth = UIScreen.main.bounds.width * 0.9
	let normalHeight = UIScreen.main.bounds.height * 0.9
	
	let screenWidth = UIScreen.main.bounds.width
	let screenHeight = UIScreen.main.bounds.height
	init() {
		manager = Manager()
	}
	
	func setupTextView(_ textview: inout UITextView, _ text: String, _ x: Int, _ y: Int) {
		textview.isScrollEnabled = false
		textview.font = UIFont.preferredFont(forTextStyle: .footnote)
		textview.textColor = .black
		textview.textAlignment = .center
		textview.isEditable = false
		textview.text = text
		textview.center = CGPoint(x: 0, y: y)
		let fixedWidth = UIScreen.main.bounds.width
		let newSize = textview.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
		textview.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
	}
	
	func createTextView() -> [UITextView] {
		let lines = manager.getRelevantLines()
		var mytextviews = [UITextView]()
		var max: Int
		if lines.count > 20 {
			max = 20
		} else {
			max = lines.count - 1
		}
		for index in stride(from: max, to: 0, by: -1) {
			var textview = UITextView()
			setupTextView(&textview, lines[index], 0, staticHeight)
			mytextviews.append(textview)
			staticHeight += Int(textview.frame.height)
		}
		
		return mytextviews
	}
	
	func createTextField() -> UITextField {
		let sampleTextField =  UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.9, height: 30))
		sampleTextField.placeholder = "Enter text here"
		sampleTextField.font = UIFont.systemFont(ofSize: 15)
		sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
		sampleTextField.autocorrectionType = UITextAutocorrectionType.no
		sampleTextField.keyboardType = UIKeyboardType.default
		sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
		sampleTextField.enablesReturnKeyAutomatically = true
		sampleTextField.autocapitalizationType = .none
		sampleTextField.smartQuotesType = .no
		
		let y = normalHeight
		let x = screenWidth/2
		sampleTextField.center = CGPoint(x: x, y: y)
		return sampleTextField
	}
}

