//
// Created for MyToDos
// by  Stewart Lynch on 2023-07-10
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on Twitter: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch

import OSLog
import SwiftUI

@main
struct MyToDosApp: App {
//    let logger = Logger(subsystem: "com.createchsol.MyToDos", category: "FileLocation")
    let logger = Logger.fileLocation
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(DataStore())
                .onAppear {
//                    Debug.print(URL.documentsDirectory.path(), type: .info, extended: true)
                    logger.info("\(URL.documentsDirectory.path())")
                }
        }
    }
}
