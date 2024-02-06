//
//  ManageCustomView.swift
//  DKImagePickerController
//
//  Created by Mohamed Alsheikh on 05/02/2024.
//

import Foundation
class ManageCustomView: UIView, NibInstantiatable {
    @IBOutlet weak var takePicture: UIView!
    @IBOutlet weak var LimittedPermisionView: UIView!
    @IBOutlet weak var LimittedPermisionLbl: UILabel!
    
    @IBOutlet weak var takePhotoBtn: UIButton!
    @IBOutlet weak var recordVideoBtn: UIButton!
    @IBOutlet weak var editLimitsBtn: UIButton!
    
    
    static public func instance(hasLimitedAccess: Bool, frame: CGRect) -> ManageCustomView {
       let view = ManageCustomView.fromNib()
        view.frame = frame

        view.configView(hasLimitedAccess: hasLimitedAccess)
        return view
    }
    
    func configView(hasLimitedAccess: Bool) {
        LimittedPermisionView.isHidden = !hasLimitedAccess
        LimittedPermisionLbl.text = DKImagePickerControllerResource.localizedStringWithKey("limited.photo.access")
        takePhotoBtn.layer.cornerRadius = 12
        recordVideoBtn.layer.cornerRadius = 12
    }
    
}
