//
//  HeadlinesDetailsVC.swift
//  MVVMDemo
//
//  Created by Poonam Sharma on 15/07/21.
//  Copyright © 2021 Conduent. All rights reserved.
//

import UIKit

class HeadlinesDetailsVC: UIViewController {
    var headlines: Article?
    @IBOutlet weak var headlinesDetailsTableView: UITableView! {
        didSet {
            self.headlinesDetailsTableView.delegate = self
            self.headlinesDetailsTableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        headlinesDetailsTableView.register(UINib(nibName: "HeadlinesDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "HeadlinesDetailsTableViewCell")
        self.title = headlines?.source.name
    }
}
extension HeadlinesDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlinesDetailsTableViewCell", for: indexPath) as? HeadlinesDetailsTableViewCell {
            cell.configureCellData(headlines: headlines)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}
