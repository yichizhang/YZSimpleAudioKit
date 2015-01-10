//
//  YZSimpleAudioPlayer.swift
//  gocrazy
//
//  Created by Yichi on 2/01/2015.
//  Copyright (c) 2015 Yichi Zhang. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class YZSimpleAudioPlayer: NSObject, AVAudioPlayerDelegate {
	
	var audioPlayer:AVAudioPlayer?
	
	func startPlayingAudioAtURL(url:NSURL){
		
		var error:NSError?
		
		AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: &error)
		
		if(error != nil){ println(error?.localizedDescription); error = nil; return; }
		
		if(NSFileManager.defaultManager().fileExistsAtPath(url.path!) == false) {
			// File does not exist
			return;
		}
		
		self.audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
		
		if(error != nil){ println(error?.localizedDescription); error = nil; return; }
		
		self.audioPlayer?.numberOfLoops = 0
		self.audioPlayer?.meteringEnabled = true
		self.audioPlayer?.delegate = self
		
		self.audioPlayer?.play()
		
	}
	
	func pausePlayer(){
		
		self.audioPlayer?.pause()
	}
	
	func stopPlayer() {
		
		self.audioPlayer?.stop()
	}
	
	func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
		
		println("Audio player play result: \(flag)")
		self.audioPlayer?.delegate = nil
		self.audioPlayer = nil
	}
	
	func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
		
		println(error.localizedDescription)
	}
}
