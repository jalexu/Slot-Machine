//
//  ContentView.swift
//  Slot Machine
//
//  Created by Jaime Uribe on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var highscore: Int = 0
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var showingInfoView: Bool = false
    @State private var reels: Array = [0, 1, 2]
    @State private var isActiveBet10: Bool = true
    @State private var isActiveBet20: Bool = false
    
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    
    
    //MARK: - FUNCTIONS
    func spinReels(){
//        reels[0] = Int.random(in: 0...symbols.count - 1)
//        reels[1] = Int.random(in: 0...symbols.count - 1)
//        reels[2] = Int.random(in: 0...symbols.count - 1)
        reels = reels.map({_ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    
    func checkWinning(){
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2]{
            // PLAYER WINS
            playerWins()
            
            // NEW HIGHSCORE
            if coins > highscore{
                newHighscore()
            }
           
        }else{
            // PLAYER LOSES
            playerLoses()
        }
        
    }
    
    func playerWins(){
        coins += betAmount * 10
    }
    
    func newHighscore(){
        highscore = coins
    }
    
    func playerLoses(){
        coins -= betAmount
    }
    
    func activateBet20(){
        betAmount = 20
        isActiveBet20 = true
        isActiveBet10 = false
    }
    
    func activateBet10(){
        betAmount = 10
        isActiveBet10 = true
        isActiveBet20 = false
    }
    
    
    //MARK: - BODY
    var body: some View {
        
        ZStack {
            //MARK: - BACKGROUND
            //El linearGradient permite mezclar los colores
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            //MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                
                //MARK: - HEADER
                LogoView()
                
                Spacer()
                
                //MARK: - SCORE
                HStack {
                    HStack{
                        Text("Your\nCoint".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(SocoreNumberModifier())
                    }
                    .modifier(ScoreConteinerModifier())
                    
                    Spacer()
                    
                    HStack{
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(SocoreNumberModifier())
                        Text("Your\nCoint".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                        
                    }
                    .modifier(ScoreConteinerModifier())
                }
                
                //MARK: - SLOT MACHINE
                
                VStack(alignment: .center, spacing: 0, content: {
                    //MARK: - REEL #1
                    ZStack{
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0, content: {
                        //MARK: - REEL #2
                        ZStack{
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        
                        //MARK: - REEL #3
                        ZStack{
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    })
                    
                    
                    
                    //MARK: - REEL # SPIN BUTTON
                    Button(action:  {
                        // SPIN THE REELS
                        self.spinReels()
                        
                        // CHECK THE WINNING
                        self.checkWinning()
                    }, label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    })
                
                })// Slot Machine(
                .layoutPriority(2)
                //MARK: - FOOTER
                
                Spacer()
                
                HStack(alignment: .center, spacing: 5){
                    
                    HStack {
                        
                        //MARK: - BET 20
                        Button(action: {
                            self.activateBet20()
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? Color("ColorYellow") : Color.white)
                                .modifier(BetNumberModifier())
                            
                        })
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet20 ? 1 : 0)
                            .modifier(CasinoChipsMofifier())
                        
                        
                        //MARK: - BET 10
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet10 ? 1 : 0)
                            .modifier(CasinoChipsMofifier())
                        
                        Button(action: {
                            self.activateBet10()
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? Color("ColorYellow") : Color.white)
                                .modifier(BetNumberModifier())
                            
                        })
                        .modifier(BetCapsuleModifier())
                        
                    }
                }
            }
            //MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action: {
                    print("Reset image")
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModifier()), alignment: .topLeading
            
            )
            .overlay(
                // INFO
                Button(action: {
                    self.showingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModifier()), alignment: .topTrailing
            
            )
            .padding()
            .frame(maxWidth: 720)
            
            //MARK: -POPUP
        }// ZSTACK
        .sheet(isPresented: $showingInfoView, content: {
            InfoView()
        })
    }
}


//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
