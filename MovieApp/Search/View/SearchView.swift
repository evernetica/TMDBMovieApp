//
//  SearchView.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        
        GeometryReader { geametry in
            NavigationView {
                VStack {
                    TextField("Search movie", text: self.$viewModel.movieQuery)
                        .autocapitalization(.words)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                        )
                        .accentColor(.blue)
                    
                    List(self.viewModel.movieArray, id: \.id) { item in
                        NavigationLink(destination: DetailMovieView(movieId: item.id)) {
                            SearchCell(movie: item)
                                .onAppear {
                                    if item == self.viewModel.movieArray.last {
                                        self.viewModel.loadMoreMovie()
                                    }
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                .padding([.leading, .trailing, .top], 15)
                .navigationBarTitle("Movies", displayMode:  .inline)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
