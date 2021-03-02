//
//  PlayerViewModel.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 02.03.2021.
//

import Foundation
import Combine
import XCDYouTubeKit

final class PlayerViewModel: ObservableObject {
    
    @Published var url: URL = URL.init(fileURLWithPath: "")
    
    func getUrl(videoKey: String) {
        XCDYouTubeClient.default().getVideoWithIdentifier(videoKey, cookies: nil) { (video, error) in
            self.url = video?.streamURL ?? URL.init(fileURLWithPath: "")
        }
    }
}
