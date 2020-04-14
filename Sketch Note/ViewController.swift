//
//  ViewController.swift
//  Sketch Note
//
//  Created by michael tamsil on 13/04/20.
//  Copyright © 2020 michael tamsil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var newFile: UIButton!
    
    @IBOutlet weak var btnBlackLine: UIButton!
    @IBOutlet weak var btnGrayLine: UIButton!
    @IBOutlet weak var btnEraser: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnLink: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        canvasView.layer.borderWidth = 2
        canvasView.layer.borderColor = UIColor.black.cgColor
        btnBlackLine.isHidden = true
        btnGrayLine.isHidden = true
        btnSave.isHidden = true
        btnLink.isHidden = true
        btnPlay.isHidden = true
        btnEraser.isHidden = true
        
    }

    @IBAction func createNewFile(_ sender: Any) {
        let defaultAction = UIAlertAction(title: "OK",
            style: .default) { (action) in
                self.canvasView.clearCanvas()
                self.btnBlackLine.isHidden = false
                self.btnGrayLine.isHidden = false
                self.btnSave.isHidden = false
                self.btnLink.isHidden = false
                self.btnPlay.isHidden = false
                self.btnEraser.isHidden = false
                                            // Respond to user selection of the action.
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel) { (action) in
                                            // Respond to user selection of the action.
        }
        
        let isCreateNew = UIAlertController(title: "Confirm", message: "Are you want to create new file?", preferredStyle: .alert)
        isCreateNew.addAction(defaultAction)
        isCreateNew.addAction(cancelAction)
        
        self.present(isCreateNew, animated: true, completion: nil)
    }
    
    @IBAction func btnChangeToBlack(_ sender: Any) {
        self.canvasView.changeToBlack()
    }
    
    
    @IBAction func btnChangeToGray(_ sender: Any) {
        self.canvasView.changeToGrey()
    }
    
    @IBAction func btnEraserToLine(_ sender: Any) {
        self.canvasView.changeToErase()
    }
}

