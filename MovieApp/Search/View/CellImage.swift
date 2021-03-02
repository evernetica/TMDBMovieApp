//
//  CellImage.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 02.03.2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CellImage: View {
    var urlImage: String?
    
    var body: some View {
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(urlImage ?? "")")
        WebImage(url: url)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
