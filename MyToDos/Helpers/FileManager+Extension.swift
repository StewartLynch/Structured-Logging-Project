//
// Created for MyToDos
// by  Stewart Lynch on 2023-07-10
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on Twitter: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch

import Foundation
import OSLog


extension FileManager {
    static let fileName = "ToDos.json"
    static let logger = Logger.fileManager
    func readDocument(docName: String) throws -> Data {
        let url = URL.documentsDirectory.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            Self.logger.error("\(error.localizedDescription)")
            throw ToDoError.readError
        }
    }
    
    func saveDocument(contents: String, docName: String) throws {
        let url = URL.documentsDirectory.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            Self.logger.error("\(error.localizedDescription)")
            throw ToDoError.saveError
        }
    }
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: URL.documentsDirectory.appendingPathComponent(docName).path)
    }
}
