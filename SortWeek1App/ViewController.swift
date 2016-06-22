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
        let newNumbers = numbers.shuffle()
        tableView.beginUpdates()
        for num in numbers {
            let oldIndexPath = NSIndexPath(forRow: numbers.indexOf(num)!, inSection: 0)
            let newIndexPath = NSIndexPath(forRow: newNumbers.indexOf(num)!, inSection: 0)
            tableView.moveRowAtIndexPath(oldIndexPath, toIndexPath: newIndexPath)
        }
        
        tableView.endUpdates()
        numbers = newNumbers
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



