//
//  AudioViewController.swift
//  Wonder Chat
//
//  Created by jake on 5/16/19.
//  Copyright © 2019 Yurii Kozlov. All rights reserved.
//

import Foundation
import IQAudioRecorderController

class AudioViewController {
    var delegate: IQAudioRecorderViewControllerDelegate
    
    init(delegate_: IQAudioRecorderViewControllerDelegate) {
        delegate = delegate_
    }
    
    func presentAudioRecorder(target: UIViewController) {
        
        let controller = IQAudioRecorderViewController()
        
        controller.delegate = delegate
        controller.title = "Record"
        controller.maximumRecordDuration = kAUDIOMAXDURATION
        controller.allowCropping = true
        target.presentBlurredAudioRecorderViewControllerAnimated(controller)
    }
}
