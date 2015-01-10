//
//  RecorderViewController.swift
//  gocrazy
//
//  Created by Yichi on 2/01/2015.
//  Copyright (c) 2015 Yichi Zhang. All rights reserved.
//

import UIKit

class RecorderViewController: UIViewController {

	var myRecorder = YZSimpleAudioRecorder()
	var myPlayer = YZSimpleAudioPlayer()
	var sampleAudioURL:NSURL {
		let dirPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as NSArray
		
		if dirPaths.count > 0 {
			if let docsDir:NSString = dirPaths[0] as? NSString {
				
				let filePath = docsDir.stringByAppendingPathComponent("happydonut.caf")
				let url:NSURL = NSURL(fileURLWithPath: filePath)!
				
				return url
				
			}
		}
		
		return NSURL()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func recordButtonTapped(sender: AnyObject) {
		
		myRecorder.startRecordingAndSaveToURL(self.sampleAudioURL)
	}
	
	@IBAction func pauseButtonTapped(sender: AnyObject) {
		
		myRecorder.pauseRecording()
	}
	
	@IBAction func stopButtonTapped(sender: AnyObject) {
		
		myRecorder.stopRecording()
	}
	
	@IBAction func playButtonTapped(sender: AnyObject) {
		
		myPlayer.startPlayingAudioAtURL(self.sampleAudioURL)
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
