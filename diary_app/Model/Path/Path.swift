//
//  Path.swift
//  diary_app
//
//  Created by 최영호 on 11/3/23.
//

import Foundation

class PathModel : ObservableObject{
    @Published var paths : [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
    
}
