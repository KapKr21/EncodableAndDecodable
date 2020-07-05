//
//  ViewController.swift
//  EncodableAndDecodableSample
//
//  Created by Kap's on 29/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func postData(_ sender: Any) {
        print("Posting Data")
        
        guard let url = URL(string: "http://18.217.185.253:3000/getpostscomment") else { fatalError() }
        
        let dataDictionary = ["user_lat"    : "30.7525",
                              "user_lng"    : "76.8101",
                              "my_id"       : "18",
                              "filter"      : "lam",]
        
        //let newPost = PostData(body: "Second dummy data", id: 26, title: "DummyData Second", userId: 001)
        
        //Making a request here
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        do {
//            try JSONSerialization.data(withJSONObject: dataDictionary, options: [])
////            let jsonBody = try JSONEncoder().encode(newPost)
////            request.httpBody = jsonBody
//
//        } catch {
//            print("Catched an error")
//        }
        
        //Making task
        let task = URLSession.shared.dataTask(with: request) { (jsonObject, _, _) in
            guard let jsonObject = jsonObject else { return }
            print(jsonObject)
            do {
                let data = try JSONSerialization.jsonObject(with: jsonObject, options: [])
                let dict = data as! NSDictionary
                if let users = dict["data"] as? [[String : Any]] {
                    for user in users {
                        //print(user["post_type"] as Any)
                        let checkData = user["post_type"] as! String
                        if checkData == "I" {
                            print("It is an Image")
                        } else {
                            print("It is a Video")
                        }
                    }
                }
                
//                let data = try JSONDecoder().decode(PostData.self, from: jsonObject)
//                print(data)
            } catch {
                print("Catched an error while getting jsonObject back")
            }
        }
        task.resume()
    }
    
    @IBAction func getData(_ sender: Any) {
        print("Getting Data")
        
        //guard let url = URL(string:"http://18.217.185.253:3000/getpostswithcomment") else { fatalError() }
        
        let queryItems = [URLQueryItem(name: "user_lat", value: "30.7525"),
                          URLQueryItem(name: "user_lng", value: "76.8101"),
                          URLQueryItem(name: "my_id", value: "18"),
                          URLQueryItem(name: "filter", value: "lam")]
        var urlComps = URLComponents(string: "http://18.217.185.253:3000/getpostscomment")!
        urlComps.queryItems = queryItems
        let result = urlComps.url!
        print(result)
        
        let task = URLSession.shared.dataTask(with: result) { (jsonData, _, _) in
            guard let jsonData = jsonData else { return }
            
            do {
                let data = try JSONSerialization.jsonObject(with: jsonData, options: [])
                print(data)
//                let data = try JSONDecoder().decode([Data].self, from: jsonData)
//                for data in data {
//                    print(data.data)
//                }
//                print("Could no do anything")
            } catch {
                print("Catched an error while getting data")
            }
        }
        task.resume()
    }
}

