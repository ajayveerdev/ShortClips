//
//  File.swift
//  ShortClips
//
//  Created by Macbook on 04/10/22.
//

import Foundation

struct MoviesModel : Codable {
    let page : Int?
    var results : [MoviesResultsModel]?
    let total_pages : Int?
    let total_results : Int?
}

struct MoviesResultsModel : Codable {
    var adult : Bool?
    var backdrop_path : String?
    var genre_ids : [Int]?
    var id : Int?
    var original_language : String?
    var original_title : String?
    var overview : String?
    var popularity : Double?
    var poster_path : String?
    var release_date : String?
    var title : String?
    var video : Bool?
    var vote_average : Double?
    var vote_count : Int?
}
