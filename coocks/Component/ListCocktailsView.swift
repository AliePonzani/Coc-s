//
//  ListCocktailsView.swift
//  coocks
//
//  Created by ALINE FERNANDA PONZANI on 02/09/24.
//

import SwiftUI

struct ListCocktailsView: View {
    @StateObject private var favoritesManager = FavoritesManager()
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    
    //recebe
    let listId: [String]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 8) {
                ForEach(listId, id: \.self) { idDrink in
                    DrinkCard(favoritesManager: favoritesManager, idDrink: idDrink)
                }
            }
            .padding()
        }
    }
}

//struct ListCocktailsView2: View {
//    let listDrinks: [Teste]
//    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
//    @StateObject private var favoritesManager = FavoritesManager()
//        
//    var body: some View {
//        ScrollView{
//            LazyVGrid(columns: adaptiveColumn, spacing: 8) {
//                ForEach(listDrinks, id: \.idDrink){drink in
//                    NavigationLink(
//                        destination: FavoritesView()){
//                            DrinkCard(imagem: drink.strDrinkThumb ?? "", texto: drink.strDrink ?? "", idDrink: drink.idDrink ?? "", favoritesManager: favoritesManager)
//                        }
//                }
//            }
//            .padding()
//        }
//    }
//}

