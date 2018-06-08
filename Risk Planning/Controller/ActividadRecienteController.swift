//
//  ActividadRecienteController.swift
//  Risk Planning
//
//  Created by César Elías Segura on 30/5/18.
//  Copyright © 2018 César Elías Segura. All rights reserved.
//

import UIKit

class ActividadCelda: UITableViewCell {
    @IBOutlet weak var lblActividad: UILabel!
    @IBOutlet weak var lblProyecto: UILabel!
    @IBOutlet weak var lblPropietario: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var imgActividad: UIImageView!
}//Fin de clase

class ActividadRecienteController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    //Objetos
    @IBOutlet weak var segFiltro: UISegmentedControl!
    @IBOutlet weak var tblActividad: UITableView!
    
    //Contantes
    let actividadToda = ActividadRecienteAdministrador(realm: true)
    
    //Funciones de protocolo
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if actividadToda.obtenerFiltro() {
            return actividadToda.actividadListaFiltradaRealm.count
            }
            else{
                return actividadToda.actividadListaRealm.count
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var strImagen: String = ""
        var intActividadTipo: Int = 0
        let celda = tableView.dequeueReusableCell(withIdentifier: "actividad_reciente", for: indexPath) as! ActividadCelda
        if actividadToda.obtenerFiltro() {
            celda.lblActividad.text = actividadToda.actividadListaFiltradaRealm[indexPath.row].actividadNombre
            celda.lblProyecto.text = actividadToda.actividadListaFiltradaRealm[indexPath.row].proyectoNombre
            celda.lblPropietario.text = actividadToda.actividadListaFiltradaRealm[indexPath.row].propietarioNombre
            celda.lblFecha.text = actividadToda.actividadListaFiltradaRealm[indexPath.row].actividadFecha
            intActividadTipo = actividadToda.actividadListaFiltradaRealm[indexPath.row].actividadTipo
            }
            else{
                celda.lblActividad.text = actividadToda.actividadListaRealm[indexPath.row].actividadNombre
                celda.lblProyecto.text = actividadToda.actividadListaRealm[indexPath.row].proyectoNombre
                celda.lblPropietario.text = actividadToda.actividadListaRealm[indexPath.row].propietarioNombre
                celda.lblFecha.text = actividadToda.actividadListaRealm[indexPath.row].actividadFecha
                intActividadTipo = actividadToda.actividadListaRealm[indexPath.row].actividadTipo
                }
        switch intActividadTipo{
            case 1:
                strImagen = "Icono proyecto"
            case 2:
                strImagen = "Icono mitigacion"
            default:
                strImagen = "Icono tiempo"
            }
        celda.imgActividad.image = UIImage(named: strImagen)
        return celda
    }
    
    @IBAction func cambiarFiltro(_ sender: UISegmentedControl) {
        debugPrint("Cambio de filtro")
        switch segFiltro.selectedSegmentIndex {
        case 0:
            actividadToda.establecerFiltro(valor: false)
            /*print("Liberando espacio de base de datos")
            actividadToda.liberarActividadListaRealm()*/
            //print("Cargando nuevos datos ...")
            //actividadToda.precargarActividadListaRealm()
        case 1:
            actividadToda.aplicarFiltroRealm(tipo: 1)
        case 2:
            actividadToda.aplicarFiltroRealm(tipo: 2)
        default:
            actividadToda.aplicarFiltroRealm(tipo: 3)
            }
        tblActividad.reloadData()
        }
    
}//Fin de clase
