//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Lesly Higuera on 8/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!

    private let kmyKey = "MY_KEY"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = NSLocalizedString("Hello Higuera", comment: "")
        
        welcomeLabel.text = NSLocalizedString("Welcome", comment: "")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - UserDefaults
    
    
    // Recuperamos las preferencias
    @IBAction func getButtonAction(_ sender: Any) {
       if let value = UserDefaults.standard.string(forKey: kmyKey) {
            showAlert(message: value)
        } else {
            showAlert(message: "No hay un valor para esta clave")
        }
    }
    
    // Guarda las preferencias
    @IBAction func putButtonAction(_ sender: Any) {
        UserDefaults.standard.set("SUSCRIBETE", forKey: kmyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado un valor")
        
    }
    
    // Borra las preferencias
    @IBAction func deleteButtonAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: kmyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")
    }
    
    private func showAlert(message: String) {
        
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

