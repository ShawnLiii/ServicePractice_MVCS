//
//  Service.swift
//  ServicePractice
//
//  Created by Shawn Li on 5/28/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class Service
{
    static var `shared` = Service()

    private init(){}
    
    private var apiUrl = "https://reqres.in/api/users?page=2"
    
    func fetchPictureData(handler: @escaping ([Profile])->())
    {
        var photos = [Profile]()
        
        if let url = URL(string: apiUrl)
        {
            let task = URLSession.shared.dataTask(with: url)
            { (data, response, error) in
                if let data = data
                {
                    
                    do
                    {
                        let profileContainer = try JSONDecoder().decode(ProfileData.self, from: data)
                        photos = profileContainer.data
                        handler(photos)
                    }
                    catch
                    {
                        print(error)
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    func fetchImage(url: URL, handler: @escaping (UIImage?) -> ())
    {
        
        let task = URLSession.shared.downloadTask(with: url)
        { (downloadedURL, response, error) in
            if let url = downloadedURL
            {
                do
                {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    handler(image)
                }
                catch
                {
                    handler(nil)
                    print(error)
                }
            }
        }
        task.resume()

    }
}
