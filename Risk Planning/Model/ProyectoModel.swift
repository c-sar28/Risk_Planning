//
//  ProyectoModel.swift
//  Risk Planning
//
//  Created by César Elías Segura on 31/5/18.
//  Copyright © 2018 César Elías Segura. All rights reserved.
//

import Foundation

class ProyectoModel{
    //Variables
    let proyectoNombre: String
    let proyectoDescripcion: String
    let proyectoPropietario: String
    let proyectoFechaVentaEstimada: String
    let proyectoFechaInicioEstimada: String
    let proyectoFechaAnalisisRiesgo: String
    let proyectoPrecioVenta: Decimal
    let proyectoPresupuestoCliente: Decimal
    var proyectoActivo: Bool
    var proyectoAnalisisRiesgoConcluido: Bool
    
    //Funciones
        init(nombre: String, descripcion: String, propietario: String, ventaEstimada: String, inicioEstimado: String, analisisRiesgo: String, precioVenta: Decimal, presupuestoCliente: Decimal){
            proyectoNombre = nombre
            proyectoDescripcion = descripcion
            proyectoPropietario = propietario
            proyectoFechaVentaEstimada = ventaEstimada
            proyectoFechaInicioEstimada = inicioEstimado
            proyectoFechaAnalisisRiesgo = analisisRiesgo
            proyectoPrecioVenta = precioVenta
            proyectoPresupuestoCliente = presupuestoCliente
            proyectoActivo = true
            proyectoAnalisisRiesgoConcluido = false
            }
    
    func establecerActivo(activo: Bool){proyectoActivo = activo}
    func establecerAnalisisRiesgo(concluido: Bool){proyectoAnalisisRiesgoConcluido = concluido}
    
    }//Fin de clase
