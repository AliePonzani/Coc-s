//
//  RecipeView.swift
//  coocks
//
//  Created by ALINE FERNANDA PONZANI on 29/08/24.
//

import SwiftUI

struct RecipeView: View {
    var drink: [Drink]
    var body: some View {
        ScrollView{
            ForEach(drink, id: \.idDrink){drink in
                VStack(spacing: 16.0){
                    AsyncImage(url: URL(string:drink.strDrinkThumb)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFill()
                    .frame(width: 340, height: 330)
                    .cornerRadius(/*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                    
                    Text(drink.strDrink)
                        .font(.title)
                        .foregroundColor(Color("Principal"))
                    
                    //lista de ingredientes
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .center, spacing: 20.0){
                            ForEach(drink.getIngredientes(), id: \.1) {
                                (medida, ingredient) in
                                FilterCards(name: ingredient, tipo: "i")
                            }
                        }
                        .frame(height: 130)
                        .padding(.leading, 20.0)
                    }
                    HStack(alignment: .top, spacing: 12.0) {
                        VStack {
                            Text("Glass")
                                .font(.title2)
                                .foregroundColor(Color("Principal"))
                            FilterCards(name: drink.strGlass ?? "",tipo: "g")
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()
                        .background(Color.white)
                        
                        VStack(alignment: .leading) {
                            Text("Instructions")
                                .font(.title2)
                                .foregroundColor(Color("Principal"))
                            Text(drink.strInstructions)
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()
                        .background(Color.white)
                    }
                    .padding(.horizontal, 17.0)
                }
            }
            .scrollContentBackground(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
        }
        
    }
//    private func teste() async {
//        do {
//            drink = try await getDrinkId(id: idDrink)
//        } catch {
//            print("\(idDrink) Erro na Receitas: \(error)")
//        }
//    }
}

//#Preview {
//    RecipeView(name: "Margarita", image: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg", glass: "Cocktail glass", preparo: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.", ingredientes: [("1", "Tequila"),("1", "Triple sec"),("1", "Lime juice"),("to taste", "Salt")])
//}
