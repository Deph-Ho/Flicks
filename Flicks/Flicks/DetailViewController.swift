//
//  DetailViewController.swift
//  Flicks
//
//  Created by Derek Ho on 2/7/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    //implicitly wrap
    var movie: NSDictionary!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let title = movie["title"] as? String
        titleLabel.text = title
        
        let overview = movie["overview"]
        overviewLabel.text = overview as? String
        print(movie)
        
        let posterPath = movie["poster_path"] as! String
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        if let imageUrl = URL(string: baseUrl + posterPath){
            posterImageView.setImageWith(imageUrl)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
