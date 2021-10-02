//
//  ViewModel.swift
//  DependenctInjection
//
//  Created by Rahul Sharma on 02/10/21.
//

import Foundation
class ViewModel {
   
    /* _____________________  Contructor Injection ______________________ */
    var netWorkClass : NetWorkClass? = nil
    init(network: NetWorkClass) {
        self.netWorkClass = network
    }
    
  /* _____________________  Property Injection ______________________ */
//    var netWorkClass : NetWorkClass? = nil
    
    var modelArray = [Model]()
    
    
    
    func getComments(comletionHandler: @escaping(_ success: Bool) -> Void) {
        self.netWorkClass?.getAllPostJsonPlaceHolder(urlStr: "https://jsonplaceholder.typicode.com/comments", dataHandler: { data in
            self.setAlbumDataArrayIn(modeldataArray: data)
            comletionHandler(true)
        })
    }
    
    /// To set data in category list model array
    ///
    /// - Parameter modeldataArray: model data array to set in model
    private func setAlbumDataArrayIn(modeldataArray: [[String:Any]]){
        for modelData in modeldataArray{
            guard let data = modelData as? [String : Any] else{return}
            let modelData = Model(data: data)
            self.modelArray.append(modelData)
        }
    }
    
}
