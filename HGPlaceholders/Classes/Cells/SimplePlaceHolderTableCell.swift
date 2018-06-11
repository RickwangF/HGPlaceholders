//
//  SimplePlaceHolderTableCell.swift
//  HGPlaceholders
//
//  Created by Rick Wang on 2018/6/11.
//

import UIKit

class SimplePlaceHolderTableCell: UITableViewCell {

    @IBOutlet weak var placeholderImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    var subtitleLabel: UILabel?
    var actionButton: UIButton?
    
    var tapGesture: UITapGestureRecognizer!
    
    var onActionButtonTap: (() -> Void)?
    
    var cellView: UIView {
        return self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(sendPlaceholderAction(_:)))
        self.contentView.addGestureRecognizer(tapGesture)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func sendPlaceholderAction(_ sender: Any) {
        onActionButtonTap?()
        print("Placeholder tapped")
    }
    
    deinit {
        self.contentView.removeGestureRecognizer(tapGesture)
        tapGesture = nil
    }
}

extension SimplePlaceHolderTableCell: NibLoadable {}
extension SimplePlaceHolderTableCell: Reusable {}
extension SimplePlaceHolderTableCell: CellPlaceholding {}
