//
//  ApiHandler.swift
//  AlamofireWithSPM
//
//  Created by Sainath Bamen on 11/09/23.
//

import Foundation
import Alamofire


class ApiHandler{
    static let shareInstance = ApiHandler()
    
    func fetchingAPIData(handler: @escaping(_ apiData:[Model])-> (Void)){
        let url = "https://jsonplaceholder.typicode.com/posts/"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            responce in
            switch responce.result{
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode([Model].self, from: data!)
                    print(jsonData)
                }catch{
                    // closure calling.

                    
                }
            case .failure(let error):
                print(error.localizedDescription)
             
            }
        }
    }
}



struct Model:Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    
    
}
