//
//  NetworkManager.swift
//  SwiftUISample
//
//  Created by Vinicius Consulmagnos Romeiro on 29/03/20.
//  Copyright © 2020 Vinicius Consulmagnos Romeiro. All rights reserved.
//

import Foundation

final class NetworkManager {
    func fetchContries(completionHandler: @escaping ([Contry]) -> Void) {
      let url = URL(string: "https://restcountries.eu/rest/v2/all")!

      let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error {
          print("Error with fetching contries: \(error)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
          print("Error with the response, unexpected status code: \(response)")
          return
        }

        if let data = data,
            let contries = try? JSONDecoder().decode([Contry].self, from: data) {
            completionHandler(contries ?? [])
        }
      })
      task.resume()
    }

    func fetchContries(withName name:String, completionHandler: @escaping ([Contry]) -> Void) {
      let url = URL(string: "https://restcountries.eu/rest/v2/name/\(name)")!
      
      let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
          print("Error returning contries id \(name): \(error)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
          print("Unexpected response status code: \(response)")
          return
        }

        if let data = data,
          let contries = try? JSONDecoder().decode([Contry].self, from: data) {
            completionHandler(contries ?? [])
        }
      }
      task.resume()
    }
}
