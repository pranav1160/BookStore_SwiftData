//
//  Book.swift
//  BookStore
//
//  Created by Pranav on 19/07/25.
//
import SwiftUI
import SwiftData


@Model
class Book{
    var title:String
    var author:String
    var dateAdded:Date
    var dateCompleted:Date
    var dateStarted:Date
    var summary:String
    var rating:Int?
    var status:Status
    
    init(
        title: String,
        author: String,
        dateAdded: Date = Date.now,
        dateCompleted: Date = Date.distantFuture,
        dateStarted: Date = Date.distantFuture,
        summary: String = "",
        rating: Int? = nil,
        status: Status = .onShelf
    ) {
        self.title = title
        self.author = author
        self.dateAdded = dateAdded
        self.dateCompleted = dateCompleted
        self.dateStarted = dateStarted
        self.summary = summary
        self.rating = rating
        self.status = status
    }
    
    //computed properties cant change the structure of the database
    var iconName:String{
        switch status {
        case .onShelf:
            "books.vertical.fill"
        case .inProgress:
            "book.fill"
        case .completed:
            "checkmark.diamond.fill"
        }
    }
    
}

enum Status:String,Codable{
    case onShelf,inProgress,completed
    var desc:String{
        switch self {
        case .onShelf:
            "on Shelf"
        case .inProgress:
            "in Progress"
        case .completed:
            "completed"
        }
    }
}
