//
//  speciesSelectionView.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 06/08/2021.
//

import SwiftUI

struct speciesSelectionView: View {
    
    //  This is used to dismiss the view to return back to the main menu as needed
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var QuestionManager: questionManager
    
    @State var UCSelected = false
    @State var CGSelected = false
    
    // If both options are false, disable next button
    func checkNextValid() {
        if CGSelected == UCSelected {QuestionManager.nextDisabled = true}
            else {QuestionManager.nextDisabled = false}
    }
    
    var body: some View {
        GeometryReader { geom in
            ZStack {
                uiBackgroundQuestionView()
                
                VStack {
                    
                    Text("**Become a citizen scientist** and help record mass mating events of commercially important Brazilian mangrove crabs.\n\nThis information will help improve Brazilian crab fisheries legislation and fishers' livelihoods.\n\nClick on one of the below species to share your observations.")
                        .font(.system(size: geom.size.width * 0.045, weight: .regular, design: .default))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack{
                        
                        Button(action: {
                            
                            print("Ucides cordatus selected")
                            QuestionManager.tmpAnswer = "Ucides cordatus"
                            UCSelected.toggle()
                            CGSelected = false
                            
                            checkNextValid() //  Checks and Updates if the 'next' button should be enabled

                        }, label: {crabSelectionButton(type: 0, selected: UCSelected)})
                        
                        Button(action: {
                            
                            print("Cardisoma guanhumi selected")
                            QuestionManager.tmpAnswer = "Cardisoma guanhumi"
                            CGSelected.toggle()
                            UCSelected = false
                            
                            checkNextValid() //  Checks and Updates if the 'next' button should be enabled
                            
                        }, label: {crabSelectionButton(type: 1, selected: CGSelected)})
                        
                    }
                    .frame(width: geom.size.width * 0.9, height: geom.size.height/3)
                    
                    
                    Spacer()
                    //Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {Text("TMP BACK BTN")})
                    //questionToolBarView()
                    
                } .padding(.top,70)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear(perform: {
            checkNextValid()
            QuestionManager.clearAnswers()
        })
    }
}

//  Custom Button View for full
struct crabSelectionButton: View {
    var type: Int
    var selected: Bool
    var body: some View {
        GeometryReader { geom in
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("REMAR_GREEN"))
                    .aspectRatio(1, contentMode: .fit)
                VStack(spacing: 10.0){
                    Text(type == 0 ? "Ucides cordatus" : "Cardisoma guanhumi")
                        .foregroundColor(Color.black)
                        .font(.system(size: geom.size.height > geom.size.width ? geom.size.width * 0.08: geom.size.height * 0.08))
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                        .lineLimit(1)
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(width: geom.size.width*0.9, height: geom.size.height*0.5)
                        Image(type == 0 ? selected ? "crabUC_selected" : "crabUC" : selected ? "crabCG_selected" : "crabCG")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: geom.size.width*0.7)
                            .padding(/*@START_MENU_TOKEN@*/.all, -3.0/*@END_MENU_TOKEN@*/)
                    }
                }
                .minimumScaleFactor(0.1)
                .frame(width: geom.size.width, height: geom.size.height * 0.9)
            }
        }
    }
}


/// MARK -- Misc

struct speciesSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        speciesSelectionView()
            .environmentObject(questionManager())
        //menuView()
    }
}
