//
//  TableViewController.swift
//  diary
//
//  Created by sang minlee on 2017. 3. 12..
//  Copyright © 2017년 LeeSangMin.house. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    
//    var contentList = [
//        [
//            "title": "this is the first one",
//            "content":"hello1"
//        ],
//        [   "title": "this is the second one",
//            "content":"hello2"
//        ],
//        [   "title": "this is the third one",
//            "content":"hello3"
//        ],
//    ]

    var controller: NSFetchedResultsController<Article>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        fetchArticles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
//        cell.cellLabel.text = contentList[indexPath.row]["title"]
//        cell.cellView.image = UIImage(named: "swift.jpeg")
        //cell.textLabel?.text = contentList[indexPath.row]["title"]
        let article = controller.object(at: indexPath)
        cell.cellLabel.text = article.title

        // Configure the cell...

        return cell
    }
    
    func fetchArticles() {
        // TODO: should implement
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        let dataSort = NSSortDescriptor(key: "createdAt", ascending: false)
        fetchRequest.sortDescriptors = [dataSort]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.controller = controller
        
        do {
        try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detail" {
            let detailViewController: DetailViewController = segue.destination as! DetailViewController
//            let indexPath = tableView.indexPathForSelectedRow?.row
            
//            detailViewController.titleText = contentList[indexPath!]["title"]
//            detailViewController.contentText = contentList[indexPath!]["content"]
            let article = controller.object(at: tableView.indexPathsForSelectedRows!)
            detailViewController.titleText = article.title
            detailViewController.contentText = article.content
        }
    }

}
