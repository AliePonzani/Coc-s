//
//  ListCocktailsView.swift
//  coocks
//
//  Created by ALINE FERNANDA PONZANI on 02/09/24.
//

import SwiftUI

struct ListCocktailsView: View {
    let listDrinks: [Drink]
    @StateObject private var favoritesManager = FavoritesManager()
        
    var body: some View {
        ForEach(listDrinks, id: \.strDrink) { drink in
            DrinkCard(imagem: drink.strDrinkThumb ?? "", texto: drink.strDrink ?? "", idDrink: drink.idDrink ?? "", favoritesManager: favoritesManager)
        }
    }
}

struct ListCocktailsView2: View {
    let listDrinks: [Teste]
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    @StateObject private var favoritesManager = FavoritesManager()
        
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 8) {
                ForEach(listDrinks, id: \.idDrink){drink in
                    NavigationLink(
                        destination: FavoritesView()){
                            DrinkCard(imagem: drink.strDrinkThumb ?? "", texto: drink.strDrink ?? "", idDrink: drink.idDrink ?? "", favoritesManager: favoritesManager)
                        }
                }
            }
            .padding()
        }
    }
}

