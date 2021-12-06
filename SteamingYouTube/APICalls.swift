//
//  APICalls.swift
//  SteamingYouTube
//
//  Created by Soumya Ammu on 12/3/21.
//

import Foundation

class APICalls{
    
    let semaphore = DispatchSemaphore(value: 0)
    
    func  HTTP_Request() -> [String]{
        
        // Network call and return data
        var videoIDS = [String]()
    
        let url = URL(string: "https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UC_A--fhX5gea0i4UtpD99Gg&key=AIzaSyB1qr1LZjELuhaG0yQLtmxCx7t4vHyQL8s")!
        
        let task = URLSession.shared.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else { return }
            let JSON = String(data: data, encoding: .utf8)!
            
            let jsonData = JSON.data(using: .utf8)!
            do{
                
                let videos = try! JSONDecoder().decode(ResultItems.self, from: jsonData)
                
                for video in videos.items{
                    videoIDS.append(String(describing: video))
                    print(videoIDS)
                }
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
//
//                    for item in json{
//                        print(item)
//                    }
//
//                }
//                for items in json["items"] ?? []{
//                    print(items)
//                }
            
            }catch{
                print("ERR")
            }
            
            self.semaphore.signal()
        }
        task.resume()
        self.semaphore.wait()
        return videoIDS
        
    }
}


struct videosIds : Codable{
    var id : String
}

struct ResultItems: Codable{
    
    var items : [videosIds]
    
}
