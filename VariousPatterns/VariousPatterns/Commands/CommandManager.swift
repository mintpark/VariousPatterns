//
//  CommandManager.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class CommandManager {
    static var sharedManager: CommandManager {
        struct Static {
            static let instance: CommandManager = CommandManager()
        }
        return Static.instance
    }
    
    fileprivate var commands: [String: WireFrameCommand]
    
    init() {
        self.commands = [:]
    }
    
    func registerCommand(_ command: WireFrameCommand, key: String) {
        if self.commands.keys.contains(key) { return }
        
        self.commands[key] = command
        NotificationCenter.default.addObserver(self, selector: #selector(listenCommandNotification(_:)), name: NSNotification.Name(key), object: nil)
    }
    
    @objc func listenCommandNotification(_ notification: Notification) {
        if let command = self.commands[notification.name.rawValue] {
            _ = command.excute(notification)
        }
    }
}
