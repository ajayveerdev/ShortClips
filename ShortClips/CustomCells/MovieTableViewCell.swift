//
//  MovieTableViewCell.swift
//  ShortClips
//
//  Created by Macbook on 04/10/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(movies: MoviesResultsModel?) {
        titleLabel.text = movies?.title
        descriptionLabel.text = movies?.overview
        let date = movies?.release_date?.convertStringToDate(actualFormat: DATEFORMATTERS.YYYYMMDD, expectedFormat: DATEFORMATTERS.MMMMDDYYYY)
        dateTimeLabel.text = "Release Date: " + (date?.convertDateToString(actualFormat: DATEFORMATTERS.MMMMDDYYYY, expectedFormat: DATEFORMATTERS.MMMMDDYYYY) ?? "")
        let string = "\(Constants.BaseUrl.imageURL)\(movies?.backdrop_path ?? "")"
        let url = URL(string: string)
        movieImageView.downloadImage(url: url, view: self)
    }
}
