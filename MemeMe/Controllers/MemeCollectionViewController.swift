//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Roy Fuller on 9/12/20.
//  Copyright © 2020 Fuller. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    // MARK: Outlets
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = MemeConstants.sentMemesTitle
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: Collection View Methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MemesManager.shared.getMemes().count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemeConstants.memeCollectionViewCell, for: indexPath) as! MemeCollectionViewCell
        let meme = MemesManager.shared.getMemes()[(indexPath as NSIndexPath).row]

        cell.memeImageView.image = meme.memeImage

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: MemeConstants.memeDetailViewController) as! MemeDetailViewController
        detailController.meme = MemesManager.shared.getMemes()[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    // MARK: Segue Preparation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MemeConstants.createNewMemeSegueIdentifier {
            let controller = segue.destination as! CreateNewMemeViewController
            controller.memeCollectionViewController = self
        }
    }
}
