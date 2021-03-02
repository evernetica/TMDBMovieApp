//
//  VerticalBlock.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 02.03.2021.
//

import Foundation
import SwiftUI

struct VerticalBlock: View {
    
    var title: String
    var info: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.bold)
            Text(info)
        }
    }
}
