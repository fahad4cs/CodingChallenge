//
//  UIVeiwController.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation
import UIKit
/* added to show the Alert on the screen so that commonly  displayed from same place */
extension UIViewController {
    // MARK: - Alert with One button and completion handler
    func showAlertSingleCompletionOneBtn(title: String!, message: String!, buttonTilte: String!, successCallback: @escaping VoidHandler) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTilte, style: UIAlertAction.Style.default, handler: { (_) in
            successCallback()
        }))
        self.present(alert, animated: true, completion: nil)
    }

}
