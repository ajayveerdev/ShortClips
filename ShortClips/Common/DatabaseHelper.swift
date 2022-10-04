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
    
    static func createMovieData(objects: [MoviesResultsModel]){
            
            //As we know that container is set up in the AppDelegates so we need to refer that container.
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            //We need to create a context from this container
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Now let’s create an entity and new movie records.
            let userEntity = NSEntityDescription.entity(forEntityName: "Movies", in: managedContext)!

            for item in objects {
                
                let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
                
                user.setValue(item.adult, forKeyPath: "adult")
                user.setValue(item.backdrop_path, forKeyPath: "backdrop_path")
                user.setValue(item.genre_ids, forKeyPath: "genre_ids")
                user.setValue(item.id, forKeyPath: "id")
                user.setValue(item.original_language, forKeyPath: "original_language")
                user.setValue(item.original_title, forKeyPath: "original_title")
                user.setValue(item.overview, forKeyPath: "overview")
                user.setValue(item.popularity, forKeyPath: "popularity")
                user.setValue(item.poster_path, forKeyPath: "poster_path")
                user.setValue(item.release_date, forKeyPath: "release_date")
                user.setValue(item.title, forKeyPath: "title")
                user.setValue(item.video, forKeyPath: "video")
                user.setValue(item.vote_average, forKeyPath: "vote_average")
                user.setValue(item.vote_count, forKeyPath: "vote_count")
                
            }

            //Now we have set all the values. The next step is to save them inside the Core Data
            
            do {
                try managedContext.save()
               
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
}
