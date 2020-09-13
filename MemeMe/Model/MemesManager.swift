//
//  MemesManager.swift
//  MemeMe
//
//  Created by Roy Fuller on 9/13/20.
//  Copyright © 2020 Fuller. All rights reserved.
//

import Foundation

class MemesManager {
    
    static let shared = MemesManager()
    
    var memes = [Meme]()
    
    func addMeme(_ meme: Meme) {
        memes.append(meme)
    }
    
    func getMemes() -> [Meme] {
        return memes
    }
}
