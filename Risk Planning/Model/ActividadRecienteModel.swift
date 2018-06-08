//
//  ActividadRecienteModel.swift
//  Risk Planning
//
//  Created by César Elías Segura on 30/5/18.
//  Copyright © 2018 César Elías Segura. All rights reserved.
//

import Foundation

class ActividadRecienteModel{
    //Variables
    let actividadNombre: String
    let proyectoNombre: String
    let propietarioNombre: String
    let actividadFecha: String
    let actividadTipo: Int8 //1 = proyecto, 2 = accion de mitigacion, 3 = tiempo por vencer

    //Funciones
    init(nombre: String, proyecto: String, propietario: String, fecha: String, tipo: Int8){
        actividadNombre = nombre
        proyectoNombre = proyecto
        propietarioNombre = propietario
        actividadFecha = fecha
        actividadTipo = tipo
        }
}//Fin de clase
