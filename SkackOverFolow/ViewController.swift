//
//  ViewController.swift
//  SkackOverFolow
//
//  Created by Dương chãng on 5/7/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textview: UITextView!
    
    let urlString = "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getDataFromApi(urlString)
        
        // Do any additional setup after loading the view.
    }
    func getDataFromApi(_ urlstr: String) {
        
        let url = URL(string: urlstr)
        var requese = URLRequest(url: url! )
        
        // cấu hính cho reques
        requese.httpMethod = "GET"
        
        // tạo task lấy dữ liệu
        // thêm weak self
        let dataTask = URLSession.shared.dataTask(with: requese) { [ weak self] (data, response, error) in
            
            guard let data = data, let response = response as? HTTPURLResponse else {return}
            
            guard let strongself = self else {return}
            
            
            if response.statusCode == 200 {
                do {
                    let result = try JSONDecoder().decode(ResuthObject.self, from: data)
                    for itemss in result.items  {
                        DispatchQueue.main.async {
                            strongself.textview.text += """
                            \(itemss.title)
                            \(itemss.score)
                            \n
                            """
                        }
                    }
                    
                }catch{
                    print("error: \(error)")
                }
            }else{
                print("statuscode: \(response.statusCode)")
            }
            
        }
        // kết thúc task
        dataTask.resume()
        
    }
}
