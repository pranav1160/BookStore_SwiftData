//
//  AddBookView.swift
//  BookStore
//
//  Created by Pranav on 19/07/25.
//

import SwiftUI
import SwiftData

struct AddBookView:View {
    
  
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var bookTitle:String=""
    @State private var bookAuth:String=""

    var body: some View {
        NavigationStack{
            Form{
                
                TextField("Enter Title", text: $bookTitle)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                TextField("Enter Author",text: $bookAuth)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                HStack{
                    Spacer()
                    Button("ADD"){
                        let newBook = Book(title: bookTitle, author: bookAuth)
                        context.insert(newBook)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical)
                    .disabled(bookAuth.isEmpty || bookTitle.isEmpty)
                }
            }
            .navigationTitle("Add Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .topBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddBookView()
}
