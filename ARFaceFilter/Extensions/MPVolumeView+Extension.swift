//
//  MPVolumeView+Extension.swift
//  WalkiTalki-Redesign
//
//  Created by Appnap WS02 on 15/5/24.
//

import AVFoundation
import MediaPlayer

extension MPVolumeView {
  static func setVolume(_ volume: Float) {
    let volumeView = MPVolumeView()
    let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
        if slider?.value != 0
        {
            slider?.value = 0
        }
        else
        {
            slider?.value = volume
        }
      
    }
  }
}
