//
//  ViewController.swift
//  Nike-Assesment
//
//  Created by Varshini Thatiparthi on 3/27/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit
import Foundation

final class ViewController: UIViewController {
    var viewModal: ViewModal = ViewModal()
    let tableView = TableView()
    
    override func loadView() {
        super.loadView()
        loadViewSetup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func addTableViewToSuperView() {
        self.view.addSubview(tableView)
        tableView.addConstaintsToSuperview()
    }
    
    func loadViewSetup() {
        view.backgroundColor = .white
        tableView.delegate = self
        addTableViewToSuperView()
    }
    
    func setup() {
        title = viewModal.setTitle()
        viewModal.delegate = tableView
        viewModal.handleTopAlbumsAPI()
    }
    
    func getDetailVC(from indexPath: Int) -> DetailViewController? {
        if let result = self.tableView.results[exist: indexPath] {
            return DetailViewController(result: result)
        }
        
        return nil
    }
    
    func pushToDetailViewController(from indexPath: Int) {
        guard let detailVC = getDetailVC(from: indexPath) else { return }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToDetailViewController(from: indexPath.row)
    }
}
