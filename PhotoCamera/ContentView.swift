//
//  ContentView.swift
//  PhotoCamera
//
//  Created by Qiubei Li on 2/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("Image Captioning Generator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height:100)
                Image(uiImage: image ?? UIImage(named: "image")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    
                Spacer()
                    .frame(height:100)
                
                HStack{
                    Button("Choose Picture") {
                        self.showSheet = true
                    }.padding()
                        .actionSheet(isPresented: $showSheet) {
                            ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                                .default(Text("Photo Library")) {
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                },
                                .default(Text("Camera")) {
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                },
                                .cancel()
                            ])
                        }
                    .border(/*@START_MENU_TOKEN@*/Color("Color")/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("Color")/*@END_MENU_TOKEN@*/)
                    
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Generate Captions")
                    }
                    .padding()
                    .border(Color("Color"), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("Color")/*@END_MENU_TOKEN@*/)
                }
            }
            
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
