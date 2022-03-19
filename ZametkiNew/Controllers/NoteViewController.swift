//
//  NoteViewController.swift
//  ZametkiNew
//
//  Created by Ilya Kokorin on 17.03.2022.
//

import UIKit

class NoteViewController: UIViewController {
    
    
    var index: Int!
    var bodyText : String?
    var dateNote : Date!
    
    let formatter = DateFormatter()
    
    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "dd/MMM/yyyy HH:mm"
        navigationItem.title = formatter.string(from: dateNote)
        textView.text = bodyText
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        updateNote()
    }
    
    func updateNote(){
        notes[index].noteDate = getCurrentTime()
        navigationItem.title = formatter.string(from: notes[index].noteDate)
        notes[index].noteBody = textView.text
    }
    
    func getCurrentTime() -> Date {
        let currentTime = Date()
        return
       currentTime
    }
    
}
