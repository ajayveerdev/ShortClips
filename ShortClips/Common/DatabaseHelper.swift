//
//  DatabaseHelper.swift
//  ShortClips
//
//  Created by Macbook on 05/10/22.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper{
    
    static let contex = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    static func createMovieData(objects: [MoviesResultsModel]){
        
            let movieEntity = NSEntityDescription.entity(forEntityName: "Movies", in: contex!)!

            for item in objects {
                
                let movie = NSManagedObject(entity: movieEntity, insertInto: contex)
                
                movie.setValue(item.adult, forKeyPath: "adult")
                movie.setValue(item.backdrop_path, forKeyPath: "backdrop_path")
                movie.setValue(item.genre_ids, forKeyPath: "genre_ids")
                movie.setValue(item.id, forKeyPath: "id")
                movie.setValue(item.original_language, forKeyPath: "original_language")
                movie.setValue(item.original_title, forKeyPath: "original_title")
                movie.setValue(item.overview, forKeyPath: "overview")
                movie.setValue(item.popularity, forKeyPath: "popularity")
                movie.setValue(item.poster_path, forKeyPath: "poster_path")
                movie.setValue(item.release_date, forKeyPath: "release_date")
                movie.setValue(item.title, forKeyPath: "title")
                movie.setValue(item.video, forKeyPath: "video")
                movie.setValue(item.vote_average, forKeyPath: "vote_average")
                movie.setValue(item.vote_count, forKeyPath: "vote_count")
                
            }
            do {
                try contex?.save()
               
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
    static func retrieveMoviesData() -> [Movies] {
        var movies = [Movies]()
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
           do {
               movies = try contex?.fetch(fetchRequest) as? [Movies] ?? []
           } catch {
               
               print("Failed")
           }
        return movies
       }
    
    
    static func deleteData(){
        var movies = [Movies]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        
        do
        {
            movies = try contex?.fetch(fetchRequest) as? [Movies] ?? []
            
            for object in movies {
                guard let objectData = object as? NSManagedObject else {continue}
                contex?.delete(objectData)
            }
            
            do{
                try contex?.save()
            }
            catch
            {
                print(error)
            }
            
        }
        catch
        {
            print(error)
        }
    }
}
