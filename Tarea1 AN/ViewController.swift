//
//  ViewController.swift
//  Tarea1 AN
//
//  Created by LuisDaniel on 16/02/16.
//  Copyright (c) 2016 LuisDaniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
        
    
    @IBOutlet weak var resultado: UITextView!
    
    @IBOutlet weak var textfieldIsbn: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buscar(sender: AnyObject) {
        sincrono(self.textfieldIsbn.text)
        
    }
    
   
   
    @IBAction func limpiar(sender: AnyObject) {
        self.textfieldIsbn.text = nil
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sincrono(var x : String){
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+x
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding)
        
        if texto! == "{}" {
            self.resultado.text = "problemas con Internet"
        }else{
            self.resultado.text = String (texto!)
        }
      
    }
    
  
}