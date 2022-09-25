//
//  ViewController.swift
//  HaberUygulamasi
//
//  Created by Recep Akkoyun on 21.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        veriAl()
    }
    
    func veriAl() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-%C4%B0OSDataSet/master/dataset.json")
        WebService().haberleriIndir(url: url!) { (haberler) in
            if let haberler = haberler {
                self.newsTableViewModel = NewsTableViewModel(newList: haberler)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : newsTableViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(index: indexPath.row)
        cell.lblStory.text = newsViewModel.story
        cell.lblTitle.text = newsViewModel.title
        return cell
    }

}

