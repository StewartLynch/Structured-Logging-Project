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

struct ContentView: View {
    @Environment(DataStore.self) var dataStore
    @State private var modalType: ModalType? = nil
    let logger = Logger.fileLocation
    var body: some View {
        NavigationStack {
            @Bindable var dataStore = dataStore
            List {
                ForEach($dataStore.toDos) { $toDo in
                    Button {
                        modalType = .update(toDo)
                    } label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundStyle(toDo.completed ? .green : Color(.label))
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                dataStore.deleteToDo(toDo)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            toDo.completed.toggle()
                            dataStore.updateToDo(toDo)
                        } label: {
                            Text(toDo.completed ? "Remove Completion" : "Completed")
                        }
                        .tint(.teal)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My ToDos")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                }
                ToolbarItem {
                    Button {
                        modalType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                
            }
        }
        .sheet(item: $modalType) { $0 }
        .task {
            if FileManager().docExist(named: FileManager.fileName){
                dataStore.loadToDos()
            } else {
                logger.info("File \(FileManager.fileName) does not exist")
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(DataStore())
}
