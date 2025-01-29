//
//  ApiReq_1TB.swift
//  UniversalMultimediaApplication1
//
//  Created by Николай Гринько on 21.01.2025.
//

import UIKit

public class ApiReq_1TB {
    
    static let shared = ApiReq_1TB()
    
    func downloadGets() {
        
        guard let url =  URL(string:"https://api.giphy.com/v1/gifs/random?api_key=52XDHS8G0DDhvq9SiF8SXkLnCzdTbj28&tag=&rating=g") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let response = response {
               // print(response)
            }
            guard let data = data else { return }
           // print(data)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}
