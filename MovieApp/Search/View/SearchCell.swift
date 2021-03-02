//
//  SearchCell.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchCell: View {
    var movie: Result
    init(movie: Result) {
        self.movie = movie
    }
    var body: some View {
        HStack(spacing: 13) {

          CellImage(urlImage: movie.posterPath)
            
            VStack(alignment: .leading) {
                Text(movie.originalTitle)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)

                Text("Release: \(ConvertDate.convertDateFormat(inputDate: movie.releaseDate))")
                    .font(.system(size: 13))
                HStack(alignment: .center, spacing: 7) {
                    Image("star")
                        .resizable()
                        .frame(maxWidth: 15, maxHeight: 15)
                    Text(String(format: "%.1f", movie.voteAverage))
                        .font(.system(size: 13))
                        .fontWeight(.light)
                }
                Text(movie.overview)
                    .font(.system(size: 13))
                    .padding(.bottom, 20)
                    .lineLimit(9)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.top, 20)
        }
        .frame( maxWidth: .infinity, minHeight: 0, alignment: .leading)
    }
}

struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell(movie: Result(id: 1, originalTitle: "Snowpiercer", overview: "In a future where a failed global-warming experiment kills off most life on the planet, a class system evolves aboard the Snowpiercer, a train that travels around the globe via a perpetual-motion engine.", posterPath: "qwewqeqw", releaseDate: "2013-08-01", voteAverage: 10.0))
            .previewLayout(.fixed(width: 300, height: 270))
    }
}
