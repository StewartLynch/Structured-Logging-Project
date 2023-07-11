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

enum ModalType: Identifiable, View {
    case new
    case update(ToDo)
    var id: String {
        switch self {
        case .new: "new"
        case .update: "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new: ToDoFormView(form: ToDoForm())
        case .update(let toDo): ToDoFormView(form: ToDoForm(toDo))
        }
    }
}
