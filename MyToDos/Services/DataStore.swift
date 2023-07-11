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
import Observation
import OSLog

@Observable
class DataStore {
    let logger = Logger(subsystem: "com.createchsol.MyToDos", category: "DataStore")
    var toDos:[ToDo] = []
    
    func addToDo(_ toDo: ToDo) {
        toDos.append(toDo)
        logger.info("New ToDo added")
        saveToDos()
    }
    
    func updateToDo(_ toDo: ToDo) {
        guard let index = toDos.firstIndex(where: { $0.id == toDo.id}) else { return }
        toDos[index] = toDo
        logger.info("ToDo updated")
        saveToDos()
    }
    
    func deleteToDo(_ toDo: ToDo) {
        if let indexToDelete = toDos.firstIndex(where: {$0.id == toDo.id}) {
            toDos.remove(at: indexToDelete)
            logger.info("ToDo deleted")
            saveToDos()
        }
    }
    func loadToDos() {
//        Debug.print("Loading ToDos from documents directory", type: .info, extended: true)
        logger.info("Loading ToDos from documents directory")
        do {
            let data = try FileManager().readDocument(docName: FileManager.fileName)
            let decoder = JSONDecoder()
            toDos = try decoder.decode([ToDo].self, from: data)

        } catch {
            logger.error("Failed to load todos: \(error.localizedDescription)")
        }
    }
    
    func saveToDos() {
        logger.info("Saving toDos to documents directory")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(toDos)
            let jsonString = String(decoding: data, as: UTF8.self)
            try FileManager().saveDocument(contents: jsonString, docName: FileManager.fileName)
        } catch {
            logger.error("Failed to save todos: \(error.localizedDescription)")
        }
    }
}
