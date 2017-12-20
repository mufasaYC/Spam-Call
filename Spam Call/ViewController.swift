//
//  ViewController.swift
//  Spam Call
//
//  Created by Mustafa Yusuf on 14/06/17.
//  Copyright © 2017 Mustafa Yusuf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var numberTextfield: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		if let x: String = UserDefaults.standard.value(forKey: "number") as? String {
			numberTextfield.text = x
		}
	}

	@IBAction func spam(_ sender: UIButton) {
		//BEGIN SPAM CALLING
		UserDefaults.standard.setValue(numberTextfield.text, forKey: "number")
		UserDefaults.standard.setValue(true, forKey: "shouldCall")
		if let phoneCallURL = URL(string: "tel://\(numberTextfield.text!)") {
			let application:UIApplication = UIApplication.shared
			if (application.canOpenURL(phoneCallURL)) {
				if #available(iOS 10.0, *) {
					application.open(phoneCallURL, options: [:], completionHandler: nil)
				} else {
					UIApplication.shared.openURL(phoneCallURL)
				}
			}
		} else {
			UserDefaults.standard.setValue(false, forKey: "shouldCall")
		}
		
	}

}

extension UITextField {
	
	func setLeftPaddingPoints(_ amount:CGFloat){
		let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
		self.leftView = paddingView
		self.leftViewMode = .always
	}
	func setRightPaddingPoints(_ amount:CGFloat) {
		let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
		self.rightView = paddingView
		self.rightViewMode = .always
	}
}
