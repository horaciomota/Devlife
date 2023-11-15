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
    var gerenciadorDeUsuario: GerenciadorDeUsuario

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack {
                    TextField("Nome", text: $viewModel.personagem.nome)
                        .foregroundColor(Color.bege)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.bege, lineWidth: 1)
                        )
                        .padding(.bottom, 5)


                    TextField("Idade", value: $viewModel.personagem.idade, formatter: NumberFormatter())
                        .foregroundColor(Color.bege)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.bege, lineWidth: 1)
                        )
                        .padding(.bottom, 5)

                    Picker("Sexo", selection: $viewModel.personagem.sexo) {
                        ForEach(Sexo.allCases) { sexo in
                            Text(sexo.rawValue).tag(sexo)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding()

                    Button(action: {
                        viewModel.criarPersonagem()
                        viewModel.onPersonagemCriado = {
                            self.personagemCriado = true
                            gerenciadorDeUsuario.salvarUsuario(nome: viewModel.personagem.nome, idade: viewModel.personagem.idade)
                        }
                    }) {
                        Text("Criar Personagem")
                            .foregroundColor(.black)
                             .padding()
                             .frame(maxWidth: .infinity)
                             .background(Color.yellow)
                             .cornerRadius(10)
                    }
                    .padding()
                }
                .padding()
            }
            .navigationBarTitle("Criar Personagem", displayMode: .inline)
            .navigationDestination(isPresented: $personagemCriado) {
                PaginaPrincipalView()
            }
        }
        .accentColor(.blue) // Isso define a cor de acento para elementos de navegação e seleção
    }
}




struct CriacaoPersonagemView_Previews: PreviewProvider {
    static var previews: some View {
        CriacaoPersonagemView(gerenciadorDeUsuario: GerenciadorDeUsuario())
    }
}
