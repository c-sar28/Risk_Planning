//
//  ActividadRecienteRealm.swift
//  Risk Planning
//
//  Created by César Elías Segura on 4/6/18.
//  Copyright © 2018 César Elías Segura. All rights reserved.
//

//import Foundation
import RealmSwift

class ActividadRecienteRealm: Object{
    //Variables
    @objc dynamic var actividadId = 0
    @objc dynamic var actividadNombre = ""
    @objc dynamic var proyectoNombre = ""
    @objc dynamic var propietarioNombre = ""
    @objc dynamic var actividadFecha = ""
    @objc dynamic var actividadTipo = 0
    
    //Funciones
    override static func primaryKey() -> String? {
        return "actividadId"
    }
    
}//Fin de clase
