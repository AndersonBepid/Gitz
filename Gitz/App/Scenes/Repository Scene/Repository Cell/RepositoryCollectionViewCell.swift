//
//  RepositoryCollectionViewCell.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import UIKit

class RepositoryCollectionViewCell: UICollectionViewCell {

    // MARK: IBOutlets

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var repositoryImageView: UIImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var stargazersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!

    override func draw(_ rect: CGRect) {
        // Drawing code
        setupStyle()
    }
}

// MARK: Setup Style

extension RepositoryCollectionViewCell {

    private func setupStyle() {
        repositoryImageView.layer.cornerRadius = repositoryImageView.frame.height / 2.0
        containerView.layer.cornerRadius = 8.0
        dropShadow(radius: 8.0)
    }
}

extension RepositoryCollectionViewCell {

    func fill(_ repository: Repository) {
        repositoryNameLabel.text = repository.name
        usernameLabel.text = repository.owner?.name
        watchersLabel.text = formatter(value: repository.watchers)
        stargazersLabel.text = formatter(value: repository.stargazers)
        forksLabel.text = formatter(value: repository.forks)
        guard let urlImageString = repository.owner?.avatar else { return }
        repositoryImageView.loadImageUsingCache(withUrlString: urlImageString, defaultImage: #imageLiteral(resourceName: "github"), loadingActivityIndicatorStyle: .white)
    }

    private func formatter(value: Int?) -> String {
        guard let value = value else { return "--" }
        return String(value)
    }
}
