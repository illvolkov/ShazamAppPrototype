//
//  MyMusicView.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 11.09.2022.
//

import UIKit

class MyMusicView: UIView {
    
    //MARK: - Private properties
    
    private var shazams = [ShazamSection]()
    
    //MARK: - Views
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Settings
    
    func setupSubViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 25, right: 20)
        collectionView.collectionViewLayout = layout
    }
    
    func configureView(with model: [ShazamSection]) {
        self.shazams = model
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate methods

extension MyMusicView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        shazams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shazams[section].shazams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = shazams[indexPath.section]
        let shazams = shazams[indexPath.section].shazams[indexPath.row]
        
        switch section.type {
        case .list:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RowCollectionViewCell.identifier,
                for: indexPath) as? RowCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: shazams)
            return cell
        case .verticalCard:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LatestShazamCollectionViewCell.identifier,
                for: indexPath) as? LatestShazamCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: shazams)
            return cell
        case .horizontalCard:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PlaylistForYouCollectionViewCell.identifier,
                for: indexPath) as? PlaylistForYouCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: shazams)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let section = shazams[indexPath.section]

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionReusableHeader.identifier,
                for: indexPath) as? SectionReusableHeader else { return UICollectionReusableView() }
            header.configure(with: section)
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionReusableFooter.identifier,
                for: indexPath) as? SectionReusableFooter else { return UICollectionReusableView() }
            footer.configure(with: section)
            return footer
        default:
            assert(false, "Unexpected element kind")
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout methods

extension MyMusicView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = shazams[indexPath.section]

        switch section.type {
        case .list:
            return CGSize(width: self.frame.width * 0.9, height: self.frame.width * 0.13)
        case .verticalCard:
            return CGSize(width: self.frame.width * 0.42, height: self.frame.width * 0.77)
        case .horizontalCard:
            return CGSize(width: self.frame.width * 0.9, height: self.frame.width * 0.34)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let section = shazams[section]
        
        switch section.type {
        case .list:
            return CGSize(width: self.frame.width * 0.9, height: self.frame.width * 0.14)
        case .verticalCard:
            return CGSize(width: self.frame.width * 0.9, height: self.frame.width * 0.12)
        case .horizontalCard:
            return CGSize(width: self.frame.width * 0.9, height: self.frame.width * 0.77)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        
        let section = shazams[section]
        
        switch section.type {
        case .list:
            return CGSize(width: 0, height: 0)
        case .horizontalCard, .verticalCard:
            return CGSize(width: self.frame.width * 0.9, height: self.frame.width * 0.2)
        }
        
    }
}
