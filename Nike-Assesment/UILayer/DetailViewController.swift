//
//  DetailViewController.swift
//  Nike-Assesment
//
//  Created by Varshini Thatiparthi on 3/31/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    var result: AlbumResults?
    
    init(result: AlbumResults?) {
        super.init(nibName: nil, bundle: nil)
        
        self.result = result
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let result = result else { return }
        
        view.backgroundColor = UIColor.white
        edgesForExtendedLayout = []
        
        let mainStackView = UIStackView.configureStackView()
        view.addSubview(mainStackView)
        mainStackView.addConstaintsToSuperview(leadingOffset: 15, trailingOffset: 15, topOffset: 15, bottomOffset: 15)
        
        mainStackView.addArrangedSubview(UIImageView.updateAlbumImage(url: result.artworkUrl100, height: 400))
        
        let genreStackView = createLabelStackView(from: Constants.genre,
                                                  subTitle: result.genres.first?.name ?? "--")
        
        mainStackView.addArrangedSubViews([
            createLabelStackView(from: Constants.album, subTitle: result.name),
            createLabelStackView(from: Constants.artist, subTitle: result.artistName),
            genreStackView,
        ])
        
        mainStackView.setCustomSpacing(30, after: genreStackView)
        mainStackView.addArrangedSubview(UILabel.createLabel(from: result.copyright, numberOfLines: 0))
        
        mainStackView.addArrangedSubview(UIView())
    }
    
    func createLabelStackView(from title: String, subTitle: String) -> UIStackView {
        let stackView = UIStackView.configureStackView(spacing: 0, axis: .horizontal)
        stackView.addArrangedSubview(UILabel.createLabel(from: title, enableBoldFont: true))
        stackView.addArrangedSubview(UILabel.createLabel(from: subTitle))
        return stackView
    }
}

private extension DetailViewController {
    enum Constants {
        static let album = "Album: "
        static let artist = "Artist: "
        static let genre = "Genres: "
    }
}



