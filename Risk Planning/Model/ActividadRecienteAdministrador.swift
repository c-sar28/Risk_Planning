//
//  ActividadRecienteAdministrador.swift
//  Risk Planning
//
//  Created by Cesar Segura Monge on 7/6/18.
//  Copyright © 2018 César Elías Segura. All rights reserved.
//

import Foundation
import RealmSwift

class ActividadRecienteAdministrador{
    //Constantes
    let rdbManejador = try! Realm()
    //Variables
    var actividadLista = [ActividadRecienteModel]()
    var actividadListaFiltrada = [ActividadRecienteModel]()
    var actividadFiltrado: Bool = false
    var actividadListaRealm = [ActividadRecienteRealm]()
    var actividadListaFiltradaRealm = [ActividadRecienteRealm]()
    
    //Funciones
    init(realm: Bool){
        if realm{
            cargarActividadListaRealm()
        }else{
            precargarActividadLista()
            }
        }
    
    func cargarActividadListaRealm(){
        let objects = rdbManejador.objects(ActividadRecienteRealm.self)
        for element in objects {
            if let actividad = element as? ActividadRecienteRealm {
                actividadListaRealm.append(actividad)
                }
            }
        }
    
    func precargarActividadListaRealm(){
        try! rdbManejador.write {
            rdbManejador.add(ActividadRecienteRealm(value: ["actividadId": 0,"actividadNombre": "Proyecto", "proyectoNombre": "Proyecto 1", "propietarioNombre": "Cesar Segura", "actividadFecha": "30-06-2018", "actividadTipo": 1]))
            rdbManejador.add(ActividadRecienteRealm(value: ["actividadId": 1,"actividadNombre": "Proyecto", "proyectoNombre": "Proyecto 1a", "propietarioNombre": "Fred Musk", "actividadFecha": "30-06-2018", "actividadTipo": 1]))
            rdbManejador.add(ActividadRecienteRealm(value: ["actividadId": 2,"actividadNombre": "Proyecto", "proyectoNombre": "Proyecto 2", "propietarioNombre": "Cesar Segura", "actividadFecha": "29-06-2018", "actividadTipo": 2]))
            rdbManejador.add(ActividadRecienteRealm(value: ["actividadId": 3,"actividadNombre": "Proyecto", "proyectoNombre": "Proyecto 3", "propietarioNombre": "Cesar Segura", "actividadFecha": "28-06-2018", "actividadTipo": 3]))
            cargarActividadListaRealm()
            }
            //}
        }
    
    func liberarActividadListaRealm(){
        try! rdbManejador.write {
            rdbManejador.delete(rdbManejador.objects(ActividadRecienteRealm.self))
            actividadListaRealm.removeAll()
            }
        }
    
    func precargarActividadLista(){
        actividadLista.append(ActividadRecienteModel(nombre: "Proyecto", proyecto: "Proyecto 1", propietario: "Cesar Segura", fecha: "30-06-2018", tipo: 1))
        actividadLista.append(ActividadRecienteModel(nombre: "Proyecto", proyecto: "Proyecto 1a", propietario: "Cesar Segura", fecha: "30-06-2018", tipo: 1))
        actividadLista.append(ActividadRecienteModel(nombre: "Accion de mitigacion", proyecto: "Proyecto 2", propietario: "Cesar Segura", fecha: "29-06-2018", tipo: 2))
        actividadLista.append(ActividadRecienteModel(nombre: "Vencimiento", proyecto: "Proyecto 3", propietario: "Cesar Segura", fecha: "28-06-2018", tipo: 3))
        actividadFiltrado = false
        }
    
    func liberarActividadLista(){
        actividadLista.removeAll()
        }
    
    func aplicarFiltro(tipo: Int8){
        actividadListaFiltrada = actividadLista.filter { $0.actividadTipo == tipo}
        actividadFiltrado = true
    }
    
    func aplicarFiltroRealm(tipo: Int8){
        actividadListaFiltradaRealm = actividadListaRealm.filter { $0.actividadTipo == tipo}
        actividadFiltrado = true
    }
    
    func establecerFiltro(valor: Bool){ actividadFiltrado = valor}
    func obtenerFiltro() -> Bool {return actividadFiltrado}
    func obtenerManejador() -> Realm {return rdbManejador}
}//Fin de clase
