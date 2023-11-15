//
//  HabilidadesView.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 15/11/23.
//

import SwiftUI

struct HabilidadesView: View {
    var categoria: CategoriaHabilidade

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            List {
                ForEach(categoria.items, id: \.id) { habilidade in
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.bege)
                            .frame(height: 80)
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
                                    .foregroundColor(.black)
                                    .frame(minWidth: 100, alignment: .leading)
                                Text(habilidade.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 100, alignment: .leading)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 10)

                        }
                        .padding(.horizontal) // Espaçamento lateral
                    }
                    .padding(.vertical, 5) // Espaçamento vertical
                    .listRowInsets(EdgeInsets())
                    .background(Color.black) // Fundo preto entre as células
                }
            }
            .padding(.horizontal, 20)
            .listStyle(PlainListStyle())
            .navigationTitle(categoria.categoryName)
        }
    }
}


#Preview {
    HabilidadesView(categoria: categoriaMock)
}
