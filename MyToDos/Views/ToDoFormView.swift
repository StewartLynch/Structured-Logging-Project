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

struct ToDoFormView: View {
    @Environment(DataStore.self) var dataStore
    @Bindable var form: ToDoForm
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading) {
                    TextField("ToDo", text: $form.name)
                    Toggle("Completed", isOn: $form.completed)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                   cancelButton
                }
                ToolbarItem(placement: .topBarTrailing) {
                    updateSaveButton
                }
            }
        }
    }
}

extension ToDoFormView {
    func updateToDo() {
        let toDo = ToDo(id: form.id!, name: form.name, completed: form.completed)
        dataStore.updateToDo(toDo)
        dismiss()
    }
    
    func addToDo() {
        let toDo = ToDo(name: form.name, completed: form.completed)
        dataStore.addToDo(toDo)
        dismiss()
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            dismiss()
        }
    }
    
    var updateSaveButton: some View {
        Button( form.updating ? "Update" : "Save",
                action: form.updating ? updateToDo : addToDo)
            .disabled(form.isDisabled)
    }
}

#Preview {
    ToDoFormView(form: ToDoForm())
        .environment(DataStore())
}
