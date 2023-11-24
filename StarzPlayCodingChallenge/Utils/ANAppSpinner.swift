//
//  ANAppSpinner.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation
import ANActivityIndicator

class ANAppSpinner {
    static let shared: ANAppSpinner = ANAppSpinner()

    private init() {
    }
}

extension ANAppSpinner: AppSpinnerProtocol {
    func show() {
        DispatchQueue.main.async {
            ANActivityIndicatorPresenter.shared.showIndicator()
        }
    }

    func hide() {
        DispatchQueue.main.async {
            ANActivityIndicatorPresenter.shared.hideIndicator()
        }
    }
}
