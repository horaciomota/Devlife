//
//  AtributoHabilidade.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 15/11/23.
//

import Foundation

let atributosMock = [
    AtributoHabilidade(name: "Velocidade", value: 8),
    AtributoHabilidade(name: "Eficiência", value: 7)
]

let habilidadesMock = [
    Habilidade(name: "Programação Swift", description: "Desenvolvimento iOS", iconUrl: nil, attributes: atributosMock, cost: 50),
    Habilidade(name: "Design de UI", description: "Criação de interfaces de usuário", iconUrl: nil, attributes: atributosMock, cost: 40)
]

let categoriaMock = CategoriaHabilidade(categoryName: "Desenvolvimento", description: "Habilidades relacionadas a programação e desenvolvimento de software", items: habilidadesMock)

let dadosHabilidadesMock = DadosHabilidades(Skills: [categoriaMock])
