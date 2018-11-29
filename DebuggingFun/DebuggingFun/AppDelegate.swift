//
//  AppDelegate.swift
//  DebuggingFun
//
//  Created by Carola Nitz on 11/3/18.
//  Copyright © 2018 Carola Nitz. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var checkForBeingDebugged = true

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        DispatchQueue.global(qos: .userInitiated).async {
            while (self.checkForBeingDebugged) {

                if AmIBeingDebugged() {
                    fatalError("Success!! You just attached to this Process. \n Now you're going to learn how to set a breakpoint in lldb before attaching to this process in order to not hit the fatalError and how to change a variable at runtime \\o/ read until the end. Quit the app and exit lldb with 'quit'. You immediatly attach to a process when it starts by typing into the terminal 'lldb' and then (lldb) process attach --name DebuggingFun --waitfor . Then set a breakpoint in the line where you want to make changes. \n You do that by writing b <filename with extension>:<linenumber> once you've done that correctly the console tells you where it set the breakpoint. The command continue will continue the process and you should hit the breakpoint and now you can print self.checkForBeingDebugged with po self.checkForBeingDebugged. and now you can change it's value by writing po self.checkForBeingDebugged = false. Try it!")
                }
            }
        }

        if let customeView = NSApplication.shared.keyWindow?.contentView as? CustomView {
            customeView.changeLabel()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

