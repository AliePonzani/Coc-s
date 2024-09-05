import SwiftUI

struct HomeView: View {
    @State private var glasses: [Categorie] = []
    @State private var categories: [Categorie] = []
    @State private var ingredient: [Categorie] = []
    var body: some View {
        ScrollView{
            VStack(spacing: 30.0){
                VStack(alignment: .leading) {
                    Text("Glasses")
                        .foregroundColor(Color("Principal"))
                        .fontWeight(.bold)
                        .font(.system(size: 24, design: .default))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(glasses, id: \.strGlass) { glassType in
                                let sanitizedCategory = glassType.strGlass?.replacingOccurrences(of: "/", with: "") ?? ""
                                FilterCards(name: glassType.strGlass ?? "", tipo: "g", image: sanitizedCategory)
                            }
                        }
                    }
                }.frame(height: 180)
                VStack(alignment: .leading) {
                    Text("Categories")
                        .foregroundColor(Color("Principal"))
                        .fontWeight(.bold)
                        .font(.system(size: 24, design: .default))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(categories, id: \.strCategory) { categorieType in
                                let sanitizedCategory = categorieType.strCategory?.replacingOccurrences(of: "/", with: "") ?? ""
                                FilterCards(name: categorieType.strCategory ?? " ", tipo: "c", image: sanitizedCategory)
                            }
                        }
                    }
                }.frame(height: 550)
                
                VStack(alignment: .leading) {
                    Text("Ingredient")
                        .foregroundColor(Color("Principal"))
                        .fontWeight(.bold)
                        .font(.system(size: 24, design: .default))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(ingredient, id: \.strIngredient1) { ingredientType in
                                FilterCards(name: ingredientType.strIngredient1 ?? "", tipo: "i", urlImage: "https://www.thecocktaildb.com/images/ingredients/\(ingredientType.strIngredient1 ?? "").png")
                            }
                        }
                    }
                }.frame(maxHeight: 180)
                    .task {
                        await loadInitialCategories()
                    }
            }.padding()
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
