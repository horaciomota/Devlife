//
//  HabilidadesView.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 15/11/23.
//

import SwiftUI

struct HabilidadesView: View {
    @StateObject var viewModel = HabilidadesViewModel()

    var body: some View {
        List {
            if let habilidades = viewModel.dadosHabilidades?.Skills {
                ForEach(habilidades, id: \.id) { categoria in
                    Section(header: Text(categoria.categoryName)) {
                        ForEach(categoria.items, id: \.id) { habilidade in
                            HStack {
                                if let iconUrl = habilidade.iconUrl, let url = URL(string: iconUrl) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing, 20)
                                } else {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding(.trailing, 20)
                                }
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(habilidade.name)
                                        .font(.headline)
                                        .foregroundStyle(.blue)
                                    Text(habilidade.description)
                                        .font(.subheadline)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Habilidades")
        .onAppear {
            Task {
                await viewModel.carregarDadosHabilidades()
            }
        }
    }
}



#Preview {
    HabilidadesView()
}
