import SwiftUI

struct FavoritesCard: View {
    let idDrink: String
    @State private var drink: [Drink] = []
    @ObservedObject var favoritesManager: FavoritesManager
    @State private var isLiked = false
    
    var body: some View {
        NavigationLink(destination: RecipeView(
            idDrink: idDrink)){
                ForEach(drink, id: \.idDrink){ drink in
                    VStack {
                        ZStack(alignment: .topTrailing) {
                            AsyncImage(url: URL(string: drink.strDrinkThumb)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .clipped()
                            } placeholder: {
                                ProgressView() // Exibe um indicador de carregamento enquanto a imagem está sendo carregada
                                    .frame(width: 150, height: 150, alignment: .center)
                            }
                            
                            Button {
                                if isLiked {
                                    favoritesManager.removeFavorite(drinkID: idDrink)
                                } else {
                                    favoritesManager.addFavorite(drinkID: idDrink)
                                }
                                isLiked.toggle()
                            } label: {
                                Image(systemName: "heart.fill")
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .foregroundColor(isLiked ? Color(red: 0.5, green: 0, blue: 0.1) : .gray)
                                    .background(.ultraThinMaterial)
                                    .background(.gray)
                                    .cornerRadius(50)
                                    .padding(10)
                            }
                        }
                        
                        Text(drink.strDrink)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 150, height: 200)
                    .background(Color("Principal"))
                    .cornerRadius(20.0)
                    .onAppear {
                        Task {
                            do {
                                isLiked = favoritesManager.favorites.contains(idDrink)
                            } catch {
                                print("Erro ao carregar drink: \(error)")
                            }
                        }
                    }
                }
                
            }.task {
                await teste()
            }
    }
    private func teste() async {
        do {
            drink = try await getDrinkId(id: idDrink)
            print("entrou na favoritos")
        } catch {
            print("\(idDrink) Erro na favoritoscard: \(error)")
        }
    }
}



//
//#Preview {
//    Drinks()
//}
