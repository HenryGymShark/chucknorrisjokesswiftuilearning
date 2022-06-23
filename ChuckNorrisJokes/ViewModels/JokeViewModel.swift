//
//  JokeViewModel.swift
//  ChuckNorrisJokes
//
//  Created by Henry Tsang on 23/06/2022.
//

import Foundation


class JokeViewModel {

    func loadData(completion:@escaping () {
        guard let url = URL(string: "http://api.icndb.com/jokes/random/10?exclude=[explicit]") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(JokesResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.jokes = response.value
                    }
                    return
                }
            }
        }.resume()
    }
}
