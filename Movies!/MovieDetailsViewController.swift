//
//  MovieDetailsViewController.swift
//  Movies!
//
//  Created by William Gudiel on 9/28/20.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        posterView.isUserInteractionEnabled = true
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        posterView.af_setImage(withURL: posterURL!)
        
        let backDropPath = movie["backdrop_path"] as! String
        let backDropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backDropPath)
        
        backDropView.af_setImage(withURL: backDropURL!)
        
       

    // Do any additional setup after loading the view.
    }
    //3ab38ccb961b1f9a4e90350d59729851 : api key
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedMovie = movie["id"] as! Int
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.id = selectedMovie
     
        
    
    
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func posterPressed(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "trailerSegue", sender: nil)
    }
    
}
