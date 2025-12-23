//
//  SearchUserBar.swift
//  Users_SwiftUI_combine
//
//  Created by Karthik Solleti on 23/12/25.
//

import SwiftUI

struct SearchUserBar: View {
   @Binding var text: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.brown
            HStack(spacing: 16) {
                TextField("Search User", text: $text)
                    .padding([.leading, .trailing], 8)
                    .frame(height: 32)
                    .background(Color.white.opacity(0.4))
                    .searchSuggestions {
                        
                    }
                    .clipShape(.rect(cornerRadius: 10))
                
                Button(action: action) {
                    Text("Search")
                        .font(.headline)
                        .foregroundStyle(Color.black)
                        .buttonStyle(.bordered)
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color.black)
                        }
                }
            }
            .padding()
        }
        .frame(height: 60)
    }
}

#Preview {
    SearchUserBar(text: .constant("sai"), action: { })
}
