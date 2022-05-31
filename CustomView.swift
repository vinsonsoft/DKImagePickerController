//
//  CustomView.swift
//  DKImagePickerController
//
//  Created by Mohamed Alsheikh on 30/05/2022.
//

import Foundation
import UIKit
import DKImagePickerController

open class CustomView: DKImagePickerControllerBaseUIDelegate {
    var actionLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.textAlignment = .left
        topLabel.font = UIFont.systemFont(ofSize: 15)
        topLabel.textColor = .black
        topLabel.numberOfLines = 0
        topLabel.text = DKImagePickerControllerResource.localizedStringWithKey("limited.photo.access")
        return topLabel

    }()
    var actionButton: UIButton = {
        let actionButton = UIButton()
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.backgroundColor = .systemBlue
        actionButton.setTitle("manage", for: .normal)
        actionButton.layer.cornerRadius = 6
        return actionButton
    }()
    
    lazy var header: UIView = {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70))
        header.backgroundColor = UIColor.white
        header.addSubview(actionLabel)
        actionLabel.topAnchor.constraint(equalTo: header.topAnchor, constant: 10).isActive = true
        actionLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 10).isActive = true
        actionLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -120).isActive = true
        
        header.addSubview(actionButton)
        actionButton.topAnchor.constraint(equalTo: header.topAnchor, constant: 10).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -10).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        actionButton.addTarget(imagePickerController, action: #selector(DKImagePickerController.managePermission), for: .touchUpInside)
        return header
    }()
    
    override open func prepareLayout(_ imagePickerController: DKImagePickerController, vc: UIViewController) {
        self.imagePickerController = imagePickerController
    }
    
    override open func imagePickerController(_ imagePickerController: DKImagePickerController,
                                               showsCancelButtonForVC vc: UIViewController) {
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                               target: imagePickerController,
                                                               action: #selector(imagePickerController.dismiss as () -> Void))
    }

    override open func imagePickerController(_ imagePickerController: DKImagePickerController,
                                               hidesCancelButtonForVC vc: UIViewController) {
        vc.navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: self.createDoneButtonIfNeeded())
    }
    
    override open func imagePickerControllerHeaderView(_ imagePickerController: DKImagePickerController) -> UIView? {
        return self.header
    }

}
