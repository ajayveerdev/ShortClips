//
//  ViewController.swift
//  ShortClips
//
//  Created by Macbook on 04/10/22.
//

import UIKit
import ESPullToRefresh


class ViewController: UIViewController {
    
    @IBOutlet weak var movieCategorySegment: UISegmentedControl!
    @IBOutlet weak var tblMovieList: UITableView!
    @IBOutlet weak var lblNoData: UILabel!
    
    var pageIndex = 1
    var segmentIndex = 1
    
    var movieListVM = MoviesViewModel()
    //var movieListModel:[MoviesResultsModel]?
    var moviesDBModel = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.fetchDataWithCategory(category: EndPoint.popular, page: self.pageIndex)
    }
    
    func fetchDataWithCategory(category:String, page:Int) {
        movieListVM.getAllMovies(category: category, page: page, segmentIndex: self.segmentIndex) { [weak self] in
            
            self?.moviesDBModel = self?.movieListVM.moviesDBModel ?? []
            
            DispatchQueue.main.async {
                self?.tblMovieList.reloadData()
                self?.tblMovieList.es.stopLoadingMore()
                self?.tblMovieList.es.stopPullToRefresh()
            }
            
        }
    }
    
    func setupView() {
        self.navigationItem.title = ScreenTitle.Movies
        lblNoData.isHidden = true
        lblNoData.text = Constants.noDatatext
        registerTableViewCell()
        setupPullToRefresh()

    }
    
    func setupPullToRefresh(){
        self.tblMovieList.es.addPullToRefresh {
            [unowned self] in
            self.pageIndex = 1
            self.segmentIndex = 2
            self.segmentControlMethod()
        }
        
        self.tblMovieList.es.addInfiniteScrolling {
            [unowned self] in
            self.pageIndex += 1
            self.segmentControlMethod()
        }
    }
    
    // MARK: - RegisterTableViewCell
    private func registerTableViewCell() {
        tblMovieList.register(UINib(nibName: Constants.TableViewCell.movieTableViewCell, bundle: Bundle(for: ViewController.self)), forCellReuseIdentifier: Constants.TableViewCell.movieTableViewCell)
    }
    
    @IBAction func moviesSegmentClicked(_ sender: Any) {
        self.pageIndex = 1
        self.segmentIndex = 1
        self.moviesDBModel.removeAll()
        self.segmentControlMethod()
    }
    
    func segmentControlMethod(){
        switch movieCategorySegment.selectedSegmentIndex{
        case 0 :
            self.fetchDataWithCategory(category: EndPoint.popular, page: self.pageIndex)
        case 1:
            self.fetchDataWithCategory(category: EndPoint.top_rated, page: self.pageIndex)
        default:
            break
        }
    }
    
}

// MARK: - Table View delegate, datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesDBModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:Constants.TableViewCell.movieTableViewCell) as? MovieTableViewCell {
            cell.configure(movies: moviesDBModel[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let movieDetailViewController = storyBoard.instantiateViewController(withIdentifier: Constants.ViewController.movieDetailsViewController) as! MovieDetailsViewController
        movieDetailViewController.movieDetailsModel =  moviesDBModel[indexPath.row]
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
    
}

