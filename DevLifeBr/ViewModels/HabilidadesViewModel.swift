//
//  HabilidadesViewModel.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 15/11/23.
//

import Foundation
import FirebaseStorage

enum HabilidadesError: Error {
    case downloadError(Error)
    case decodingError(Error)
}

class HabilidadesViewModel: ObservableObject {
    @Published var dadosHabilidades: DadosHabilidades?
    @Published var erro: String?
    private let storage = Storage.storage()

    func carregarDadosHabilidades() async {
        do {
            let data = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Data, Error>) in
                let pathReference = self.storage.reference(withPath: "SkillsEvents.json")
                pathReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if let error = error {
                        continuation.resume(throwing: HabilidadesError.downloadError(error))
                    } else if let data = data {
                        continuation.resume(returning: data)
                    } else {
                        continuation.resume(throwing: HabilidadesError.downloadError(NSError(domain: "DataError", code: -1, userInfo: nil)))
                    }
                }
            }

            let habilidades = try JSONDecoder().decode(DadosHabilidades.self, from: data)
            DispatchQueue.main.async {
                self.dadosHabilidades = habilidades
                self.erro = nil
            }
        } catch {
            DispatchQueue.main.async {
                self.erro = error.localizedDescription
            }
        }
    }
}





