//
//  CriacaoPersonagemView.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import SwiftUI

struct CriacaoPersonagemView: View {
    @ObservedObject var viewModel = CriacaoPersonagemViewModel()
    @State private var personagemCriado = false


    var body: some View {
        NavigationView {
            Form {
                // Campo para o nome do personagem.
                TextField("Nome", text: $viewModel.personagem.nome)
                // Campo para a idade do personagem.
                // Usamos um TextField com um NumberFormatter para garantir que apenas números sejam inseridos.
                TextField("Idade", value: $viewModel.personagem.idade, formatter: NumberFormatter())

                // Seleção do sexo do personagem.
                Picker("Sexo", selection: $viewModel.personagem.sexo) {
                    ForEach(Sexo.allCases) { sexo in
                        Text(sexo.rawValue).tag(sexo)
                    }
                }

                // Botão personalizado para criar personagem.
                HStack {
                    Spacer()
                    Text("Criar Personagem")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    Spacer()
                }
                .onTapGesture {
                    viewModel.criarPersonagem()
                    self.personagemCriado = true // Atualiza a flag para navegação
                }
            }
            .navigationBarTitle("Criar Personagem")
            .navigationDestination(isPresented: $personagemCriado) {
                PaginaPrincipalView()
            }
            .navigationBarTitle("Criar Personagem")
        }
    }
}



struct CriacaoPersonagemView_Previews: PreviewProvider {
    static var previews: some View {
        CriacaoPersonagemView()
    }
}
