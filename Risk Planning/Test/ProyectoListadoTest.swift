//
//  ProyectoListadoTest.swift
//  Risk Planning
//
//  Created by César Elías Segura on 31/5/18.
//  Copyright © 2018 César Elías Segura. All rights reserved.
//

import Foundation

class ProyectoListadoTest{
    var proyectoLista = [ProyectoModel]()
    
    init(){
        proyectoLista.append(ProyectoModel(nombre: "Proyecto 1", descripcion: "Proyecto especial 1", propietario: "Cesar Segura", ventaEstimada: "05-07-2018", inicioEstimado: "15-07-2018", analisisRiesgo: "03-07-2018", precioVenta: 25000, presupuestoCliente: 33000))
        }
}//Fin de clase
