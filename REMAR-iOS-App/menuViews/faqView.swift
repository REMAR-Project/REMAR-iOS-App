//
//  faqView.swift
//  REMAR-iOS-App
//
//  This view generates a list of disclosure groups for each 'faqItem' in the FAQ array.
//
//
//  Created by Lewis Watson on 06/08/2021.
//

import SwiftUI

//  Struct for faq item
struct faqItem: Codable, Hashable {
    var title: String
    var content: String
}

//  Function to decode FAQs from JSON file
func parseFAQs() -> [faqItem] {
    let url = Bundle.main.url(forResource: "about_us", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    let faqs = try? decoder.decode([faqItem].self, from: data)
    return faqs!
}

struct faqView: View {
    
    //  Parse FAQs from JSON file
    let faqs = parseFAQs()
    
    //  This is used to dismiss the view to return back to the main menu as needed
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geom in
            ZStack{
                //  Draw Background View
                uiBackgroundView()
                
                VStack{
                    
                    //  List all FAQs from faq list
                    List(faqs, id: \.self) { faq in
                        VStack{
                            DisclosureGroup(faq.title, content: {
                                Text(.init(faq.content))
                            }).accentColor(Color("REMAR_GREEN"))
                        }
                    }
                    
                    //  Spacer to push back button to bottom of screen
                    Spacer()
                    
                    //  Go back button - Uses geometry reader to scale dynamically with screen size.
                    Button(action: {
                        print("Read More Button Pressed")
                        self.presentationMode.wrappedValue.dismiss()  //  
                    }, label: {
                        GeometryReader { g in
                            Text(NSLocalizedString("goBack", comment: ""))
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color("REMAR_GREEN"))
                                        .frame(width: g.size.width, height: 50)
                                )
                                .padding(.top)
                                .position(x: g.size.width / 2, y: g.size.height / 2)
                        } .frame(width: geom.size.width/2, height: geom.size.height/10)
                    })
                    
                } .padding(.top, geom.size.height/15)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct faqView_Previews: PreviewProvider {
    static var previews: some View {
        faqView()
            //.environment(\.locale, .init(identifier: "pt-BR"))
    }
}
