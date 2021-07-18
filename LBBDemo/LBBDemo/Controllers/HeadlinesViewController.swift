//
//  HeadlinesViewController.swift
//  MVVMDemo
//
//  Created by Poonam Sharma on 13/07/21.
//  Copyright © 2021 Conduent. All rights reserved.
//

import UIKit

class HeadlinesViewController: UIViewController {
    private var headlineViewModel: HeadlineViewModel?
    var headlines: [Article] = []
    private let _headlinesManager: HeadlinesManager = HeadlinesManager()
    var reachability = Reachability()
    @IBOutlet weak var headlinesTableView: UITableView! {
        didSet {
            headlinesTableView.delegate = self
            headlinesTableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        headlineViewModel = HeadlineViewModel()
        headlineViewModel?.delegate = self
        self.title = "Headlines"
        if reachability.isNetworkAvailable() {
        headlineViewModel?.getHeadlines(request: HeadlinesRequest())
        } else {
        headlines = _headlinesManager.fetchHeadlines()
        }
    }
}
extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell.textLabel?.text = headlines[indexPath.row].source.name
            let image = headlines[indexPath.row].urlToImage?.toImage()
            _headlinesManager.saveHeadlines(headline: headlines, index:indexPath.row, data: image?.pngData())
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HeadlinesDetailsVC") as? HeadlinesDetailsVC {
            nextViewController.headlines = headlines[indexPath.row]
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
extension HeadlinesViewController: HeadlineViewModelDelegate {
    func didReceiveHeadlineResponse(response: HeadlinesResponse) {
        print(response)
        headlines = response.articles
        headlinesTableView.reloadData()
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!")
    }
}
extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: []){
            return UIImage(data: data)
        }
        return nil
    }
}
