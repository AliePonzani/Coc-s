import SwiftUI

struct DrinkCard: View {
    @State private var drinkInfo: [Drink] = []
    @ObservedObject var favoritesManager: FavoritesManager
    @State private var isLiked = false
    //recebe
    let idDrink: String
    
    var body: some View {
        VStack{
            NavigationLink(destination: RecipeView(drink: drinkInfo)){
                ForEach(drinkInfo, id: \.idDrink){drink in
                    VStack(spacing: 0.0) {
                        ZStack(alignment: .topTrailing) {
                            AsyncImage(url: URL(string: drink.strDrinkThumb)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaledToFill()
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
                                    .padding()
                            }
                        }
                        
                        Text(drink.strDrink)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .frame(width: 150, height: 200)
                    .background(Color("Principal"))
                    .cornerRadius(20.0)
                }
            }
        }.task {
            do {
                print("drink info é")
                print(idDrink)
                isLiked = favoritesManager.favorites.contains(idDrink)
                drinkInfo = try await getDrinkId(id: idDrink)
            } catch {
                print("Erro ao carregar drink: \(error)")
            }
        }
    }
}


//
#Preview {
    DrinkCard(favoritesManager: FavoritesManager(), idDrink: "15346")
}
