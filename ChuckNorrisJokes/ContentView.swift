//
//  ContentView.swift
//  ChuckNorrisJokes
//
//  Created by Henry Tsang on 23/06/2022.
//

import SwiftUI

struct ContentView: View {

    @State var jokes = [JokeData]()
    @State var jokesResponse = [JokesResponse]()

    var body: some View {
        VStack(alignment: .leading) {
            Section {
                Text("Chuck Norris Jokes SFW")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            Spacer()
            Section {
                Button("New Jokes") {
                    loadData()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            List(jokes, id: \.id) { item in
                VStack(alignment: .leading) {
                    Section {
                        Text(item.joke)
                    }
                }
            }.onAppear(perform: loadData)
        }
    }


    func loadData() {
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
