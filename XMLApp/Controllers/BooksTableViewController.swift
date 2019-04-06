//
//  BooksTableViewController.swift
//  XMLApp
//
//  Created by Matthew Dias on 4/6/19.
//  Copyright © 2019 Matthew Dias. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {
    
    var parser: XMLParser?
    var xmlParserDelegate = BookParserDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        openFile()
        
        tableView.tableFooterView = UIView()
    }
    
    func openFile() {
        // replace with your networking
        guard let filePath = Bundle.main.path(forResource: "Books", ofType:"xml") else { return }
        let url = URL(fileURLWithPath: filePath)
        
        parser = XMLParser(contentsOf: url)
        parser?.delegate = xmlParserDelegate
        
        if parser?.parse() ?? false {
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return xmlParserDelegate.books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = xmlParserDelegate.books[indexPath.row].title
        cell.detailTextLabel?.text = xmlParserDelegate.books[indexPath.row].author

        return cell
    }

}
