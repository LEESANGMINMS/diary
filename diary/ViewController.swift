//
//  ViewController.swift
//  diary
//
//  Created by sang minlee on 2017. 3. 9..
//  Copyright © 2017년 LeeSangMin.house. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textInput: UITextField!
    
    //@IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var textArea: UITextView!
    
    //@IBOutlet weak var contentLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        let text = textInput.text
      //  textLabel.text = text
        
        let content = textArea.text
      // contentLabel.text = content
        
        let article = Article(context: context)
        article.title = text
        article.content = content
        article.createdAt = NSDate()
        appDelegate.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

