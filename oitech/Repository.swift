//
//  Repository.swift
//  oitech
//
//  Created by Aruzhan Boranbay on 17.10.2024.
//

import Foundation

//class Repository {
//    private lazy var networkClient = NetworkClient(baseURL: appSettings.apiCRMURL,
//                                                   headersProvider: HeadersProvider(headers: .default),
//                                                   credentialsProvider: userStorage)
//    
//    func getSettings() async throws -> GenericDataResponse<SettingsResponse> {
//        let response: GenericDataResponse<SettingsResponse> = try await networkClient.GET(path: "/mobile/settings")
//        return response
//    }
//    
//    func setSettings(isEmailOn: Bool, isSMSOn: Bool, isPushOn: Bool) async throws -> Bool {
//        let params: [String : Bool] = [
//            "email_notification": isEmailOn,
//            "sms_notification": isSMSOn,
//            "push_notification": isPushOn
//        ]
//        
//        let response: GenericDataResponse<[EmptyResponse]> = try await networkClient.POST(path: "/mobile/settings", params: params)
//        return response.isSuccess
//    }
//}

//class Repository {
//    guard let url = URL(string: "https://movies-tv-shows-database.p.rapidapi.com/?movieid=tt1375666") else { return }
//
//    // 2. URLRequest (опционально можно указать метод, заголовки и т.д.)
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET" // Или "POST" в зависимости от типа запроса
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    // 3. URLSession dataTask
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        // Проверка на ошибку
//        if let error = error {
//            print("Error: \(error.localizedDescription)")
//            return
//        }
//        
//        // Проверка статуса ответа
//        if let httpResponse = response as? HTTPURLResponse {
//            print("Response status code: \(httpResponse.statusCode)")
//        }
//        
//        // Работа с данными
//        if let data = data {
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print("Response JSON: \(json)")
//            } catch {
//                print("Failed to parse JSON: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    // 4. Запуск задачи
//    task.resume()
//}

class Repository {
    func fetchRequestMainGameChange(){
            let urlString = "https://movies-tv-shows-database.p.rapidapi.com/?movieid=tt1375666"
            print(urlString)
            guard let url = URL(string: urlString) else { fatalError("Error urlString in APICaller") }
            let request = URLRequest(url: url)
            
//            let task = URLSession.shared.dataTask(with: request) { data, responce, error in
//                guard let data else { return }
//                do{
//                    let mainGameData = try JSONDecoder().decode(MainGameData.self, from: data)
//                    completion(mainGameData)
//                }catch {
//                    print(error)
//                }
//            }
//            task.resume()
        }
}
