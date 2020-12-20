//
//  ViewController.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 19/12/20.
//

import UIKit

class ViewController: UIViewController {

    
    var tvShows: [TVShow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service.shared.gettvShows { tvShows in
            Service.shared.getTvShowsGenres {
                self.tvShows = tvShows
            }
        }
        
        
        // Do any additional setup after loading the view.
    }


}

