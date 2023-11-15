//
//  CriacaoPersonagemViewModel.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import Foundation
import Firebase

// ViewModel para a tela de criação de personagem.
class CriacaoPersonagemViewModel: ObservableObject {
    @Published var personagem = Personagem(nome: "@username", idade: 18, sexo: .outro)
    var onPersonagemCriado: (() -> Void)? // Callback

    private var db = Firestore.firestore()

    // Função para criar um novo personagem.
    func criarPersonagem() {
        let personagemId = UUID().uuidString
        db.collection("Personagens").document(personagemId).setData([
            "nome": personagem.nome,
            "idade": personagem.idade,
            "sexo": personagem.sexo.rawValue
        ]) { err in
            if let err = err {
                print("Erro ao adicionar o personagem: \(err)")
            } else {
                print("Personagem adicionado com ID: \(personagemId)")
                UserDefaults.standard.set(true, forKey: "PersonagemCriado")
                UserDefaults.standard.set(personagemId, forKey: "PersonagemId")
                self.onPersonagemCriado?() // Chama o callback
            }
        }
    }
}

