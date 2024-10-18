//
//  DetailViewModel.swift
//  oitech
//
//  Created by Aruzhan Boranbay on 18.10.2024.
//

import Foundation

enum DetailEvent {
    
}

enum DetailAction {
    
}

final class DetailViewModel {
    private let url = "https://movies-tv-shows-database.p.rapidapi.com"
    private var movieSection: DetailModel?
    
    func fetchMovie(id: String, completion: @escaping () -> Void) {
        fetchRequestMovieById(id: id) { [weak self] movieModel in
            guard let self = self, let movieModel = movieModel else {
                print("Failed to fetch movie data.")
                return
            }
            self.movieSection = movieModel
            completion()
        }
    }
    func fetchRequestMovieById(id: String, completion: @escaping (DetailModel?) -> Void) {
        guard let url = URL(string: "\(url)/?movieid=\(id)") else {
            print("Error URL")
            completion(nil)
            return
        }
        print(url)
        
        var request = URLRequest(url: url)
        request.setValue("get-movie-details", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("movies-tv-shows-database.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("9a4ef945bemsh6bfa0a56065f8b5p1ff45ejsndaa113648397", forHTTPHeaderField: "x-rapidapi-key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let liveData = try JSONDecoder().decode(DetailModel.self, from: data)
                completion(liveData)
            } catch {
                print("Failed to decode JSON: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
    
    func getMovieDetail() -> DetailModel? {
        return movieSection
    }
    
}
