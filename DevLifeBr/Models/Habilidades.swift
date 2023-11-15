//
//  Habilidade.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import Foundation

// Modelo para cada habilidade individual
struct Habilidade: Identifiable, Codable {
    var id: String { name }
    var name: String
    var description: String
    var iconUrl: String?
    var attributes: [AtributoHabilidade]
    var cost: Int
}

// Modelo para os atributos de cada habilidade
struct AtributoHabilidade: Codable {
    var name: String
    var value: Int
}

// Modelo para cada categoria de habilidades
struct CategoriaHabilidade: Identifiable, Codable {
    var id: String { categoryName }
    var categoryName: String
    var description: String
    var items: [Habilidade]
}

// Modelo para o contêiner de todas as categorias de habilidades
struct DadosHabilidades: Codable {
    var Skills: [CategoriaHabilidade]
}
