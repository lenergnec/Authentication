//
//  Webservice.swift
//  Authentication
//
//  Created by Lener Gonzalez on 21/4/23.
//

import Foundation

func login(){
    
    guard let url = URL(string: "http://api.avatar-crm.com/api/v1/token/") else {
        print("Url no valida")
        return
    }
    
    let parameters = ["email": "admin@example.com", "password": "1234"]
    let session = URLSession.shared
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do{
        request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
    } catch let error {
        print(error.localizedDescription)   
        return
    }
    
    let task = session.dataTask(with: request) {data, response, error in
        if error != nil || data == nil{
            print("error en la solicitud")
            return
        }
        
        guard let httResponse = response as? HTTPURLResponse, (200...299).contains(httResponse.statusCode) else {
            print("error en la respuesta del server")
            return
        }
        
        if let respondeData = data {
            print("Data recibida")
            
            do{
                let token = try JSONDecoder().decode(Token.self, from: respondeData)
                print(token)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
        .resume()
    
}

struct Token: Codable {
    var access: String
}
