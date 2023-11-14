//
//  GerenciadorDeUsuario.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import Foundation
import FirebaseFirestore

class GerenciadorDeUsuario: ObservableObject {
    private let chaveNome = "NomeDoUsuario"
    private let chaveIdade = "IdadeDoUsuario"

    @Published var nome: String {
        didSet {
            UserDefaults.standard.set(nome, forKey: chaveNome)
        }
    }

    @Published var idade: Int {
        didSet {
            UserDefaults.standard.set(idade, forKey: chaveIdade)
        }
    }

    init() {
        nome = UserDefaults.standard.string(forKey: chaveNome) ?? "Usuário"
        idade = UserDefaults.standard.integer(forKey: chaveIdade)
    }

    func salvarUsuario(nome: String, idade: Int) {
        print("Salvando usuário - Nome: \(nome), Idade: \(idade)")
        self.nome = nome
        self.idade = idade
    }

    func verificarPersonagemExistente(completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()

        // Garantir que temos um ID de personagem válido
        guard let personagemId = UserDefaults.standard.string(forKey: "PersonagemId"), !personagemId.isEmpty else {
            print("ID do personagem não encontrado ou vazio")
            self.limparDadosLocais()
            completion(false)
            return
        }

        db.collection("Personagens").document(personagemId).getDocument { (document, error) in
            if let document = document, document.exists {
                print("Personagem existe no Firestore")
                completion(true)
            } else {
                print("Personagem não encontrado no Firestore")
                self.limparDadosLocais()
                completion(false)
            }
        }
    }

    private func limparDadosLocais() {
        UserDefaults.standard.removeObject(forKey: "NomeDoUsuario")
        UserDefaults.standard.removeObject(forKey: "IdadeDoUsuario")
        UserDefaults.standard.removeObject(forKey: "PersonagemId")
        UserDefaults.standard.removeObject(forKey: "PersonagemCriado")
    }
}


