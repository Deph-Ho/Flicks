//
//  MoviesViewController.swift
//  Flicks
//
//  Created by Dephanie Ho on 1/30/17.
//  Copyright © 2017 Dephanie Ho. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [NSDictionary]?
    var endpoint = "now_playing"
    var filteredMovies: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        //refresh control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_refreshControl:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(endpoint)?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)

        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        
        //Display HUD right before the request is made
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(dataDictionary)
                    
                    //Hide HUD once the network request comes back
                    MBProgressHUD.hide(for: self.view, animated: true)
                    
                    self.movies = dataDictionary["results"] as? [NSDictionary]
                    self.filteredMovies = self.movies
                    
                    //Reload the tableView for new data
                    self.tableView.reloadData()
                    
                    //refreshControl.endRefreshing()
                    
                }
            }
        })
        task.resume()
        

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let filteredMovies = filteredMovies{
           return filteredMovies.count
        } else {
           return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = filteredMovies![indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        let posterPath = movie["poster_path"] as! String
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        if let imageUrl = URL(string: baseUrl + posterPath){
           //fade images
           cell.posterImageView.alpha = 0.0
           cell.posterImageView.setImageWith(imageUrl)
            UIView.animate(withDuration: 0.5, animations: {() ->Void in
                cell.posterImageView.alpha = 1.0
            })
        }
        cell.selectionStyle = .blue
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        
        print("row\(indexPath.row)")
        return cell
    }
  
    func refreshControlAction(_refreshControl: UIRefreshControl)
    {
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(endpoint)?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
         
        //let session = NSURLSession(configuration: NSURLSessionConfiguration.default, delegate: nil, delegateQueue: NSOperationQueue.main)
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
         
        let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
        if let data = data {
        if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
        print(dataDictionary)
         
        self.movies = dataDictionary["results"] as? [NSDictionary]
        self.filteredMovies = self.movies
        
         
        //Reload the tableView for new data
        self.tableView.reloadData()
         
        _refreshControl.endRefreshing()
         
                }
            }
        })
        task.resume()

    
    }
    /* Search Bar */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //if search bar is empty
        if searchText.isEmpty{
            filteredMovies = movies
        }
        //when search bar is not empty, return the filtered title list
        else{
            filteredMovies = searchText.isEmpty ? movies : movies!.filter({ (movie) -> Bool in
                return (movie["title"] as! String).lowercased().hasPrefix(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        //show original menu
        filteredMovies = movies
        self.tableView.reloadData()
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies![(indexPath?.row)!]
        let detailViewController = segue.destination as! DetailViewController
        
        detailViewController.movie = movie
        
        print("prepare for segue called")
    }
    
}
