//
//  AddRecipeView.swift
//  Trolley
//
//  Created by Romain Choulet on 23/01/2021.
//

import SwiftUI

struct AddRecipeView: View {
    /// ENVIRONMENT OBJECT
    @EnvironmentObject var appData: AppData
    
    /// PARAMETERS
    @Binding var show_addRecipeView: Bool
    
    /// VARIABLES
    @State var recipe_name: String = ""
    @State var recipe_img: UIImage?
    @State var show_imgPicker = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New recipe")
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                Spacer()
                TextField("Recipe Name...", text: $recipe_name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.frame(width: 300)
                Button(action: {
                    show_imgPicker.toggle()
                }) {
                    if (recipe_img != nil) {
                        Image(uiImage: recipe_img!.resized(to: CGSize(width: 50, height: 50)))
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
                    show_addRecipeView = false
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    if (recipe_img != nil && recipe_name != "") {
                        appData.list_recipes.append(
                            Recipe(name: self.recipe_name, data_img: recipe_img!.pngData()!, list_ingredients: [])
                        )
                        appData.saveListRecipes()
                        show_addRecipeView = false
                    } else if (recipe_name != "") {
                        appData.list_recipes.append(
                            Recipe(name: self.recipe_name, data_img: UIImage(named: "tomato.jpg")!.pngData()!, list_ingredients: [])
                        )
                        appData.saveListRecipes()
                        show_addRecipeView = false
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
            ImagePickerView(selectedImage: $recipe_img, sourceType: .savedPhotosAlbum)
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
