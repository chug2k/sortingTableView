//
//  ViewController.swift
//  SortWeek1App
//
//  Created by Charles Lee on 6/22/16.
//  Copyright © 2016 coderschoolvn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var numbers = [5, 3, 2, 1, 4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
}

// MARK: - Actions
extension ViewController {
    
    @IBAction func onButtonPressed(sender: AnyObject) {
        numbers = numbers.shuffle()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = numbers[indexPath.row]
        cell.textLabel?.text = String(item)
        return cell
    }
}

// MARK - Array Extension
extension Array {
    func shuffle() -> Array {
        return sort({ (_, _) -> Bool in
            return arc4random() % 2 == 0
        })
    }
}

