//
//  MoviesViewModel.swift
//  ShortClips
//
//  Created by Macbook on 04/10/22.
//

import Foundation
import Alamofire

class MoviesViewModel {
    
    var movieListModel: MoviesModel?
    var moviesDBModel: [Movies]?
    
    func getAllMovies(category:String, page:Int, segmentIndex:Int, completion: @escaping ()->()) {
        startLoader()
        if Internet.isConnected() == true {
            let url = "\(Constants.BaseUrl.baseAPI)/\(category)?\(Parameter.api_key)=\(Constants.apiKey)&\(Parameter.page)=\(page)"
            AF.request(url)
                .validate()
                .responseDecodable(of: MoviesModel.self) { (response) in
                    guard let moviesList = response.value else { return }
                    stopLoader()
                    self.movieListModel = moviesList
                    
                    if page > 1 {
                        DatabaseHelper.createMovieData(category: category, objects: self.movieListModel?.results ?? [])
                    } else{
                        // Delete all and insert and show
                        if segmentIndex > 1{
                            DatabaseHelper.deleteData(category: category)
                            DatabaseHelper.createMovieData(category: category, objects: self.movieListModel?.results ?? [])
                        } else{
                            DatabaseHelper.createMovieData(category: category, objects: self.movieListModel?.results ?? [])
                        }
                    }
                    
                    let movieData = DatabaseHelper.retrieveMoviesData(category: category)
                    self.moviesDBModel = movieData
                    completion()
                }
            
        } else {
            let movieData = DatabaseHelper.retrieveMoviesData(category: category)
            self.moviesDBModel = movieData
            stopLoader()
            completion()
            
        }
    }
}
