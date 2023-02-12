//
//  SignInPage.swift
//  ToDoApp
//
//  Created by Mirzabek on 07/02/23.
//

import SwiftUI

struct SignInPage: View {
    
    /// Connections
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session : SessionStore
    @ObservedObject var viewModel = SignInViewModel()
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @State var isEmail = false
    @State var isPassword = false
    
    
    /// SignIn function
    func doSignIn(){
          if email.isValidEmail && password.isValidPassword {
              isEmail = false
              isPassword = false
              viewModel.apiSignIn(email: email, password: password, completion: { result in
                  if !result {
                      print("Check email or password")
                      return
                  }
              })
          }
          if email.isValidEmail == false{
              isEmail = true
          } else { isEmail = false}
          if password.isValidPassword == false {
              isPassword = true
          } else { isPassword = false}
      }
    var body: some View {
        
        NavigationView(){
            VStack{
                ZStack{
                    Circle().frame(width: 300,height: 300).foregroundColor(Color("Color2"))
                        .padding(.top,-300)
                    /// Title of the signIn
                    HStack(alignment: .top){
                        Text("Enter Your Existance Account")
                            .foregroundColor(Color("Color3"))
                            .font(.system(size: 30)).fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                }
                /// Login Button /  textField
                VStack{
                    Spacer()
                    /// Email TextField
                    HStack{
                        Image(systemName: "person").foregroundColor(Color("Color3"))
                        TextField("Enter your Email",text: $email)
                    }.padding()
                        .background(Color("Color2")).cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                    
                    if isEmail {
                        
                        Text("Enter your existance account!")
                            .foregroundColor(Color("Color2"))
                            .font(.system(size: 15))
                    }
                    
                    /// Password TextField
                    HStack{
                        Image(systemName: "key").foregroundColor(Color("Color3"))
                        SecureField("Enter your Password",text: $password)
                    }.padding()
                        .background(Color("Color2")).cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                    if isPassword {
                        Text("Incorrect Password")
                            .foregroundColor(Color("Color2"))
                            .font(.system(size: 13))
                                       }
                    
                    /// Sign Button
                    Button(action: {
                        doSignIn()
                    }, label: {
                        HStack{
                            Spacer()
                            Text("LOG IN").foregroundColor(Color("Color1"))
                            Spacer()
                        }
                        .padding()
                        .background(Color("Color2"))
                        .cornerRadius(20)
                    }) .background(Color("Color2")).cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                    Spacer()
                    ///Note...
                    HStack(alignment: .bottom){
                        Text("If you don't have an account back to the main page create your new accaount").font(.system(size: 13))
                            .foregroundColor(Color("Color2"))
                            .multilineTextAlignment(.center)
                    }
                }
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Color1"))
        
        }.navigationViewStyle(StackNavigationViewStyle())
        
        .navigationBarTitle("LOG IN")
        /// BackBar Button changing
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "arrow.left.circle")
                    .foregroundColor(Color("Color2"))
            }
        }))
    }
}

struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage()
    }
}


/// Extionsion of the correct email or password
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^[A-Z0-9a-z][a-zA-Z0-9_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

extension String {
    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}").evaluate(with: self)
    }
}
