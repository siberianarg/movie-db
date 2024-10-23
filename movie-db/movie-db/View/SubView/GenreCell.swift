//
//  GenreCell.swift
//  movie-db
//
//  Created by siberianarg on 22.10.2024.
//

import UIKit
import SnapKit

class GenreCell: UICollectionViewCell {
    
    static let reuseID = String(describing: GenreCell.self)
    
    lazy var genreLabel: UILabel = {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.numberOfLines = 1
        $0.textColor = .black
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(genreLabel)
        
        genreLabel.snp.makeConstraints {
            $0.edges.equalTo(contentView.snp.edges)
        }
    }
}
    


