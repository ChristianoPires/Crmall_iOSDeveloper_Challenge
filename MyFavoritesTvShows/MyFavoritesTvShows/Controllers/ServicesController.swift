//
//  ServicesController.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 19/12/20.
//

import Foundation


class Service {
    
    static let shared = Service()
    
    var genres: [Genre] = []
    
    let apiKey = "e192829e986f423c338f524f0e725287"
    
    func gettvShows(callback: @escaping (([TVShow]) -> Void)) {
        DispatchQueue.global(qos: .userInitiated).async {
            let urlConsome = "https://api.themoviedb.org/3/tv/popular?api_key=\(self.apiKey)&language=pt-BR"
            print(urlConsome)
            guard let url = URL(string:urlConsome ) else {return}
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let dataResponse = data, error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return
                }
                do {
                    let data = try? JSONDecoder().decode(TVShowsResponse.self, from: dataResponse)
                    guard let d = data, let tvShows = d.tvShows else { return }
                    callback(tvShows)
                }
            }
            task.resume()
        }
    }
    
    func getTvShowsGenres(callback: @escaping (() -> Void)) {
        DispatchQueue.global(qos: .userInitiated).async {
            let urlConsome = "https://api.themoviedb.org/3/genre/tv/list?api_key=\(self.apiKey)&language=pt-BR"
            print(urlConsome)
            guard let url = URL(string:urlConsome ) else {return}
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let dataResponse = data, error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return
                }
                do {
                    let data = try? JSONDecoder().decode(GenresResponse.self, from: dataResponse)
                    guard let d = data, let genres = d.genres else { return }
                    Service.shared.genres = genres
                    callback()
                }
            }
            task.resume()
        }
    }
    
}
