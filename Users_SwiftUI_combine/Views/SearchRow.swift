//
//  SearchRow.swift
//  Users_SwiftUI_combine
//
//  Created by Karthik Solleti on 23/12/25.
//

import SwiftUI

struct SearchRow: View {
    
    @ObservedObject var viewModel: SearchUserViewModel
    var user: User
    
    var body: some View {
        HStack {
            if let image = viewModel.avatarArray[user] {
                Image(
                    uiImage: image
                )
                .frame(
                    width: 44,
                    height: 44
                )
                .aspectRatio(
                    contentMode: .fit
                )
                .clipShape(
                    .circle
                )
                .overlay {
                    Circle()
                        .stroke(
                            Color.black,
                            lineWidth: 1
                        )
                }
            }
            
            Text(
                user.login
            )
            .font(
                .system(
                    size: 18
                ).bold()
            )
            Spacer()
        }
        .frame(
            height: 60
        )

    }
}


