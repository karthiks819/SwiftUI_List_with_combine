//
//  ContentView.swift
//  Users_SwiftUI_combine
//
//  Created by Karthik Solleti on 23/12/25.
//

import SwiftUI

struct SearchUserMainView: View {
    @ObservedObject var viewModel = SearchUserViewModel()
    @State var showErrorMessage = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brown
                    .opacity(
                        0.7
                    )
                    .ignoresSafeArea()
                
                VStack(
                    spacing: 16
                ) {
                    SearchUserBar(
                        text: $viewModel.name
                    ) {
                        if !viewModel.name.isEmpty {
                            self.viewModel
                                .search()
                        }else {
                            withAnimation(
                                .bouncy
                            ) {
                                showErrorMessage = true
                            }
                        }
                        
                    }
                    .onChange(
                        of: viewModel.name
                    ) {
                        showErrorMessage = false
                    }
                    
                    if showErrorMessage {
                        Text(
                            "Please enter a name to search."
                        )
                        .font(
                            .headline
                        )
                        .foregroundStyle(
                            Color.red
                        )
                        .fontWeight(
                            .medium
                        )
                    }
                    
                    
                    if viewModel.isLoading {
                        ProgressView(
                            "Loading..."
                        )
                        .progressViewStyle(
                            .automatic
                        )
                    }
                    if !viewModel.usersModelArray.isEmpty {
                        List(
                            viewModel.usersModelArray
                        ) { user in
                            SearchRow(
                                viewModel: viewModel,
                                user: user
                            )
                            .onAppear {
                                self.viewModel
                                    .fetchImage(
                                        for: user
                                    )
                            }
                        }
                        .scrollContentBackground(
                            .hidden
                        )
                    }else {
                        Spacer()
                    }
                    
                }
                .padding()
                .navigationTitle(
                    "Users"
                )
            }
        }
        
    }
}

#Preview {
    SearchUserMainView()
}
