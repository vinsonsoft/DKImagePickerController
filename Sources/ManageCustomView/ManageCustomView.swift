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
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var takePhotoBtn: UIButton!
    @IBOutlet weak var recordVideoBtn: UIButton!
    @IBOutlet weak var editLimitsBtn: UIButton!
    
    
    static public func instance(hasLimitedAccess: Bool, hidesCamera: Bool, hidesVideo: Bool, frame: CGRect) -> ManageCustomView {
       let view = ManageCustomView.fromNib()
        view.frame = frame

        view.configView(hasLimitedAccess: hasLimitedAccess, hidesCamera: hidesCamera, hidesVideo: hidesVideo)
        return view
    }
    
    func configView(hasLimitedAccess: Bool, hidesCamera: Bool, hidesVideo: Bool) {
        configLimittedPermisionView(hasLimitedAccess: hasLimitedAccess)
        configCameraView(hidesCamera: hidesCamera, hidesVideo: hidesVideo)
    }
    
    func configLimittedPermisionView(hasLimitedAccess: Bool) {
        LimittedPermisionView.isHidden = !hasLimitedAccess
        LimittedPermisionLbl.text = DKImagePickerControllerResource.localizedStringWithKey("limited.photo.access")
    }
    
    func configCameraView(hidesCamera: Bool, hidesVideo: Bool) {
        if hidesCamera && hidesVideo {
            cameraView.isHidden = true
        } else if hidesCamera {
            takePhotoBtn.isHidden = true
        } else if hidesVideo {
            recordVideoBtn.isHidden = true
        }
        
        takePhotoBtn.layer.cornerRadius = 12
        recordVideoBtn.layer.cornerRadius = 12
        
        takePhotoBtn.setTitle(DKImagePickerControllerResource.localizedStringWithKey("take.a.picture"), for: .normal)
        recordVideoBtn.setTitle(DKImagePickerControllerResource.localizedStringWithKey("record.a.video"), for: .normal)
    }
    
}
