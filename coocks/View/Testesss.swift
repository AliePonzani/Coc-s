//
//  Testesss.swift
//  coocks
//
//  Created by ALINE FERNANDA PONZANI on 04/09/24.
//

import SwiftUI

struct Testesss: View {
    @State private var drinks: [Teste] = []
    var body: some View {
        List(drinks, id: \.idDrink){drink in
            Text(drink.idDrink ?? "")
        }
        .task {
            await teste()
        }
    }
    private func teste() async {
        do {
            drinks = try await getTeste(tipo: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Southern%20Comfort")
            print(drinks)
        } catch {
            print("Erro ao TesteeeCards: \(error)")
        }
    }
}

#Preview {
    Testesss()
}
