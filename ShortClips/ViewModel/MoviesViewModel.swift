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
    
    func getAllMovies(category:String, page:Int, completion: @escaping ()->()) {
        
        let url = "\(Constants.BaseUrl.baseAPI)/\(category)?api_key=\(Constants.apiKey)&page=\(page)"
     
        AF.request(url)
            .validate()
            .responseDecodable(of: MoviesModel.self) { (response) in
                guard let moviesList = response.value else { return }
                self.movieListModel = moviesList
                DatabaseHelper.createMovieData(objects: self.movieListModel?.results ?? [])
                //print(moviesList.results)
                completion()
                
            }
        
    }
}
