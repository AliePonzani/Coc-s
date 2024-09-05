import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // Conteúdo principal
            TabView {
                NavigationStack {
                    VStack(spacing: 20) {
                        HomeView()
                    }
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                NavigationStack{
                    SearchView()
                } .tabItem {
                    Image(systemName: "wineglass.fill")
                    Text("HomeBar")
                }
                
                NavigationStack{
                    FavoritesView()
                }.tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
