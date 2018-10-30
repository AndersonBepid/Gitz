//
//  RepositoryViewController+UICollectionViewDelegate.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright © 2018 Anderson Oliveira. All rights reserved.
//

import UIKit

extension RepositoryViewController: UICollectionViewDelegate {

}

extension RepositoryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeCell = CGSize(width: view.frame.width * 0.9, height: 90.0)
        return sizeCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let request = RepositoryScene.SelectRepository.Request(selectedRepository: repositories[indexPath.item])
        output?.selectRepository(request: request)
        router?.navigateToRepositoryDetailScene()
    }
}
