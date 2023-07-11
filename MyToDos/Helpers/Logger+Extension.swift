//
// Created for MyToDos
// by  Stewart Lynch on 2023-07-11
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on Twitter: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import Foundation
import OSLog

extension Logger {
    static let subsystem = Bundle.main.bundleIdentifier!
    static let fileLocation = Logger(subsystem: subsystem, category: "FileLocation")
    static let dataStore = Logger(subsystem: subsystem, category: "DataStore")
    static let fileManager = Logger(subsystem: subsystem, category: "FileManager")
}
