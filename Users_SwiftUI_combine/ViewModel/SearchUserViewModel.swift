//
//  SearchUserViewModel.swift
//  Users_SwiftUI_combine
//
//  Created by Karthik Solleti on 23/12/25.
//

import SwiftUI
import Combine
import Observation


class SearchUserViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var usersModelArray: [User] = []
    @Published var avatarArray: [User : UIImage] = [:]
    @Published var isLoading: Bool = false
    
    var cancellables: Set<AnyCancellable> = []
    
    func search() {
        guard !name.isEmpty else  {return usersModelArray = []}
        
        var urlComponents = URLComponents(string: "https://api.github.com/search/users")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: name)
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        isLoading = true
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map({$0.data})
            .decode(type: SearchUserResponse.self, decoder: JSONDecoder())
            .map {$0.items}
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .handleEvents(receiveCompletion: { [weak self] _ in
                    self?.isLoading = false   // ✅ stop loader here
                })
            .assign(to: \.usersModelArray, on: self)
            .store(in: &cancellables)
    }
    
    func fetchImage(for user: User) {
        guard case .none = avatarArray[user] else {
            return
        }
        
        
        let request = URLRequest(
            url: user.avatar_url
        )
        
        URLSession
            .shared
            .dataTaskPublisher(
                for: request
            )
            .compactMap { (
                data,
                response
            ) in
                if let response = response as? HTTPURLResponse {
                    if 200...300 ~= response.statusCode {
                       return UIImage(
                            data: data
                        )
                    }
                }
                return nil
            }
            .replaceError(
                with: nil
            )
            .receive(
                on: RunLoop.main
            )
            .sink { [weak self] image in
                self?.avatarArray[user] = image
            }
            .store(
                in: &cancellables
            )
    }
}

