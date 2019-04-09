//
//  TareaCompletaViewController.swift
//  Seman06
//
//  Created by Jeferson Bujaico on 4/3/19.
//  Copyright © 2019 Jeferson Bujaico Rodriguez. All rights reserved.
//

import UIKit

class TareaCompletaViewController: UIViewController {

    //  Creamos una variable llamando a Tarea y el ViewController
//    var tarea = Tarea()
    var anteriorVC = ViewController()
    
    var tarea : Tarea? = nil
    
    @IBOutlet weak var tareaLabel: UILabel!
    @IBAction func completarTarea(_ sender: Any) {
//        anteriorVC.tareas.remove(at: anteriorVC.indexSeleccionado)
//        anteriorVC.tableViewJ.reloadData()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //==== Esto hace referencia cuando le decimos que, queremos ver que nombre es que le esta dando "tap"
        if tarea!.importante {
            tareaLabel.text = "🙀\(tarea!.nombre!)"
        } else {
            tareaLabel.text = tarea!.nombre!
        }
    }
}
