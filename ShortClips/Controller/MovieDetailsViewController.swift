//
//  MovieDetailsViewController.swift
//  ShortClips
//
//  Created by Macbook on 04/10/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var btnWatchTrailer: UIButton!
    
    var movieDetailsModel:Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setData()
    }
    
    func setData(){
        self.navigationItem.title = ScreenTitle.MoviesDetails
        self.lblTitle.text = self.movieDetailsModel?.title
        self.lblDescription.text = self.movieDetailsModel?.overview
        let string = "\(Constants.BaseUrl.imageURL)\(self.movieDetailsModel?.backdrop_path ?? "")"
        let url = URL(string: string)
        imgView.downloadImage(url: url, view: self.view)
    }
    
    
    @IBAction func watchTrailerAction(_ sender: Any) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
