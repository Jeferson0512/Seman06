//
//  ViewController.swift
//  Seman06
//
//  Created by Jeferson Bujaico on 4/2/19.
//  Copyright © 2019 Jeferson Bujaico Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Botones
    @IBOutlet weak var tableViewJ: UITableView!
    
//    var indexSeleccionado:Int = 0
    
    
    var tareas:[Tarea] = []

    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerTareas(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tareas = try context.fetch(Tarea.fetchRequest()) as! [Tarea]
        } catch {
            print("HA OCURRIDO UN PROBLEMA")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableViewJ.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "agregarSegue" {
//            let siguienteVc = segue.destination as! CrearTareaViewController
//            siguienteVc.vcAnterior = self
//        }
        if segue.identifier == "tareaSeleccionadaSegue" {
            let siguienteVc = segue.destination as! TareaCompletaViewController
            siguienteVc.tarea = sender as? Tarea
//            siguienteVc.anteriorVC = self
        }
    }
    
//    func createHomeWork() -> [Tarea]{
//        let homeWork = Tarea()
//        homeWork.nombre = "Pasear la perro"
//        homeWork.importante = false
//
//        let homeWork2 = Tarea()
//        homeWork2.nombre = "Comprar Verduras"
//        homeWork2.importante = true
//
//        let homeWork3 = Tarea()
//        homeWork3.nombre = "Lavar los servicios"
//        homeWork3.importante = false
//
//        return [homeWork, homeWork2, homeWork3]
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        tareas = createHomeWork()
        
        tableViewJ.dataSource = self
        tableViewJ.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        if tarea.importante {
            cell.textLabel?.text = "🙀\(tarea.nombre!)"
        }else{
            cell.textLabel?.text = tarea.nombre!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        indexSeleccionado = indexPath.row
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
}
