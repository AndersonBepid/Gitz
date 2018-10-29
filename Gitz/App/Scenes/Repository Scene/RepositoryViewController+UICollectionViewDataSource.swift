//
//  RepositoryViewController+UICollectionViewDataSource.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import UIKit

extension RepositoryViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repositories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepositoryViewController.cellIdentifier, for: indexPath)
        let repository = repositories[indexPath.item]
        guard let repositoryCell = cell as? RepositoryCollectionViewCell else {
            return UICollectionViewCell()
        }

        repositoryCell.fill(repository)

        return repositoryCell
    }
}
