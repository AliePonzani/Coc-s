//
//  FilterCards.swift
//  coocks
//
//  Created by ALINE FERNANDA PONZANI on 03/09/24.
//

import SwiftUI

struct FilterCards: View {
    var name: String
    var tipo: String
    var urlImage: String?
    var image: String?
    @State private var drinks: [Teste] = []
    
    var body: some View {
        NavigationLink(
            destination: ListCocktailsView2(listDrinks: drinks)
        ) {
            VStack {
                if let urlImage = urlImage, let _ = URL(string: urlImage) {
                    AsyncImage(url: URL(string: urlImage)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        //                            .frame(maxHeight: .infinity)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 150, height: 150, alignment: .center)
                    }
                }else if let image = image {
                    Image(image)
                        .resizable()
                        .scaledToFit()
//                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                }
                Text(name)
                    .foregroundColor(Color("Principal"))
                    .font(.system(size: 16, design: .default))
                    .fontWeight(.regular)
            }
            .scaledToFill()
        }.task {
            await teste()
        }
        .frame(maxHeight: .infinity)
    }
    private func teste() async {
        do {
            drinks = try await getTeste(tipo: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?\(tipo)=\(name)".replacingOccurrences(of: " ", with: "%20"))
        } catch {
            print("Erro no FilterCards: \(error)")
        }
    }
    
}


//struct FilterCards_Previews: PreviewProvider {
//    static var previews: some View {
//        //    urlImage:"https://www.thecocktaildb.com/images/ingredients/gin-Small.png"
//        //    image: "Soft Drink"
//        FilterCards(name: "Testeeeeeeeeee",tipo: "i", urlImage:"https://www.thecocktaildb.com/images/ingredients/gin-Small.png")
//    }
//}
