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
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//
////        self.selectedTVShow = self.tvShows[indexPath.row]
////        self.performSegue(withIdentifier: "toDetail", sender: nil)
////        self.img = (tableView.cellForRow(at: indexPath) as! MovieTableViewCell).posterImage.image
//        //        Variables.originalTitle = DataSource.dataSourceCode[indexPath.row][0]
//        //        Variables.genresName = DataSource.dataSourceCode[indexPath.row][1]
//        //        Variables.overview = DataSource.dataSourceCode[indexPath.row][2]
//        //        Variables.posterPath = DataSource.dataSourceCode[indexPath.row][3]
//        //        Variables.voteAverage = DataSource.dataSourceCode[indexPath.row][4]
//        //        Variables.voteCount = DataSource.dataSourceCode[indexPath.row][5]
//        //        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        //        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        //        self.present(newViewController, animated: true, completion: nil)
//    }
    
}

extension ViewController: TableViewCellDelegate {
    func doubleTapDetected(in cell: TableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) { print("doubleTap \(indexPath) ") }
    }
}

