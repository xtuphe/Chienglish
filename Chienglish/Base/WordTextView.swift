//
//  WordTextView.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/13.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import KUIPopOver

class WordTextView: UITextView {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 获取当前触摸位置的字符所属的字母(提示：触摸位置需向下调整10个点，以便与文本元素对齐)
        let touch = touches.first!
        var touchPoint = touch.location(in: self)
        touchPoint.y -= 10

        // 获取点击的字母的位置
        let characterIndex = self.layoutManager.characterIndex(for: touchPoint, in: self.textContainer
            , fractionOfDistanceBetweenInsertionPoints: nil)
        // 过滤非英文
        let string = self.attributedText.string
        let char = string[string.index(string.startIndex, offsetBy: characterIndex)]
        if !isLetter(char: char) {
            super.touchesBegan(touches, with: event)
            return
        }
        // 获取单词的范围。range 由起始位置和长度构成。
        let range = getWordRange(characterIndex: characterIndex)
        highlightWord(range: range)
        let word = stringFromNSRange(range: range, string: string)
        showReferenceView(word: word, touchPoint: touchPoint)
        super.touchesBegan(touches, with: event)
    }

    func getWordRange(characterIndex: Int) -> NSRange {
        var left = characterIndex - 1
        var right = characterIndex + 1
        let string = self.attributedText.string
        // 往左遍历直到空格
        while left >= 0 {
            let char = string[string.index(string.startIndex, offsetBy: left)]
            if isLetter(char: char) {
                left -= 1
            } else {
                break
            }
        }
        // 往右遍历直到空格
        while right < text.count {
            let char = string[string.index(string.startIndex, offsetBy: right)]
            if isLetter(char: char) {
                right += 1
            } else {
                break
            }
        }
        return NSMakeRange(left + 1, right - left - 1)
    }
    
    func isLetter(char : Character) -> Bool {
        if char.asciiValue == nil {
            return false
        }
        if (char.asciiValue! >= UInt8(65) && char.asciiValue! <= UInt8(90)) ||
            (char.asciiValue! >= UInt8(97) && char.asciiValue! <= UInt8(122)) {
            return true
        }
        return false
    }
    
    func highlightWord(range : NSRange){
        let attrStr = NSMutableAttributedString.init(string: attributedText.string, attributes: [NSAttributedString.Key.font : font ?? UIFont.systemFont(ofSize: 17)])
        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.black,
                                NSAttributedString.Key.backgroundColor : UIColor.yellow], range: range)
        attributedText = attrStr
    }
    
    func stringFromNSRange(range : NSRange, string : String) -> String{
        let startIndex = string.index(string.startIndex, offsetBy: range.location)
        let endIndex = string.index(string.startIndex, offsetBy: range.location + range.length)
        return String(string[startIndex ..< endIndex])
    }
    
    func showReferenceView(word : String, touchPoint : CGPoint) {
        let refVC = XReferenceVC.init(term: word)
        refVC.term = word
        let tapView = UIView.init(frame: CGRect.init(origin: touchPoint, size: CGSize.init(width: word.count * 3, height: 25)))
        addSubview(tapView)
        refVC.showPopover(sourceView: tapView, sourceRect: nil, shouldDismissOnTap: true) {
            tapView.removeFromSuperview()
        }
    }
}
