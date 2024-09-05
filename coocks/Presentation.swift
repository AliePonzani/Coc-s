import SwiftUI

struct Presentation: View {
    @State private var currentPage = 0
    @State private var navigateToNextView = false
    
    private let onboardingData = [
        OnboardingData(image: "img1", title: "Welcome to your cocktail guide!", description: "Discover delicious recipes and follow the steps to become a mixology master."),
        OnboardingData(image: "img2", title: "Explore recipes or search for your perfect cocktail.", description: "Each recipe includes ingredients, clear steps and preparation instructions."),
        OnboardingData(image: "img3", title: "Save your favorite recipes and create your personal recipe book", description: "Share and enjoy your unique creations")
    ]
     
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    TabView(selection: $currentPage) {
                        ForEach(0..<onboardingData.count, id: \.self) { index in
                            OnboardView(data: onboardingData[index], screenSize: geometry.size)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Use PageTabViewStyle instead
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Optional for more customization
                    
                    VStack {
                        HStack {
                            Spacer()
                            SkipButton {
                                navigateToNextView = true
                            }
                        }
                        .padding(.top, geometry.safeAreaInsets.top + 20)
                        .padding(.trailing, 20)
                        
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NextButton(action: {
                                if currentPage < onboardingData.count - 1 {
                                    currentPage += 1
                                } else {
                                    navigateToNextView = true
                                }
                            })
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.trailing, 20)
                    
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(), isActive: $navigateToNextView) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            .edgesIgnoringSafeArea(.all)  // Ignore safe area for the entire view
        }
    }
}

struct OnboardView: View {
    let data: OnboardingData
    let screenSize: CGSize
    
    var body: some View {
        ZStack {
            Image(data.image)
                .resizable()
                .scaledToFill()
                .frame(width: screenSize.width, height: screenSize.height)
                .clipped()  // Ensure image does not exceed the bounds
                .edgesIgnoringSafeArea(.all)  // Ignore safe area for the image
            
            VStack {
                Spacer()
                
                ZStack {
                    Image("vetorBranco")
                        .resizable()
                        .scaledToFit()
                    
                    VStack(spacing: 10) {
                        Text(data.title)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25, weight: .bold))
                        
                        Text(data.description)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                .frame(height: screenSize.height * 0.4)
            }
        }
    }
}

struct OnboardingData {
    let image: String
    let title: String
    let description: String
}

struct SkipButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Skip")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 80, height: 50)
                .background(Color(red: 0.5, green: 0, blue: 0.1))
                .cornerRadius(15)
        }
    }
}

struct NextButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.right.circle.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(Color(red: 0.5, green: 0, blue: 0.1))
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
        }
    }
}



struct Presentation_Previews: PreviewProvider {
    static var previews: some View {
        Presentation()
    }
}
