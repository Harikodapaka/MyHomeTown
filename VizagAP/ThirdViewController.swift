//
//  ThirdViewController.swift
//  VizagAP
//
//  Created by Chaitanya Kodapaka on 2019-08-06.
//  Copyright © 2019 India. All rights reserved.
//

import UIKit
import AVFoundation


class ThirdViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let songs = ["Telugu Song1","Telugu Song2","Telugu Song3","Telugu Song4","Telugu Song5","Telugu Song6","Telugu Song7","Telugu Song8","Telugu Song9","Telugu Song10"]
    var nowPlaying: Int = 0
    var audioPlayer = AVAudioPlayer()
    var selectedrow: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)

    }
    
    @IBAction func PlayButton(_ sender: UIButton) {
        let buttonPosition : CGPoint = sender.convert(sender.bounds.origin, to: tableView)
        let indexPath = tableView.indexPathForRow(at: buttonPosition)
        if(selectedrow ==  indexPath!.row){
            nowPlaying = indexPath!.row
            play(song: songs[indexPath!.row])
        }
    }
    
    @IBAction func PauseButton(_ sender: UIButton) {
        let buttonPosition : CGPoint = sender.convert(sender.bounds.origin, to: tableView)
        let indexPath = tableView.indexPathForRow(at: buttonPosition)
        if( nowPlaying == indexPath!.row){
            print(nowPlaying)
            print(indexPath)
            if audioPlayer.isPlaying
            {
                audioPlayer.pause()
            }
            else{
                audioPlayer.play()
            }
        }
    }
    
    @IBAction func StopButton(_ sender: UIButton) {
        let buttonPosition : CGPoint = sender.convert(sender.bounds.origin, to: tableView)
        let indexPath = tableView.indexPathForRow(at: buttonPosition)
        if( nowPlaying == indexPath!.row){
            if audioPlayer.isPlaying
            {
                audioPlayer.stop()
            }
        }
    }
    func play(song: String) -> Void {
        do{
            audioPlayer =  try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: song, ofType: "mp3")!))
            
            audioPlayer.prepareToPlay()
            
            var audioSession =  AVAudioSession.sharedInstance()
            
            do{
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
            }
            catch{
                print(error)
            }
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }

}
extension ThirdViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let student = songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row]
        cell.contentView.bringSubviewToFront(cell.contentView)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedrow = indexPath.row
    }
    
    
}
