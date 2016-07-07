//
//  RootViewController.swift
//  MadLibs
//
//  Created by 黄丽萍 on 16/7/6.
//  Copyright © 2016年 黄丽萍. All rights reserved.
//

import Cocoa

class RootViewController: NSViewController {
    @IBOutlet weak var pastTenseVerbTextField: NSTextField!

    @IBOutlet weak var goButton: NSButton!
  
    @IBOutlet var phraseTextView: NSTextView!
    @IBOutlet weak var leftComboBox: NSComboBox!
    @IBOutlet weak var popUpButton: NSPopUpButton!
    
    @IBOutlet weak var amountLabel: NSTextField!
   
    @IBOutlet weak var amountSlider: NSSlider!
    
    @IBOutlet weak var yellCheck: NSButton!
    @IBOutlet weak var resultTextField: NSTextField!
    @IBOutlet weak var checkBox: NSButton!
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var datePicker: NSDatePicker!
    var singularNouns: [String]!
    var pluralNuns:[String]!
    @IBAction func goButtonClick(_ sender: AnyObject) {
        
        // Past tense verb
        let pastTenseVerb = pastTenseVerbTextField.stringValue
        
        // Singular noun
        let singularNoun = leftComboBox.stringValue
        
        // Plural noun
        let pluralNoun = pluralNuns[popUpButton.indexOfSelectedItem]
        // Amount
        let amount = amountSlider.integerValue
        // Phrase
        let phrase = phraseTextView.string ?? ""

        // Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.longStyle
        let date = dateFormatter.string(from: datePicker.dateValue)
        
        // Create the mad lib sentence
        print("A \(singularNoun) \(pastTenseVerb) \(pluralNoun) and said, \(phrase)!")
        // Speak or SHOUT
        var voice = "said"
        if yellCheck.state == NSOnState {
            voice = "yelled"
        }
        // Create the mad lib sentence
        let results = "On \(date), at home a \(singularNoun) \(pastTenseVerb) \(amount) \(pluralNoun) and \(voice), \(phrase)!"
        // Display the mad lib sentence
        resultTextField.stringValue = results
        
        // Load the rage face image
//        imageView.image = NSImage(named: "face.png")
        imageView.image = NSImage(named: "face")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // ComboBox.
        singularNouns = ["dog", "muppet"]
        leftComboBox.removeAllItems()
        leftComboBox.addItems(withObjectValues: singularNouns)
        leftComboBox.selectItem(at:0)
        
        // PopUpButton
        pluralNuns = ["tacos", "rainbows", "iPhones", "gold coins"]
        popUpButton.removeAllItems()
        popUpButton.addItems(withTitles: pluralNuns)
        popUpButton.selectItem(at: 1)
        // PhraseTextView
        // Setup the default text to display in the text view
        phraseTextView.string = "Me coding Mac Apps!!!"
        //checkbox
        checkBox.state = NSOffState
            }
   
    @IBAction func sliderMoves(_ sender: AnyObject) {
        
        let amount = amountSlider.integerValue
        amountLabel.stringValue = "Amount: [\(amount)]"
        
    }
    @IBAction func radioClickd(_ sender: AnyObject) {
        
        
    }
    override func awakeFromNib() {
//        print("View controller instance with view: \(self.view)")
        pastTenseVerbTextField.stringValue = "ate"
    }
}
