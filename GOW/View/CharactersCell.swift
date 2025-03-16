//
//  CharactersCell.swift
//  GOW
//
//  Created by Luis Enrique Perez Tapia on 16/03/25.
//

import UIKit

class CharactersCell: UITableViewCell {
    
    static let identifier = "CharacterTableViewCell"
    let characterName : UILabel = {
    
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        
        
        label.textColor = .text
        
        return label
    }()
    
    
    
    
    
    
    let characterImage : UIImageView = {
        
        let image = UIImageView()
        
    
        return image
        
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupUI(){
        
        self.contentView.backgroundColor = .gowBlack1
        
        self.contentView.addSubview(characterImage)
        self.contentView.addSubview(characterName)
        
        
        
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            characterImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            characterImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            characterImage.widthAnchor.constraint(equalToConstant: 150),
            characterImage.heightAnchor.constraint(equalToConstant: 150),
            
            characterName.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 10),
            
            
        ])
        
        
    }

}



