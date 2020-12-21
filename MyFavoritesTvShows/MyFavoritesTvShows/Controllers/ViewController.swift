//
//  ViewController.swift
//  MyFavoritesTvShows
//
//  Created by christiano filipe pinto on 19/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tvShows: [TVShow] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var favoritesTvShows: [TVShow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            Service.shared.gettvShows { tvShows in
                Service.shared.getTvShowsGenres {
                    self.tvShows = tvShows
                }
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableview tvshows count",self.tvShows.count)
        return self.tvShows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 237
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.delegate = self
        cell.setup(tvShow: self.tvShows[indexPath.row])
        return cell
    }

}

extension ViewController: TableViewCellDelegate {
    func doubleTapDetected(in cell: TableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            print("doubleTap \(indexPath) ")
            
            for favorite in self.favoritesTvShows {
                if favorite.id == self.tvShows[indexPath.row].id{
                    print("ja e favorito")
                    return
                }
            }
            self.favoritesTvShows.append(self.tvShows[indexPath.row])
            
        
            
            print("ultimo favorito: ", self.favoritesTvShows.last?.name!)
        }
        print("favoritos count: ", self.favoritesTvShows.count)
        for favorito in self.favoritesTvShows {
            print("favorito: ", favorito.name)
        }
    }
}

