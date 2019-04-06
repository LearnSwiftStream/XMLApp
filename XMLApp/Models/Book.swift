//
//  Book.swift
//  XMLApp
//
//  Created by Matthew Dias on 4/6/19.
//  Copyright © 2019 Matthew Dias. All rights reserved.
//

import Foundation

struct Book {
    var title: String
    var author: String
}

class BookParserDelegate: ParserDelegate, XMLParserDelegate {
    var author: String = ""
    var title: String = ""
    var books: [Book] = []
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "author" {
            self.author = foundString
        }
        
        if elementName == "title" {
            self.title = foundString
        }
        
        if elementName == "book" {
            books.append(Book(title: title, author: author))
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print(string)
        foundString = string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}
