//
//  MerchantCell.swift
//  GOW
//
//  Created by Luis Enrique Perez Tapia on 16/03/25.
//

import UIKit

class MerchantCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    let merchantName : UILabel = {
    
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        
        
        label.textColor = .text
        
        return label
    }()
    
    
    
    
    let merchantPrice:PaddingLabel = {
        
        let label = PaddingLabel()
        
        
        
        label.textAlignment = .right
        
        label.textColor = .text
        
        label.backgroundColor = .gowRed
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 7
        
        return label
    }()
    
    let merchantImage : UIImageView = {
        
        let image = UIImageView()
    
        return image
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI(){
        
        self.contentView.backgroundColor = .gowBlack1
        
        self.contentView.addSubview(merchantImage)
        self.contentView.addSubview(merchantName)
        self.contentView.addSubview(merchantPrice)
        
        
        merchantImage.translatesAutoresizingMaskIntoConstraints = false
        merchantName.translatesAutoresizingMaskIntoConstraints = false
        merchantPrice.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            merchantImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            merchantImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            merchantImage.widthAnchor.constraint(equalToConstant: 120),
            merchantImage.heightAnchor.constraint(equalToConstant: 120),
            merchantPrice.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            merchantPrice.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            merchantName.topAnchor.constraint(equalTo: merchantPrice.bottomAnchor, constant: 10),
            merchantName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            merchantName.leadingAnchor.constraint(equalTo: merchantImage.trailingAnchor, constant: 10)
            
        ])
        
        
    }

}


class PaddingLabel: UILabel {
    
    
    

   @IBInspectable var topInset: CGFloat = 5.0
   @IBInspectable var bottomInset: CGFloat = 5.0
   @IBInspectable var leftInset: CGFloat = 5.0
   @IBInspectable var rightInset: CGFloat = 5.0
    
    
    convenience init(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) {
            self.init(frame: .zero)
            self.topInset = top
            self.bottomInset = bottom
            self.leftInset = left
            self.rightInset = right
        }

   override func drawText(in rect: CGRect) {
      let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
       super.drawText(in: rect.inset(by: insets))
   }

   override var intrinsicContentSize: CGSize {
      get {
         var contentSize = super.intrinsicContentSize
         contentSize.height += topInset + bottomInset
         contentSize.width += leftInset + rightInset
         return contentSize
      }
   }
}
