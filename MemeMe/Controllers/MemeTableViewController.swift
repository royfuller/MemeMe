//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Roy Fuller on 9/12/20.
//  Copyright © 2020 Fuller. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = MemeConstants.sentMemesTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemesManager.shared.getMemes().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemeConstants.memeTableViewCell) as! MemeTableViewCell
        let meme = MemesManager.shared.getMemes()[(indexPath as NSIndexPath).row]
        
        cell.memeImageView.image = meme.memeImage
        cell.memeLabel.text = "\(meme.topText)...\(meme.bottomText)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: MemeConstants.memeDetailViewController) as! MemeDetailViewController
        detailController.meme = MemesManager.shared.getMemes()[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }

    // MARK: Segue Preparation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MemeConstants.createNewMemeSegueIdentifier {
            let controller = segue.destination as! CreateNewMemeViewController
            controller.memeTableViewController = self
        }
    }
}
