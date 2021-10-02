//
//  APIManager.swift
//  KreditBeeInterView
//
//  Created by Rahul Sharma on 17/07/21.
//

import Foundation

class NetWorkClass: NSObject {
    static var shared: NetWorkClass = {
        let network = NetWorkClass()
        return network
    }()

    func getAllPostJsonPlaceHolder(urlStr: String, dataHandler: @escaping ([[String:Any]])->Void) {
            
            let serviceURL = URL.init(string: urlStr)!
            
            var myurlRequest = URLRequest(url: serviceURL)
            
            myurlRequest.httpMethod = "GET"
            
            myurlRequest.allHTTPHeaderFields = ["Content-type": "application/json; charset=UTF-8"]
            
            let serviceSession = URLSession.shared
            
            serviceSession.dataTask(with: myurlRequest) { (incomingJsonDATA, serverResponse, err) in
                
                if err == nil {
                   
                    do{
                        let jsonObjectDataModel =  try JSONSerialization.jsonObject(with: incomingJsonDATA!, options: .mutableContainers) as! [[String:Any]]
                        // transfer the data Model to UI
                        dataHandler(jsonObjectDataModel)
                        
                    }catch let err {
                        print(err.localizedDescription)
                    }
                }
            }.resume()
            
            
        }
}

