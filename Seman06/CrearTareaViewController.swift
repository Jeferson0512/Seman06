//
//  CrearTareaViewController.swift
//  Seman06
//
//  Created by Jeferson Bujaico on 4/3/19.
//  Copyright © 2019 Jeferson Bujaico Rodriguez. All rights reserved.
//

import UIKit

class CrearTareaViewController: UIViewController {
 
    //Declaramos al textField y Switch
    @IBOutlet weak var txtNameTarea: UITextField!
    @IBOutlet weak var swImportante: UISwitch!
    
    //creando una variable para la clase "viewController"
//    var vcAnterior = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //  Agregamos una funcion a partir del boton "Agregar"
    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let tarea = Tarea(context: context)
        tarea.nombre = txtNameTarea.text!
        tarea.importante = swImportante.isOn

        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        vcAnterior.tareas.append(tarea)
//        vcAnterior.tableViewJ.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
