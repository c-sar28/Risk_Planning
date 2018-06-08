//
//  ActividadRecienteListadoTest.swift
//  Risk Planning
//
//  Created by César Elías Segura on 30/5/18.
//  Copyright © 2018 César Elías Segura. All rights reserved.
//

import Foundation
import RealmSwift

class ActividadRecienteListadoTest{
    //Constantes
    let rdbManejador = try! Realm()
    //Variables
    var actividadLista = [ActividadRecienteModel]()
    var actividadListaFiltrada = [ActividadRecienteModel]()
    var actividadFiltrado: Bool = false
    
    //Funciones
    init(realm: Bool){
        if realm {
            precargarActividadListaRealm()
            }else{
                precargarActividadLista()
                }
        }
    
    func precargarActividadListaRealm(){
        try! rdbManejador.write {
            rdbManejador.add(ActividadRecienteRealm(value: ["actividadNombre": "Proyecto", "proyectoNombre": "Proyecto 1", "propietarioNombre": "Cesar Segura", "actividadFecha": "30-06-2018", "actividadTipo": 1]))
            }
        }
    
    func precargarActividadLista(){
        actividadLista.append(ActividadRecienteModel(nombre: "Proyecto", proyecto: "Proyecto 1", propietario: "Cesar Segura", fecha: "30-06-2018", tipo: 1))
        actividadLista.append(ActividadRecienteModel(nombre: "Proyecto", proyecto: "Proyecto 1a", propietario: "Cesar Segura", fecha: "30-06-2018", tipo: 1))
        actividadLista.append(ActividadRecienteModel(nombre: "Accion de mitigacion", proyecto: "Proyecto 2", propietario: "Cesar Segura", fecha: "29-06-2018", tipo: 2))
        actividadLista.append(ActividadRecienteModel(nombre: "Vencimiento", proyecto: "Proyecto 3", propietario: "Cesar Segura", fecha: "28-06-2018", tipo: 3))
        actividadFiltrado = false
        }
    
    func aplicarFiltro(tipo: Int8){
        actividadListaFiltrada = actividadLista.filter { $0.actividadTipo == tipo}
        actividadFiltrado = true
        }
    
    func establecerFiltro(valor: Bool){ actividadFiltrado = valor}
    func obtenerFiltro() -> Bool {return actividadFiltrado}
    func obtenerManejador() -> Realm {return rdbManejador}
}//Fin de clase
