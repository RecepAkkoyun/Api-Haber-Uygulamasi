//
//  WebServices.swift
//  HaberUygulamasi
//
//  Created by Recep Akkoyun on 21.09.2022.
//

import Foundation

class WebService{
    //news benim modelim. oluşturduğumuz struct.
    func haberleriIndir(url: URL , completion: @escaping ([News]?) -> ()) {
        
        //UrlSession ağdan veri transferini koordine eder.
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                    //JSONDecoder jsonu veriye çevirmemizi sağlar.
                  let haberDizisi = try? JSONDecoder().decode([News].self, from: data)
                
                    if let haberDizisi = haberDizisi {
                        completion (haberDizisi)
                    }
                }
            }.resume()
        }
    }








