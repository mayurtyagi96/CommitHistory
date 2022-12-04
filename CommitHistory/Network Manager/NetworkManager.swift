//
//  NetworkManager.swift
//  CommitHistory
//
//  Created by Mayur Kant Tyagi on 04/12/22.
//

import Foundation
class NetworkManager{

//MARK:- API Call to get the data
    func apiCall(completion: @escaping(_ model: CommitModel?, _ isError: Bool) -> Void){
    
        let url = URL(string: "https://api.github.com/repos/mayurtyagi96/CommitHistory/commits")
        var urlRequest = URLRequest(url: url!)
        urlRequest.setValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = "GET"
        let tokken = "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"
        urlRequest.setValue("Bearer \(tokken)", forHTTPHeaderField: "Authorization")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, URLResponse, error in
           if let error = error{
               completion(nil,true)
               return print(error.localizedDescription)
            }
            if let data = data{
            let decoder = JSONDecoder()
                do{
                    let myModel = try decoder.decode(CommitModel.self, from: data)
                    print(myModel)
                    completion(myModel,false)
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
}
