//
//  PaginaPrincipalView.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import SwiftUI

struct PaginaPrincipalView: View {
    @StateObject private var gerenciadorDeUsuario = GerenciadorDeUsuario()
    @State private var personagemExiste = true


    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                if personagemExiste {
                    Text("Bem-vindo ao DevLifeBrasil!")
                        .font(.title)
                        .foregroundStyle(Color.bege)
                    Text("Nome: \(gerenciadorDeUsuario.nome)")
                        .font(.subheadline)
                        .foregroundStyle(Color.bege)
                    Text("Idade: \(gerenciadorDeUsuario.idade)")
                        .font(.subheadline)
                        .foregroundStyle(Color.bege)
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
}

extension Color {
    static let bege = Color(red: 0.96, green: 0.96, blue: 0.86)
}


struct PaginaPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PaginaPrincipalView()
    }
}
