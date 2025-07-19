//
//  ContentView.swift
//  BookStore
//
//  Created by Pranav on 19/07/25.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State private var showAddView = false
    @Query(sort:\Book.title) private var books:[Book]
    var body: some View {
        NavigationStack {
            Group{
                if books.isEmpty{
                    ContentUnavailableView(
                        "Enter Your First Book",
                        systemImage: "book.fill"
                    )
                }else{
                    List{
                        ForEach(books){book in
                            NavigationLink {
                                Text(book.title)
                            } label: {
                                HStack(spacing: 10){
                                    Image(systemName: book.iconName)
                                    
                                    VStack(alignment: .leading){
                                        Text(book.title)
                                            .font(.title2)
                                        Text(book.author)
                                            .foregroundStyle(.secondary)
                                        
                                        if let rating = book.rating{
                                            HStack{
                                                ForEach(0..<rating,id:\.self){_ in
                                                    Image(systemName: "star.fill")
                                                        .foregroundStyle(.yellow)
                                                        .font(.caption)
                                                }
                                            }
                                            
                                        }
                                    }
                                }
                            }
                            
                            
                        }.onDelete { indexSet in
                            for index in indexSet {
                                let book = books[index]
                                context.delete(book)
                            }
                        }

                        
                    }
                    .listStyle(.plain)
                    
                }
                
            }
          
                .navigationTitle("Book Store")
                .toolbar{
                    ToolbarItem {
                        Button{
                            //show add view
                            showAddView = true
                        }label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                .sheet(isPresented: $showAddView) {
                    AddBookView()
                        .presentationDetents([.medium])
                }
        }
      
    }
}

#Preview {
    ContentView()
        .modelContainer(for:Book.self,inMemory: true)
}
