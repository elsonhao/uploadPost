//
//  ViewController.swift
//  PostToSheet
//
//  Created by 黃毓皓 on 2017/7/13.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    let url = "https://sheetsu.com/apis/v1.0/c39dd83b8e27"
    
    
    
    @IBAction func upload(_ sender: UIButton) {
        uploadSothing(getstring: url)
        
    }
    
    func uploadSothing(getstring:String){
        if let getUrl = URL(string: getstring){
            var getRequest = URLRequest(url: getUrl)
            getRequest.httpMethod = "POST"
           let postStr =  "name=elson&grade=99"
             let uploadData = postStr.data(using: String.Encoding.utf8)
           let task =  URLSession.shared.uploadTask(with: getRequest, from: uploadData, completionHandler: { (getdata, response, errorr) in
                if errorr != nil{
                    print(errorr?.localizedDescription)
                }
                if getdata != nil{
                    do{
                     let json = try  JSONSerialization.jsonObject(with: getdata!, options: .mutableContainers) as! NSDictionary
                    print(json)
                    }catch{
                        
                    }
                }
            })
           task.resume()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

