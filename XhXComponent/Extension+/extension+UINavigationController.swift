//
//  extension+UINavigationController.swift
//  XhXComponent
//
//  Created by 박준하 on 3/29/25.
//

import UIKit

public extension UINavigationController {
    func pushVC<T: UIViewController>(_ viewControllerType: T.Type,
                                     animated: Bool = true,
                                     completion: (() -> Void)? = nil) {
        let vc = T.init()
        self.pushViewController(vc, animated: animated)
        
        if let completion = completion {
            CATransaction.setCompletionBlock(completion)
        }
    }
}
