//
//  ViewController.swift
//  CatchTheCrashGame
//
//  Created by bushra nazal alatwi on 12/04/1444 AH.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var player: AVAudioPlayer?
  var timer = Timer()
  var hideTimer = Timer()
  var crashArray = [UIImageView]()
  var counter = 0
  var score = 0
  var highScore = 0
  
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var highScoreLabel: UILabel!
  @IBOutlet weak var crashImageView1: UIImageView!
  @IBOutlet weak var crashImageView2: UIImageView!
  @IBOutlet weak var crashImageView3: UIImageView!
  @IBOutlet weak var crashImageView4: UIImageView!
  @IBOutlet weak var crashImageView5: UIImageView!
  @IBOutlet weak var crashImageView6: UIImageView!
  @IBOutlet weak var crashImageView7: UIImageView!
  @IBOutlet weak var crashImageView8: UIImageView!
  @IBOutlet weak var crashImageView9: UIImageView!
  @IBOutlet weak var crashImageView10: UIImageView!
  @IBOutlet weak var crashImageView11: UIImageView!
  @IBOutlet weak var crashImageView12: UIImageView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startTime()
    setUpImage()
    randomTime()
    stordHighScore()
  }
  
  func startTime(){
    playSound(forResource: "crash")
    counter = 30
    timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(downTime), userInfo: nil, repeats: true)
  }
  
  func randomTime(){
    hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
  }

  @objc func downTime(){
    if counter > 0 {
      counter -= 1
      timeLabel.text = "Time: \(counter)"
    } else{
      timer.invalidate()
      showAlert()
      isHideCrash()
      highScoreCrash()
      
    }
      
  }
  
  func isHideCrash(){
    for crash in crashArray {
      crash.isHidden = true
      hideTimer.invalidate()
    }
  }
  
  
  func setUpImage(){
    
    crashImageView1.isUserInteractionEnabled = true
    crashImageView2.isUserInteractionEnabled = true
    crashImageView3.isUserInteractionEnabled = true
    crashImageView4.isUserInteractionEnabled = true
    crashImageView5.isUserInteractionEnabled = true
    crashImageView6.isUserInteractionEnabled = true
    crashImageView7.isUserInteractionEnabled = true
    crashImageView8.isUserInteractionEnabled = true
    crashImageView9.isUserInteractionEnabled = true
    crashImageView10.isUserInteractionEnabled = true
    crashImageView11.isUserInteractionEnabled = true
    crashImageView12.isUserInteractionEnabled = true
    
    let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer10 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer11 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    let tapGestureRecognizer12 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    
    crashImageView1.addGestureRecognizer(tapGestureRecognizer1)
    crashImageView2.addGestureRecognizer(tapGestureRecognizer2)
    crashImageView3.addGestureRecognizer(tapGestureRecognizer3)
    crashImageView4.addGestureRecognizer(tapGestureRecognizer4)
    crashImageView5.addGestureRecognizer(tapGestureRecognizer5)
    crashImageView6.addGestureRecognizer(tapGestureRecognizer6)
    crashImageView7.addGestureRecognizer(tapGestureRecognizer7)
    crashImageView8.addGestureRecognizer(tapGestureRecognizer8)
    crashImageView9.addGestureRecognizer(tapGestureRecognizer9)
    crashImageView10.addGestureRecognizer(tapGestureRecognizer10)
    crashImageView11.addGestureRecognizer(tapGestureRecognizer11)
    crashImageView12.addGestureRecognizer(tapGestureRecognizer12)
    
    
    
  }
  
  @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
    playSound(forResource: "crachScore")
    updateScore()
  }
  
  
  func updateScore(){
    score += 1
    scoreLabel.text = "Score: \(score)"
  }
  
  func showAlert(){
    let alert = UIAlertController(title:"Time is over", message: "Do you want to play again", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default))
    alert.addAction(UIAlertAction(title: "Replay", style: .default) { UIAlertAction in
      self.score = 0
      self.scoreLabel.text = "Score: \(self.score)"
      self.startTime()
      self.randomTime()
    })
    present(alert, animated: true)
    
  }
  
  @objc func showRandomImage(){
    crashArray = [crashImageView1,
                  crashImageView2,
                  crashImageView3,
                  crashImageView4,
                  crashImageView5,
                  crashImageView6,
                  crashImageView7,
                  crashImageView8,
                  crashImageView9,
                  crashImageView10,
                  crashImageView11,
                  crashImageView12]
    for crash in crashArray {
      crash.isHidden = true
    }
    
    let random = arc4random_uniform(UInt32(crashArray.count-1))
    crashArray[Int(random)].isHidden = false
  }
  
  func highScoreCrash(){
    if score > highScore {
      highScore = score
      highScoreLabel.text = "HighScore: \(highScore)"
      UserDefaults.standard.set(highScore, forKey: "highscore")
    }
  }
  
  
  func stordHighScore(){
    let stordHighScore = UserDefaults.standard.object(forKey: "highscore")
    if stordHighScore == nil {
      highScore = 0
      highScoreLabel.text = "HighScore: \(highScore)"
    }
    
    if let newHighScore = stordHighScore as? Int {
      highScore = newHighScore
      highScoreLabel.text = "HighScore: \(highScore)"
    }
  }
  
  
  func playSound(forResource: String) {
      guard let url = Bundle.main.url(forResource: forResource, withExtension: "mp3") else { return }

      do {
          try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
          try AVAudioSession.sharedInstance().setActive(true)
          player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
          guard let player = player else { return }
          player.play()

      } catch let error {
          print(error.localizedDescription)
      }
  }
}

