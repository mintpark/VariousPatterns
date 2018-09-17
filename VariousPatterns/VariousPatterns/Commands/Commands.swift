//
//  Commands.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class WireFrameCommand: NSObject {
    func excute(_ notification: Notification) -> Bool? {
        return nil
    }
}

extension WireFrameCommand {
    func push(_ view: UIViewController?) {
        guard let currentVC = getCurrentView(), let view = view else { return }
        
        currentVC.navigationController?.pushViewController(view, animated: true)
    }
    
    func present(_ view: UIViewController?, completion: (() -> Void)? = nil) {
        guard let currentVC = getCurrentView(), let view = view else { return }
        
        currentVC.present(view, animated: true, completion: completion)
    }
    
    func getCurrentView() -> UIViewController? {
        guard let rootVC = UIApplication.shared.delegate?.window??.rootViewController else { return nil }
        
        var vc: UIViewController = rootVC
        while (vc.presentedViewController != nil
            && vc.presentedViewController?.isMovingToParentViewController == false
            && vc.presentedViewController?.isBeingDismissed == false) {
                vc = rootVC.presentedViewController!
        }
        
        if let navCtrl = vc as? UINavigationController, let topVC = navCtrl.topViewController {
            vc = topVC
        }
        
        return vc
    }
}

extension NSObject {
    func post(notificationName: String, product: Product? = nil, sync: Bool = true) {
        let notification = Notification(name: Notification.Name.init(notificationName), object: product, userInfo: nil)
        
        if sync == true {
            NotificationCenter.default.post(notification)
        } else {
            NotificationQueue.default.enqueue(notification, postingStyle: .asap)
        }
    }
}
