//
//  openPage.swift
//  ToDoApp
//
//  Created by Mirzabek on 07/02/23.
//

import SwiftUI

struct openPage: View {
    var body: some View {
        
        NavigationView{
            /// Main VStack
            VStack{
                    /// main image
                Spacer()
                
                VStack{
                    /// Image & Circle background
                    ZStack(alignment: .topTrailing){
                        Circle().frame(width: 500,height: 400).foregroundColor(Color("Color2"))
                            .padding(.top,-300).padding(.trailing,-200)
                        
                        HStack(alignment: .top){
                            Image("main.img")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    /// Subtitle
                    VStack(spacing: 20){
                        Text("WELCOME !").font(Font.system(size: 40,design: .serif))
                            .foregroundColor(Color("Color2"))
                            .fontWeight(.bold)
                        Text("In this App you can make your daily to do list and easly observe the process")
                            .foregroundColor(Color("Color2")).fontWeight(.semibold).padding().multilineTextAlignment(.center)
                    }
                }
                    
                    /// Log in Button
                HStack(){
                    
                Spacer()
                    NavigationLink(destination: SignInPage(), label: {
                        Text("LOG IN").foregroundColor(Color("Color1"))
                    })
                        Spacer()
                    }
                    .padding()
                    .background(Color("Color2")).cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                   
                        ///SignUp Button
                    HStack(){
                    Spacer()
                        NavigationLink(destination: SignUpPage(), label: {
                            Text("SIGN UP").foregroundColor(Color("Color1"))
                        })
                            Spacer()
                        }
                        .padding()
                        .background(Color("Color2")).cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                        
                }
               
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Color1"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct openPage_Previews: PreviewProvider {
    static var previews: some View {
        openPage()
    }
}
