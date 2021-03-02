//
//  HeaderImage.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 02.03.2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ImageBg: View {
    var urlImage: String?
    
    var body: some View {
        let url = URL(string: "https://image.tmdb.org/t/p/original/\(urlImage ?? "")")
        WebImage(url: url)
            .resizable()
            .placeholder(Image(systemName: "photo"))
            .indicator(.activity)
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .aspectRatio(contentMode: .fill)
        
    }
}
