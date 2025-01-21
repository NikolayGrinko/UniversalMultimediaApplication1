//
//  ApiReq_1TB.swift
//  UniversalMultimediaApplication1
//
//  Created by Николай Гринько on 21.01.2025.
//

import Foundation

public class ApiReq_1TB {
    
  static let shared = ApiReq_1TB()
    
    func downloadGet() {
        
        guard let url =  URL(string:"https://api.imgflip.com/get_memes") else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data, let handshake = try? JSONDecoder().decode(MemModel.self, from: data) {
                print(handshake)
            } else {
                print("Error =)")
            }
        }
        task.resume()
    }
    
}
