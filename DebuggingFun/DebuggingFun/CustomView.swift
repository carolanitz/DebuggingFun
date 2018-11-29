//
//  CustomView.swift
//  DebuggingFun
//
//  Created by Carola Nitz on 11/11/18.
//  Copyright © 2018 Carola Nitz. All rights reserved.
//

import AppKit

public class CustomView: NSView {
    @IBOutlet var textfield: NSTextField?
    @IBOutlet var hiddenImage: NSImageView?
    @IBOutlet var imageToHide: NSImageView?
    private var secretHiddenVarThatYouNeedToChange = false
    private var hashitHint = false
    var path: URL? = nil

    override public func awakeFromNib() {

        DispatchQueue.global().async {
            while(self.secretHiddenVarThatYouNeedToChange == false || !self.hashitHint) {
                self.youShouldOpenTheFileNamedInstructionByPrintingThePathVar()
                if (self.secretHiddenVarThatYouNeedToChange && !self.hashitHint) {

                    print("Uh some Images have shown up. Can you find out how to change UI elements and see the result without continuing? Hint after changing UI use CATransAction.flush()")
                    self.hashitHint = true
                    DispatchQueue.main.async {
                        self.hiddenImage?.isHidden = false
                        self.imageToHide?.isHidden = false
                    }
                }
            }
        }
    }

    @objc func tink() {
        path = Bundle.main.url(forResource: "instruction", withExtension: "")
        print("")
    }

    func youShouldOpenTheFileNamedInstructionByPrintingThePathVar(){
        self.tink()
    }

    func changeLabel() {
        textfield?.stringValue = """
        In general you can control the flow by writing \"continue\" and \"step in\". But now we're going to learn how to not only set a brekapoint.
        We're going to edit a breakpoint to execute a command and not any command, We're going to make them play a sound and continue.
        I would like you to set a breakpoint on the method tink. step twice (with s) and now you add a command with
        breakpoint command add <breakpt-id>, for example: br com add 1
        you can add sounds, conditions and even add --autocontinue. For now add 'bt' and hit DONE to get a backtrace and look at the methods listed
        """
    }

}
