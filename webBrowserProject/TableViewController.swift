//
//  TableViewController.swift
//  webBrowserProject
//
//  Created by Ramin Akhmad on 21.05.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
   
    weak var delegate: ViewControllerDelegate?
    var myNotes: [URL] = []
    private let cellIdentifier = "urlCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        myNotes = UserSettings.shared.urlArray.compactMap { URL(string: $0) }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let curNote = myNotes[indexPath.row]
        cell.textLabel?.text = String(curNote.absoluteString)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let url = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        delegate?.pressedCell(url: url)
        dismiss(animated: true, completion: nil)
    }

}

