//
//  ViewController.swift
//  swift-bot
//
//  Created by Smit Shah on 18/6/16.
//  Copyright © 2016 Smit Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mesageList: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageText: UITextField!
    var gelato = [
        "coconut":0.25,
        "pistachio":0.26,
        "ctracciatella":0.02,
        "Chocolate":0.03,
        "peanut butter":0.01,
        "bubble Gum":0.01
    ]
    var location = [
        "coconut":"Smits house",
        "pistachio":"Palaks house",
        "ctracciatella":"Ryss house",
        "Chocolate":"Rajas housee",
        "peanut butter":"Panktis home",
        "bubble Gum":"mihirs home"
    ]
    var usersKeywords: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mesageList.text = "hi";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendButtonTouchUpInside(sender: AnyObject)
    {
        let returnedText = returnAnswer(messageText.text!);
        mesageList.text = "\(mesageList.text!) \n \(messageText.text!) \n \(returnedText)"
        messageText.text = "";
    }
    
    func returnAnswer(question: String) -> String {
        let question = question.lowercaseString;
        for(myKey,myValue) in gelato
        {
            if(((question.rangeOfString(myKey)) != nil) && (question.rangeOfString("price") != nil))
            {
                if(usersKeywords.contains(myKey))
                {
                    //do nothing
                }
                else
                {
                    usersKeywords.append(myKey)
                }
                return "The price of \(myKey) is \(myValue)"
            }
        }
        for(myKey,myValue) in location
        {
            if(((question.rangeOfString(myKey)) != nil) && (question.rangeOfString("find") != nil))
            {
                if(usersKeywords.contains(myKey))
                {
                    //do nothing
                }
                else
                {
                    usersKeywords.append(myKey)
                }
                return "The price of \(myKey) is \(myValue)"
            }
        }
        if((question.rangeOfString("find")) != nil)
        {
            return location[usersKeywords.last!]!
        }
        if((question.rangeOfString("price")) != nil)
        {
            return "\(gelato[usersKeywords.last!]!)"
        }
        return "I can't understood you!";
    }


}

