import Foundation

enum MainEvent {
    
}

enum MainAction {
    
}

final class MainViewModel {
    private var movieSection: [MovieModel] = []
    private let url = "https://movies-tv-shows-database.p.rapidapi.com/?page=1"
    
    func fetchMovie(completion: @escaping () -> Void) {
        fetchRequestMoviewById { [weak self] movieModel in
            guard let self = self, let movieModel = movieModel else {
                print("Failed to fetch movie data.")
                return
            }
            self.movieSection = [movieModel]
            completion()
        }
    }
    
    func getAllMovieResults() -> [MovieResult] {
        return movieSection.flatMap { $0.movie_results }
    }
    
    func fetchRequestMoviewById(completion: @escaping (MovieModel?) -> Void) {
        guard let url = URL(string: url) else {
            fatalError("Error creating URL")
        }
        
        var request = URLRequest(url: url)
        request.setValue("movies-tv-shows-database.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("9a4ef945bemsh6bfa0a56065f8b5p1ff45ejsndaa113648397", forHTTPHeaderField: "x-rapidapi-key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let liveData = try JSONDecoder().decode(MovieModel.self, from: data)
                completion(liveData)
            } catch {
                print("Failed to decode JSON: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
    
    func getMovieSection() -> [MovieModel] {
        return movieSection
    }
}
