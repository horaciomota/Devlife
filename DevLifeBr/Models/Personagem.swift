//
//  Personagem.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import Foundation

// Modelo para representar um personagem.
struct Personagem {
    var nome: String
    var idade: Int
    var sexo: Sexo
}

// Enum para representar o sexo do personagem.
enum Sexo: String, CaseIterable, Identifiable {
    case masculino = "Masculino"
    case feminino = "Feminino"
    case outro = "Outro"

    var id: String { self.rawValue }
}
