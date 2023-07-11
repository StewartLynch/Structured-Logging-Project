//
// Created for MyToDos
// by  Stewart Lynch on 2023-07-10
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on Twitter: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch

import SwiftUI

enum ToDoError: Error, LocalizedError {
    case saveError
    case readError
    case decodingError
    case encodingError
    
    var errorDescription: String? {
        switch self {
            case .saveError: NSLocalizedString("Could not save ToDos, please reinstall the app.", comment: "")
            case .readError: NSLocalizedString("Could not load ToDos, please reinstall the app.", comment: "")
            case .decodingError: NSLocalizedString("There was a problem loading your ToDos, please create a new ToDo to start over.", comment: "")
            case .encodingError: NSLocalizedString("Could not save ToDos, please reinstall the app.", comment: "")
        }
    }
}
