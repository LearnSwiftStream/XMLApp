//
//  Book.swift
//  XMLApp
//
//  Created by Matthew Dias on 4/6/19.
//  Copyright © 2019 Matthew Dias. All rights reserved.
//

import Foundation

struct Publisher {
    var name: String
}

struct Book {
    var title: String
    var author: String
    var publisher: Publisher?
}

class BookParserDelegate: ParserDelegate, XMLParserDelegate {
    var author: String = ""
    var title: String = ""
    var publisherName: String = ""
    var books: [Book] = []
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "author" {
            self.author = foundString
        }
        
        if elementName == "title" {
            self.title = foundString
        }
        
        if elementName == "name" {
            self.publisherName = foundString
        }
        
        if elementName == "book" {
            var publisher: Publisher?
            if !publisherName.isEmpty {
                publisher = Publisher(name: publisherName)
                publisherName = ""
            }
            
            books.append(Book(title: title, author: author, publisher: publisher))
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        foundString = string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}
