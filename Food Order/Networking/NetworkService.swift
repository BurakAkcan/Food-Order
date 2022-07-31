//
//  NetworkService.swift
//  Food Order
//
//  Created by Burak AKCAN on 30.07.2022.
//

import Foundation
import MapKit

struct NetworkService{
    
     func createRequest(route:Route,method:Method,parameter:[String:Any]?=nil)->URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else{return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        if let params = parameter {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map{URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
           
            }
        }
        return urlRequest
        
    }
    
  
    
}
