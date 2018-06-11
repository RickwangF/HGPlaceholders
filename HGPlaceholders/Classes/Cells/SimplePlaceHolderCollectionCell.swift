//
//  SimplePlaceHolderCollectionCell.swift
//  HGPlaceholders
//
//  Created by Rick Wang on 2018/6/11.
//

import UIKit

class SimplePlaceHolderCollectionCell: UICollectionViewCell {
    
    var onActionButtonTap: (() -> Void)?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var placeholderImageView: UIImageView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    var tapGesture: UITapGestureRecognizer!
    
    var subtitleLabel: UILabel?
    var actionButton: UIButton?
    
    var cellView: UIView {
        return self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(sendPlaceholderAction(_:)))
        self.contentView.addGestureRecognizer(tapGesture)
    }
    //  MARK: - User interaction
    
    @IBAction func sendPlaceholderAction(_ sender: Any) {
        onActionButtonTap?()
        print("Placeholder tapped")
    }
    
    deinit {
        self.contentView.removeGestureRecognizer(tapGesture)
        tapGesture = nil
    }
}

extension SimplePlaceHolderCollectionCell: Reusable {}
extension SimplePlaceHolderCollectionCell: NibLoadable {}
extension SimplePlaceHolderCollectionCell: CellPlaceholding {}
