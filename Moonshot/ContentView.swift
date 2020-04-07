import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var showingDate = true
    //       この関数コピペ
    func getAstronaut(name: String) -> String {
        //代入されたnameと同じ文字列を持ったidの初めのastroraut、のnameを返す
        return self.astronauts.first(where: { $0.id == name })?.name ?? "Failure"
    }
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        //                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44).scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                        //                        Text(self.showingDate ? mission.formattedLaunchDate : "")
                        if self.showingDate{
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.formattedLaunchDate)
                        }
                        else {
                            Text(mission.displayName)
                                .font(.headline)
                            //     コピペ
                            ForEach(0..<mission.crew.count) { index in
                                //そのミッションに参加している人数でloop
                                //crewの中のindex番目の名前
                                //getAstronaut関数に代入
                                
                                Text(self.getAstronaut(name: mission.crew[index].name))
                            }
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                
                Button(action: {
                    self.showingDate.toggle()
                    
                }) {
                    Group{
                        if self.showingDate{
                            Text("Show members")
                        } else {
                            Text("Show launch dates")
                        }
                    }
                    
                }
            )
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
