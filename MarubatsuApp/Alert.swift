//
//  Alert.swift
//  MarubatsuApp
//
//  Created by 松尾有紗 on 2021/11/08.
//

import UIKit

class Alert: UIAlertController {
    func showAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
}
