//
//  ContentView.swift
//  ChuckNorrisJokes
//
//  Created by Henry Tsang on 23/06/2022.
//

import SwiftUI

struct ContentView: View {

    @State var jokes = [JokeData]()

    var body: some View {
        VStack(alignment: .leading) {
            Section {
                Text("Chuck Norris Jokes SFW")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            Spacer()
            Section {
                Button("New Jokes") {
                    loadJokes()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            List(jokes, id: \.id) { item in
                VStack(alignment: .leading) {
                    Section {
                        Text(item.joke)
                    }
                }
            }
            .onAppear {
                loadJokes()
            }
        }
    }

    func loadJokes() {
        JokeViewModel().loadData { (jokes) in
            self.jokes = jokes
        }
    }

}
