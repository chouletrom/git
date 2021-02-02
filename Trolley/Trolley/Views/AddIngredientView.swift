//
//  AddIngredientView.swift
//  Trolley
//
//  Created by Romain Choulet on 24/01/2021.
//

import SwiftUI

struct AddIngredientView: View {
    /// ENVIRONMENT OBJECT
    @EnvironmentObject var appData: AppData
    
    /// PARAMETERS
    @Binding var show_itSelf: Bool
    
    /// VARIABLES
    @State var ing_name: String = ""
    @State var ing_img: UIImage?
    @State var show_imgPicker = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New Ingredient")
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                Spacer()
                TextField("Ingredient Name...", text: $ing_name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.frame(width: 300)
                Button(action: {
                    show_imgPicker.toggle()
                }) {
                    if (ing_img != nil) {
                        Image(uiImage: ing_img!.resized(to: CGSize(width: 50, height: 50)))
                            .resizable()
                            .frame(width: 50)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            
                    } else {
                        Image(systemName: "photo.on.rectangle")
                    }
                }
                Spacer()
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    show_itSelf = false
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    if (ing_img != nil && ing_name != "") {
                        appData.list_ingredients.append(
                            Ingredient(name: self.ing_name, data_img: ing_img!.pngData()!)
                        )
                        appData.saveListIngredients()
                        show_itSelf = false
                    } else if (ing_name != "") {
                        appData.list_ingredients.append(
                            Ingredient(name: self.ing_name, data_img: UIImage(named: "tomato.jpg")!.pngData()!)
                        )
                        appData.saveListIngredients()
                        appData.saveListIngredients()
                        show_itSelf = false
                    }
                    
                }) {
                    HStack {
                        //Spacer()
                        Text("Add")
                            .fontWeight(.bold)
                        //Spacer()
                    }
                    
                }
                
                Spacer()
            }
            .padding(.top)
           
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .sheet(isPresented: $show_imgPicker) {
            ImagePickerView(selectedImage: $ing_img, sourceType: .savedPhotosAlbum)
        }
        
    }
}

//struct AddRecipeView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        @State var gg = false
//        AddRecipeView(show_addRecipeView: $gg).environmentObject(AppData())
//    }
//}
