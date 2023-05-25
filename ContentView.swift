//
//  ContentView.swift
//  yazlab2.2
//
//  Created by Taha Dirican & Elif Naz Gürerman on 28.03.2023.
//

import SwiftUI


struct ContentView: View{
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("          Yazlab 2.2 \nOyuna Hoşgeldiniz")
                    .foregroundColor(.yellow)
                    .bold()
                    .font(.title)
                    .frame(width: 280,height: 350,alignment: .center)
                    .background(Color.pink)
                    .clipShape(Circle())
                    .offset(y:-100)
                
                NavigationLink(destination: a(harf: A, r: A)) {
                                   Text("Başla")
                               }
                .font(Font.title2)
                .foregroundColor(Color.yellow)
                .frame(width: 100,height: 50)
                .background(Color.pink)
                .cornerRadius(20)
                
                
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            .background(Color.black)
            
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    
    
}
