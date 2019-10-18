//
//  RecordSoundViewController.swift
//  Picthperfect
//
//  Created by Taiwo Adebayo on 03/10/2019.
//  Copyright © 2019 Taiwo Adebayo. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    var audioRecorder : AVAudioRecorder!
    
    override func viewWillAppear(_ animated: Bool) {
         print("view will appear called")
        stopRecordButton.isEnabled = false
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear called")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear called")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear called")
        super.viewDidDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func recordAudio(_ sender : AnyObject){
        print("The record button was pressed")
        stopRecordButton.isEnabled = true
        recordButton.isEnabled = false
        recordingLabel.text = "Recording in progress"
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedvoice.wav"
        let pathArray = [dirPath, recordingName]

        let filePath = URL(string: pathArray.joined(separator:"/"))
        print(filePath)

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(.playAndRecord, mode: .default)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    
    @IBAction func stopAudio(_ sender: Any) {
        print("The stop record button was pressed")
        stopRecordButton.isEnabled = false
        recordButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
        audioRecorder.stop()
        let audiosession = AVAudioSession.sharedInstance()
        try! audiosession.setActive(false)
    }
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("finished recording")
        if flag{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
        else{
            print("recording was not successful")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "stopRecording" {
//            let playSoundVC  = segue.destination as! PlaySoundsViewController
//            let recordedAudioURL = segue as! URL
//            playSoundVC.audioRecorded = recordedAudioURL
//        }
//    }

}

