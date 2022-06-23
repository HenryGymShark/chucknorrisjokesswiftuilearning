//
//  Joke.swift
//  ChuckNorrisJokes
//
//  Created by Henry Tsang on 23/06/2022.
//

import SwiftUI

struct JokesResponse: Codable {
    let type: String
    let value: [JokeData]
}

struct JokeData: Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
