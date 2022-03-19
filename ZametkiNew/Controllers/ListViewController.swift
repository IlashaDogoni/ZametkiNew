//
//  ListViewController.swift
//  ZametkiNew
//
//  Created by Ilya Kokorin on 17.03.2022.
//

import UIKit

class ListViewController: UITableViewController {
    
    var selectedIndex = -1
    let currentDate = Date()
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if notes[0].noteBody.isBlank{
            notes.removeFirst()
        }
        self.tableView.reloadData()
    }
    
    @IBAction func newNote(_ sender: UIBarButtonItem) {
        let newDateAndBody = [Note(noteDate: currentDate, noteBody: "")]
        notes.insert(contentsOf: newDateAndBody, at: 0)
        selectedIndex = 0
        performSegue(withIdentifier: "showEditorSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            print(selectedRow)
            let notesEditorVC = segue.destination as! NoteViewController
            notesEditorVC.dateNote = notes[selectedRow].noteDate
            notesEditorVC.bodyText = notes[selectedRow].noteBody
            notesEditorVC.index = selectedRow
        } else {
            let notesEditorVC = segue.destination as! NoteViewController
            notesEditorVC.dateNote = notes[selectedIndex].noteDate
            notesEditorVC.bodyText = notes[selectedIndex].noteBody
            notesEditorVC.index = selectedIndex
        }
    }
    
    func saveNotes() {
        UserDefaults.standard.set(notes, forKey: "notes")
        UserDefaults.standard.synchronize()
    }
//MARK: - Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].noteBody
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEditorSegue", sender: nil )
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension String {
  var isBlank: Bool {
    return allSatisfy({ $0.isWhitespace })
  }
}
