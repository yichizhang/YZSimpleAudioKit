//
//  YZSimpleAudioRecorder.swift
//  twochat
//
//  Created by Yichi on 2/01/2015.
//  Copyright (c) 2015 Yichi Zhang. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class YZSimpleAudioRecorder: NSObject, AVAudioRecorderDelegate {
	
	var audioRecorder:AVAudioRecorder?
	
	func startRecordingAndSaveToURL(url:NSURL){
		
		var recordSettings =
		[
			AVFormatIDKey: kAudioFormatLinearPCM,
			AVSampleRateKey: 44100.0,
			AVNumberOfChannelsKey: 2,
			AVLinearPCMBitDepthKey: 16,
			AVLinearPCMIsBigEndianKey: false,
			AVLinearPCMIsFloatKey: false
		]
		var error:NSError?
		
		AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryRecord, error: &error)
		
		if(error != nil){ println(error?.localizedDescription); error = nil; return; }
		
		
		self.audioRecorder = AVAudioRecorder(URL: url, settings: recordSettings, error:&error)
		self.audioRecorder?.delegate = self
		
		self.audioRecorder?.meteringEnabled = true;
		if (self.audioRecorder?.prepareToRecord() == true){
			
			self.audioRecorder?.record()
		}
		
		
		if(error != nil){ println(error?.localizedDescription); error = nil; return; }
	}
	
	func pauseRecording() {
		
		self.audioRecorder?.pause()
		
	}
	
	func stopRecording() {
		
		self.audioRecorder?.stop()
	}
	
	func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
		
		println("Audio recorder record result: \(flag)")
		self.audioRecorder?.delegate = nil
		self.audioRecorder = nil
	}
	
	func audioRecorderEncodeErrorDidOccur(recorder: AVAudioRecorder!, error: NSError!) {
		
		println(error.localizedDescription)
	}
}
