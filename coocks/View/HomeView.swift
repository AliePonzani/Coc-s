import SwiftUI

struct HomeView: View {
    @State private var glasses: [Categorie] = []
    @State private var categories: [Categorie] = []
    @State private var ingredient: [Categorie] = []
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("Glasses")
                    .foregroundColor(Color("Principal"))
                    .fontWeight(.bold)
                    .font(.system(size: 24, design: .default))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(glasses, id: \.strGlass) { glassType in
                            FilterCards(name: glassType.strGlass ?? "", tipo: "g")
                        }
                    }
                }
            }.frame(height: 180)
             .padding()
            
            VStack(alignment: .leading) {
                Text("Categories")
                    .foregroundColor(Color("Principal"))
                    .fontWeight(.bold)
                    .font(.system(size: 24, design: .default))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(categories, id: \.strCategory) { categorieType in
                            FilterCards(name: categorieType.strCategory ?? "", tipo: "c")
                        }
                    }
                }
            }.frame(height: 550)
             .padding()
            
            VStack(alignment: .leading) {
                Text("Ingredient")
                    .foregroundColor(Color("Principal"))
                    .fontWeight(.bold)
                    .font(.system(size: 24, design: .default))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(ingredient, id: \.strIngredient1) { ingredientType in
                            FilterCards(name: ingredientType.strIngredient1 ?? "", tipo: "i")
                        }
                    }
                }
            }.frame(maxHeight: 180)
                .task {
                    await loadInitialCategories()
            }
        }
    }
    private func loadInitialCategories() async {
        do {
            glasses = try await getCategorie(tipo: "g")
            categories = try await getCategorie(tipo: "c")
            ingredient = try await getCategorie(tipo: "i")
        } catch {
            print("Erro ao carregar dados: \(error)")
        }
    }
}

#Preview {
    HomeView()
}
