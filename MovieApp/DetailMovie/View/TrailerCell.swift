//
//  TrailerCell.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 02.03.2021.
//

import SwiftUI
import AVKit
import XCDYouTubeKit

struct TrailerCell: View {
    
    var trailer: ResultVideo
    @ObservedObject var viewModel = PlayerViewModel()
    var player: AVPlayer?
    
    init(trailer: ResultVideo) {
        self.trailer = trailer
        self.viewModel.getUrl(videoKey: self.trailer.key)
    }

    var body: some View {
        VStack {
            VideoPlayer(player: AVPlayer(url: self.viewModel.url))
                .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                .padding([.top, .bottom], 20)
                .onDisappear() {
                    player?.pause()
                }
            Text(trailer.name)
            Divider()
        }
    }
}

struct TrailerCell_Previews: PreviewProvider {
    static var previews: some View {
        TrailerCell(trailer: ResultVideo(key: "ePbKGoIGAXY", name: "Interstellar – Trailer 3 – Official Warner Bros. qweqweqweqweqw", id: "qweqw"))
    }
}

