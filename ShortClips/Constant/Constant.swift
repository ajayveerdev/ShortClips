//
//  Constant.swift
//  ShortClips
//
//  Created by Macbook on 04/10/22.
//

import Foundation

// MARK: - Constants
struct Constants {
    
    static let apiKey = "5517d6825025e9ca9829ca6ee07d85e2"
    
    struct BaseUrl {
        static let baseAPI =  "https://api.themoviedb.org/3/movie"
    }

    static let pleaseCheckInternetConnection = "Please Check Internet Connection"
    static let newtworkError = "Network Alert"
    static let noDatatext = "No Data Available"
    
    struct TableViewCell {
        static let movieTableViewCell = "MovieTableViewCell"
    }
    
    struct ViewController {
        static let movieDetailsViewController = "MovieDetailsViewController"
    }
    
}

// MARK: - Screen Name
struct ScreenTitle {
    static let Movies = "Movies"
    static let MoviesDetails = "Movies Details"
    
}

// MARK: - Date formatters
struct DATEFORMATTERS {
    static let YYYYMMDD: String = "yyyy-MM-dd"
    static let MMMMDDYYYY: String =  "MMMM dd, yyyy"

}

// MARK: - API end urls
struct EndPoint  {
    static let popular = "popular"
    static let top_rated = "top_rated"
    
}
