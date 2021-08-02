//
//  menuView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 02/08/2021.
//

import SwiftUI

struct menuView: View {
    var body: some View {
        ZStack{
            uiBackgroundView()
            
            VStack{
                
                Text("Choose one of the below options by tapping with finger.")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                HStack{
                    Button(action: {print("Full Version")}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("REMAR_GREEN"))
                                .frame(width: 170, height: 170)
                            Text("#Full#").foregroundColor(Color.pink).fontWeight(.heavy)
                        }
                    })
                    Button(action: {print("Simple Version")}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("REMAR_GREEN"))
                                .frame(width: 170, height: 170)
                            Text("#Simple#").foregroundColor(Color.pink).fontWeight(.heavy)
                        }
                    })
                }
                .padding(.top)
                
                
                Text("For more information, click on the green button below.")
                    .multilineTextAlignment(.center)
                    .padding(.top, 70.0)
                
                Button(action: {print("More Info Button Pressed")}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("REMAR_GREEN"))
                            .frame(maxWidth: 120, maxHeight: 50)
                        Text("READ MORE")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }.padding(.top)
                })
                
                Button(action: {print("Privacy Policy Selected")}, label: {
                    Text("Privacy Policy")
                        .foregroundColor(Color("REMAR_GREEN"))
                        .fontWeight(.semibold)
                        .padding(.top)
                })
                
                Spacer()
                
            } .padding(.top, 115)
        }
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}
