//
//  ViewController.swift
//  Basic user eligibility
//
//  Created by BilalSamoon on 2023-08-03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfAge : UITextField!
    @IBOutlet var lblOutput : UILabel!

    
    private var name : String = ""
    private var age : Int = 0
    private var outputMessage : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtnCreateAccountClicked(){
        self.name = self.tfName.text ?? "Unknown"
        
        if(self.tfAge != nil){
            self.age = Int(self.tfAge.text!) ?? -1
        }
        
        if(self.age >= 18){
            self.lblOutput.text = "\(self.name ) is eligible to create Account"
            print(self.lblOutput.text = "\(self.name ) is eligible to create Account")
        }
        else{
            self.lblOutput.text = "\(self.name) is not eligible to create account"
            print(self.lblOutput.text = "\(self.name) is not eligible to create account")
        }
    }


}

