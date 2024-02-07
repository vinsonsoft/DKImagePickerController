//
//  CustomView.swift
//  DKImagePickerController
//
//  Created by Mohamed Alsheikh on 30/05/2022.
//

import Foundation
import UIKit

open class CustomPhotosPermissionsManager: DKImagePickerControllerBaseUIDelegate {
    let hasLimitedAccess: Bool
    let hidesCamera: Bool
    let hidesVideo: Bool
    init(hasLimitedAccess: Bool, hidesCamera: Bool, hidesVideo: Bool) {
        self.hasLimitedAccess = hasLimitedAccess
        self.hidesCamera = hidesCamera
        self.hidesVideo = hidesVideo
    }
    lazy var header: UIView = {
        var height = 0
        if !hidesCamera || !hidesVideo {
            height = 40
        }
        if hasLimitedAccess {
            height += 60
        }
        height += 135
        let width = UIScreen.main.bounds.width
        let header = ManageCustomView.instance(hasLimitedAccess: hasLimitedAccess,
                                               hidesCamera: hidesCamera,
                                               hidesVideo: hidesVideo,
                                               frame: CGRect(x: 0, y: 0, width: Int(width), height: height))

        header.editLimitsBtn.addTarget(imagePickerController, action: #selector(DKImagePickerController.managePermission), for: .touchUpInside)
        header.takePhotoBtn.addTarget(imagePickerController, action: #selector(self.imagePickerController?.presentCamera), for: .touchUpInside)
        header.recordVideoBtn.addTarget(imagePickerController, action: #selector(self.imagePickerController?.presentCamera), for: .touchUpInside)
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

public protocol NibInstantiatable {
    
    static func nibName() -> String
    
}

extension NibInstantiatable {
    
    static func nibName() -> String {
        return String(describing: self)
    }
    
}

extension NibInstantiatable where Self: UIView {
    
    static func fromNib() -> Self {
        
        let bundle = Bundle(for: self)
        let nib = bundle.loadNibNamed(nibName(), owner: self, options: nil)
        
        return nib!.first as! Self
        
    }
    
}
