//
//  ImageCache.swift
//  iOSNetworking
//
//  Created by Govila, Dhruv on 23/09/20.
//

import UIKit

extension NetworkingRegister  {
    func getImage(from url: String, completion: @escaping ((UIImage?) -> Void)) {
        
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        let imageCache = NSCache<AnyObject, AnyObject>()
        
        // retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            completion(imageFromCache)
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                completion(nil)
            }
            
            DispatchQueue.main.async(execute: {
                if let unwrappedData = data,
                    let imageToCache = UIImage(data: unwrappedData) {
                    
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                    completion(imageToCache)
                }
            })
        }).resume()
    }
}
