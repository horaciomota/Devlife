//
//  PaginaPrincipalView.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import SwiftUI

struct PaginaPrincipalView: View {
    @StateObject private var gerenciadorDeUsuario = GerenciadorDeUsuario()
    @State private var personagemExiste = true // Declare a variável personagemExiste aqui


    var body: some View {
        VStack {
            if personagemExiste {
                Text("Bem-vindo ao DevLifeBrasil!")
                Text("Nome: \(gerenciadorDeUsuario.nome)")
                Text("Idade: \(gerenciadorDeUsuario.idade)")
            } else {
                CriacaoPersonagemView(gerenciadorDeUsuario: gerenciadorDeUsuario)
            }
        }
        .onAppear {
                   gerenciadorDeUsuario.verificarPersonagemExistente { existe in
                       personagemExiste = existe
                   }
        }
        }
}


struct PaginaPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PaginaPrincipalView()
    }
}
