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
    @State private var drinks: [Drink] = []
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



#Preview {
    ListCocktailsView(listId: ["15346", "14029", "178318", "16108", "16943", "17005", "14560", "17222", "17223", "14107", "17224", "16134", "17225", "17226", "17227", "17228", "14272", "17229", "12560", "12562", "178321", "178325", "178353", "12564", "16311", "178319", "14584", "17074", "17066", "178337", "17180", "17267", "178320", "178317", "17254", "17268", "178336", "17242", "12572", "17251", "178331", "17825", "178311", "178310", "178356", "178329", "17174", "178369", "17830", "17250", "17196", "14133", "14608", "17177", "178334", "17181", "11005", "17182", "178346", "17246", "17212", "178309", "178344", "16485", "17213", "17248", "178352", "178328", "12758", "178340", "17255", "178342", "178314", "178366", "17230", "178365", "17252", "178316", "178345", "17239", "12706", "16987", "16178", "178359", "178335", "14366", "178360", "15224", "178358", "11008", "17256", "11720", "11728", "17188", "178370", "13936", "178343", "14842", "11000", "15841"])
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

