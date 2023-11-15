//
//  CategoriasView.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 15/11/23.
//

import SwiftUI

struct CategoriasView: View {
    @StateObject var viewModel = HabilidadesViewModel()

    init() {
          // Configuração da aparência da barra de navegação
          UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white] // Substitua UIColor.white pela cor desejada
      }

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                List {
                    if let categorias = viewModel.dadosHabilidades?.Skills {
                        ForEach(categorias, id: \.id) { categoria in
                            VStack { // Utilizando um VStack para envolver o conteúdo
                                NavigationLink(destination: HabilidadesView(categoria: categoria)) {
                                    Text(categoria.categoryName)
                                        .font(.custom("CourierNewPSMT", size: 18))
                                        .foregroundColor(Color.black)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.vertical, 18)
                            .background(Color.bege)
                            .cornerRadius(5)
                        }
                        .listRowBackground(Color.black)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Categorias")
                .navigationBarTitleDisplayMode(.inline) // Modo de exibição do título
                .background(Color.black)
                .onAppear {
                    Task {
                        await viewModel.carregarDadosHabilidades()
                    }
                }
            }
        }
    }
}

struct CategoriasView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriasView()
    }
}
