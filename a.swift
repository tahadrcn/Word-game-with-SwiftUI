//
//  a.swift
//  yazlab2.2
//
//  Created by Taha Dirican & Elif Naz Gürerman on 19.04.2023.
//

import SwiftUI
import SwiftUI

extension UIColor {
    static var rand: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}

func transferRandomElements(from sourceArray: [Harf], to destinationArray: inout [Harf], count: Int = 24) {
    // Kaynak dizideki eleman sayısını al
    let sourceCount = sourceArray.count
    
    // İstenen sayıda rastgele elemanı seç
    var indices = Set<Int>()
    while indices.count < count {
        indices.insert(Int.random(in: 0..<sourceCount))
    }
    
    // Rastgele seçilen elemanları hedef dizinin sonuna ekle
    for index in indices {
        destinationArray.append(sourceArray[index])
    }
}
func randomElementFromArray(_ array: [Harf]) -> Harf {
    let randomIndex = Int.random(in: 0..<array.count)
    return array[randomIndex]
}

struct a: View {
    @State private var isActive = false
    @State private var showAlert = false
    @State var c = false
    var harf:Harf
    @State var u = harfarray.randomElement()
    @State var timer: Timer?
    @State var count = 0
    @State var puan:Int = 0
    @State var girilenler = [String]()
    @State var ygirilenler = [String]()
    @State var txtler = [Harf]()
    @State var ab = [Harf]()
    @State var temp = [String]()
    @State var tempp = [Int]()
    @State private var searchResults = ""
    @State var r:Harf
    var color2: UIColor = .rand
    var color1: UIColor = .rand
    @ObservedObject var viewModel = Hesap(data: "",datay: -275, datay2: -275)
    
    @Environment(\.presentationMode) var presentationMode
      let columns = [
            GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),
      ]
    
   
    
      var body: some View {
          
          VStack(spacing: 0){
              VStack{
                  Text(String(puan))
                      .foregroundColor(Color.black)
                      .bold()
                      .frame(width: 75,height: 75)
                      .background(Color.white)
                      .clipShape(Circle())
                      .padding(.top)
                      .onTapGesture {
                          showAlert = true
                      }
                      .alert(isPresented: $showAlert) {
                          Alert(title: Text("Oyun Bitti!").bold(), message: Text("Puanınız:\(puan)").bold(), dismissButton: .default(Text("Tamam")){
                              self.presentationMode.wrappedValue.dismiss()
                              viewModel.datay2 = -275
                          })
                      }
                  
              }
              .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.2)
              .background(Color.gray)
              
            
              
              VStack{
                  
                  LazyVGrid(columns: columns, spacing: 20) {
                      ForEach(txtler) {  txt in
                          Text(txt.harf)
                                .foregroundColor(.black)
                                .frame(width: 35,height: 50)
                                .background(Color(uiColor: color2))
                                .bold()
                                .cornerRadius(7)
                                .offset(y:viewModel.datay2)
                                .onAppear{
                                    withAnimation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 0)){
                                        viewModel.datay2 = 0
                                    }
                                }
                                .onTapGesture {
                                    self.viewModel.data += txt.harf
                                    tempp.append(txt.po)
                                    }
                      }
                  }
                 
                  LazyVGrid(columns: columns, spacing: 20) {
                      ForEach(ab) { item in
                          Text(item.harf)
                              .foregroundColor(.black)
                              .frame(width: 35,height: 50)
                              .background(Color(uiColor: color1))
                              .bold()
                              .cornerRadius(7)
                              .offset(y:viewModel.datay)
                              .onTapGesture {
                                  self.viewModel.data += item.harf
                                  tempp.append(item.po)                              }
                              .onAppear{
                                  withAnimation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 0)) {
                                      self.viewModel.datay = 0
                                  }
                                  }
                      }
                  }
              }
              .frame(width: UIScreen.main.bounds.width,height: 525,alignment: .bottom)
              .background(Color.black)
              
              
              
              
              
              
              
              VStack(spacing: 0){
                  HStack(spacing: 0){
                      Button(action: {
                          self.viewModel.data=""
                          tempp.removeAll()
                      }) {
                          Circle()
                              .strokeBorder(Color.red, lineWidth: 1)
                              .background(Image(systemName: "xmark").foregroundColor(.white))
                              .frame(width: 50, height: 50)
                              .background(Color.red)
                              .cornerRadius(6)
                      }
                      TextField("",text: $viewModel.data)
                          .frame(width: 295,height: 50)
                          .foregroundColor(.black)
                          .background(Color.white)
                      
                      
                      Button(action: {
                          c = searchWordInFile("tdk", for: viewModel.data)
                          if(girilenler.contains(viewModel.data)==false && c == true && viewModel.data.count>=2 ){
                              for p in tempp{
                                  puan += p
                              }
                              girilenler.append(viewModel.data)
                              ygirilenler.removeAll()
                          }
                          else{
                              ygirilenler.append(viewModel.data)
                              if(ygirilenler.count==3){
                                      r = randomElementFromArray(harfarray)
                                      txtler.append(r)
                                      r = randomElementFromArray(harfarray)
                                      txtler.append(r)
                                      r = randomElementFromArray(harfarray)
                                      txtler.append(r)
                                      r = randomElementFromArray(harfarray)
                                      txtler.append(r)
                                      r = randomElementFromArray(harfarray)
                                      txtler.append(r)
                                      r = randomElementFromArray(harfarray)
                                      txtler.append(r)
                                      r = randomElementFromArray(harfarray)
                                      txtler.append(r)
                                      r = randomElementFromArray(harfarray)
                                      txtler.append(r)
                                      ygirilenler.removeAll()
                              }
                          }
                          tempp.removeAll()
                          self.viewModel.data=""
                      }) {
                          Circle()
                              .strokeBorder(Color.green, lineWidth: 1)
                              .background(Image(systemName: "checkmark").foregroundColor(.white))
                              .frame(width: 50, height: 50)
                              .background(Color.green)
                              .cornerRadius(6)
                      }
                  }
              }
              .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height*0.2,alignment: .top)
              .background(Color.gray)
          }.onAppear{
              transferRandomElements(from: harfarray, to: &ab)
              self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                             self.count += 1
                  if(puan < 100){
                      if(count%5==0){
                          r = randomElementFromArray(harfarray)
                          txtler.append(r)
                      }
                  }
                  else if(puan>100 && puan<=200){
                      if(count%4==0){
                          r = randomElementFromArray(harfarray)
                          txtler.append(r)
                      }
                  }
                  else if(puan>200 && puan<=300){
                      if(count%3==0){
                          r = randomElementFromArray(harfarray)
                          txtler.append(r)
                      }
                  }
                  else if(puan>300 && puan<=400){
                      if(count%2==0){
                          r = randomElementFromArray(harfarray)
                          txtler.append(r)
                      }
                  }
                  else{
                      if(count%1==0){
                          r = randomElementFromArray(harfarray)
                          txtler.append(r)
                      }
                  }
                  
                }
              
          }
      }
    
    func searchWordInFile(_ fileName: String, for word: String) -> Bool {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
            print("File not found.")
            return false
        }

        do {
            let fileContent = try String(contentsOf: fileURL, encoding: .utf8)
            let lines = fileContent.split(separator: "\n")
            for line in lines {
                if line.lowercased() == word.lowercased() {
                    return true
                }
            }
        } catch {
            print("Error reading file:", error.localizedDescription)
        }

        return false
    }
}

struct a_Previews: PreviewProvider {
    static var previews: some View {
        a(harf: A, ab: [], r: A)
    }
}
