# Users Search App (SwiftUI + Combine)

A SwiftUI application that allows users to search for GitHub users using the GitHub API. The app demonstrates modern iOS development practices using SwiftUI and Combine frameworks.

## Features

- Search for GitHub users by name
- Real-time search results display
- User avatars loading with caching
- Loading indicators
- Error handling for empty searches
- Clean, modern UI with SwiftUI

## Technologies Used

- **SwiftUI**: For building the user interface declaratively
- **Combine**: For reactive programming and handling asynchronous API calls
- **URLSession**: For making network requests to the GitHub API
- **JSONDecoder**: For parsing JSON responses
- **Data Task Publisher**: For integrating URLSession with Combine

## Architecture

The app follows MVVM (Model-View-ViewModel) architecture pattern:

- **Models**: `User.swift` and `SearchUserResponse.swift` for data representation
- **ViewModel**: `SearchUserViewModel.swift` handles business logic and API calls
- **Views**: SwiftUI views for the user interface
  - `SearchUserMainView.swift`: Main content view
  - `SearchUserBar.swift`: Search input component
  - `SearchRow.swift`: Individual user row display

## How It Works

1. User enters a search term in the search bar
2. The app queries the GitHub API for users matching the search term
3. Results are displayed in a list with user avatars
4. Avatars are loaded asynchronously and cached for performance
5. Loading indicators are shown during API requests

## Getting Started

### Prerequisites

- Xcode 14.0 or later
- iOS 13.0 or later
- macOS 12.0 or later (for development)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
```

2. Open the project in Xcode:
```bash
open Users_SwiftUI_combine.xcodeproj
```

3. Build and run the project in the simulator or on a physical device

## Project Structure

```
├── Models/
│   ├── User.swift          # User data model
│   └── SearchUserResponse.swift  # API response model
├── ViewModel/
│   └── SearchUserViewModel.swift # Business logic and API integration
└── Views/
    ├── SearchUserMainView.swift  # Main application view
    ├── SearchUserBar.swift       # Search input component
    └── SearchRow.swift           # Individual user display
```

## API Used

This application uses the GitHub Users Search API:
- Endpoint: `https://api.github.com/search/users`
- Method: GET
- Parameters: `q` (search query)

## Key Implementation Details

- **Reactive Programming**: Uses Combine publishers for handling API responses
- **Memory Management**: Proper use of cancellables to avoid memory leaks
- **Image Loading**: Asynchronous image loading with caching
- **Error Handling**: Graceful handling of empty searches and API errors
- **UI Updates**: Thread-safe UI updates using `receive(on: RunLoop.main)`


## Screenshots

<img width="1206" height="2622" alt="image" src="https://github.com/user-attachments/assets/ee18b385-5d5e-43ae-8c5c-98dd172240af" />

<img width="1206" height="2622" alt="image" src="https://github.com/user-attachments/assets/596ba6e3-19cb-4ac8-83c7-2764ab4f204a" />




https://github.com/user-attachments/assets/ec71e98a-8823-4a4c-9149-a2af322d7a82



## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

Karthik Solleti

## Acknowledgments

- Built with SwiftUI and Combine
- Uses GitHub API for user search functionality
- Inspired by modern iOS development best practices
