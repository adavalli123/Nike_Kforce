//
//  TableView.swift
//  Nike-Assesment
//
//  Created by Varshini Thatiparthi on 4/2/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

protocol UpdateAlbumDelegate {
    func update(_ result: [AlbumResults])
}

class TableView: UITableView {
    var results: [AlbumResults] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    init() {
        super.init(frame: .zero, style: .plain)
        setupTableView()
        registerTableViewCells()
        conformToDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        self.tableFooterView = UIView()
    }
    
    private func registerTableViewCells() {
        self.register(AlbumTableViewCell.self, forCellReuseIdentifier: String(describing: AlbumTableViewCell.self))
    }
    
    private func conformToDataSource() {
        self.dataSource = self
    }
}

extension TableView: UpdateAlbumDelegate {
    func update(_ results: [AlbumResults]) {
        self.results = results
    }
}

extension TableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AlbumTableViewCell.self), for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        
        let result = results[indexPath.row]
        cell.configure(url: result.artworkUrl100, artist: result.artistName, album: result.name)
        return cell
    }
}


