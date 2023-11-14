//
//  PaginaPrincipalView.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import SwiftUI

struct PaginaPrincipalView: View {
    var body: some View {
        // Verifica se o personagem foi criado.
        if UserDefaults.standard.bool(forKey: "PersonagemCriado") {
            // Conteúdo da página principal.
            Text("Bem-vindo ao DevLifeBrasil!")
        } else {
            // Redireciona para a tela de criação de personagem.
            CriacaoPersonagemView()
        }
    }
}

// Extensão para navegar condicionalmente.
extension View {
    func navigate<Content: View>(to destination: Content, when condition: Binding<Bool>) -> some View {
        NavigationView {
            self.background(
                NavigationLink(destination: destination, isActive: condition) {
                    EmptyView()
                }
            )
        }
    }
}

    struct PaginaPrincipalView_Previews: PreviewProvider {
        static var previews: some View {
            PaginaPrincipalView()
        }
    }
