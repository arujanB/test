//
//  MovieModel.swift
//  oitech
//
//  Created by Aruzhan Boranbay on 18.10.2024.
//

import Foundation

struct MovieModel: Decodable {
    let status: String
    let movie_results: [MovieResult]
}

struct MovieResult: Decodable {
    let title: String
    let year: String
    let imdb_id: String
}

