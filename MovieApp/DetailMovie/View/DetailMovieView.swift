//
//  DetailMovieView.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailMovieView: View {
    @ObservedObject var viewModel = DetailMovieViewModel()
    var movieId: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                ImageBg(urlImage: viewModel.movieDetail?.backdropPath)
                
                VStack(alignment: .leading) {
                    Text(viewModel.movieDetail?.originalTitle ?? "")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding([.top, .bottom], 10)
                    
                    HStack {
                        ForEach(viewModel.movieDetail?.genres ?? [], id: \.id) { item in
                            Text(item.name)
                                .font(.system(size: 13))
                        }
                    }
                    HStack(alignment: .center, spacing: 7) {
                        Image("star")
                            .resizable()
                            .frame(maxWidth: 15, maxHeight: 15)
                        Text("\(String(format: "%.1f", viewModel.movieDetail?.voteAverage ?? 0.0)) / 10")
                            .font(.system(size: 13))
                            .fontWeight(.regular)
                    }
                    
                    HStack(alignment: .center) {
                        VerticalBlock(title: "Running time", info: "\(viewModel.movieDetail?.runtime ?? 0) mins")
                        Spacer()
                        VerticalBlock(title: "Budget", info: "$\(viewModel.movieDetail?.budget ?? 0)")
                        Spacer()
                        VerticalBlock(title: "Release date", info: ConvertDate.convertDateFormat(inputDate: viewModel.movieDetail?.releaseDate ?? ""))
                    }
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 13))
                    .padding([.bottom, .top], 15)
                    
                    Text(viewModel.movieDetail?.overview ?? "")
                        .font(.system(size: 14))
                        .padding(.bottom, 20)
                        .multilineTextAlignment(.leading)
                }
                .padding([.trailing, .leading], 15)
                Spacer()
                Divider()
                VStack(alignment: .leading) {
                    Text("Trailers")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    ForEach(self.viewModel.movieDetail?.videos?.results ?? []) { item in
                        TrailerCell(trailer: item)
                    }
                }
                .padding([.trailing, .leading], 15)
                .padding(.top, 15)
                
            }
            .onAppear {
                self.viewModel.getailInfo(movieId: movieId)
            }
        }
       
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(movieId: 0)
    }
}
