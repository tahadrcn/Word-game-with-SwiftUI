//
//  AnViewController.swift
//  yazlab2.2
//
//  Created by Taha Dirican on 6.04.2023.
//

import Foundation
import SwiftUI
class AnViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.size.height)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
