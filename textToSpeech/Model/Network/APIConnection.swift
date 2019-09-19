//
//  APIConnection.swift
//  textToSpeech
//
//  Created by Lukasz Gajewski on 19/09/2019.
//  Copyright © 2019 Lukasz Gajewski. All rights reserved.
//

import Foundation

class APIConnection {
    
    enum baseURL {
        static let base = "https://newsapi.org/v2/top-headlines?apiKey=9348dac25ecb438eb6c4a0e3c6453250&country=us"
        
        case technology
        
        var urlBody: String {
            switch self {
            case .technology: return baseURL.base + "&category=technology"
            }
        }
        var url: URL {
            return URL(string: urlBody)!
        }
    }
    
    
    class func getNews<T: Decodable>(url: URL, response: T.Type, completion: @escaping (Result<T, DataFetchError>) -> Void) -> URLSessionTask {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let response = response as? HTTPURLResponse, response.connectionSuccessful, let data = data else {
                completion(Result.failure(.network))
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let fetchedData = try decoder.decode(T.self, from: data)
                completion(Result.success(fetchedData))
            } catch {
                completion(Result.failure(.decoding))
                print(error.localizedDescription)
            }
        })
        task.resume()
        
        return task
    }
    
    class func downloadThumbnail(imageURL: URL, completion: @escaping (Data?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: imageURL, completionHandler: {(data, response, error) in
            guard let response = response as? HTTPURLResponse, response.connectionSuccessful, let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            DispatchQueue.main.async {
                completion(data, nil)
            }
        })
        task.resume()
    }
    
}
