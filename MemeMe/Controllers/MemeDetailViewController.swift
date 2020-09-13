//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Roy Fuller on 9/12/20.
//  Copyright © 2020 Fuller. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var meme: Meme!
    
    // MARK: Outlets
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        memeImageView.image = meme.memeImage
    }
}
