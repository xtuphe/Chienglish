//
//  XSpeechControl.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/28.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import AVFoundation

open class XSpeechControl: NSObject, AVSpeechSynthesizerDelegate {
    static let shared = XSpeechControl.init()
    @objc public static func share() -> XSpeechControl {
        return shared
    }
    
    public let synthesizer = AVSpeechSynthesizer.init()
    
    override init() {
        super.init()
        setup()
    }
    
    func setup() {
        synthesizer.delegate = self
    }
    
    @objc open func read(text : String) {
        let utterance = AVSpeechUtterance.init(string: text)
        synthesizer.speak(utterance)
    }
    
    @objc open func stop() {
        synthesizer.stopSpeaking(at: .word)
    }
}
