import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var missions = [Mission]()
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
//        18行目から27行目はコピペ
          var matches = [Mission]()
                  
              for mission in missions {
                  for member in mission.crew {
                      if member.name == astronaut.id {
                          matches.append(mission)
                      }
                  }
              }
              self.missions = matches
////        考え中
//            for mission in self.missions{
//                for member in mission.crew{
////                    print(member.name)
//                    if let match = self.missions.first(where: { _ in member.name == self.astronaut.id }){
//                        self.matches.append(match)
//                    } else {
//                        fatalError("Missing \(member)")
//                    }
//                    
//                }
//        }
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
//                    
//                    HStack{
//                        ForEach(0..<self.missions.count, id: \.self) { num in
//                            Image(""
//                            )
//                        }
//                    }
                    HStack{
                        ForEach(self.missions, id: \.id) { mission in
                            VStack{
                            Image(mission.image)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .aspectRatio(contentMode: .fill)
                            Text(mission.displayName)
                            }.padding()
                        }
                    }
////                        Grounp{
//                    for mission in self.missions{
//                                Image(mission.image)
//                            }
//                        }
////
                    
                    
                    Text(self.astronaut.description)
                        .padding()
                }
            }
        }
            .navigationBarTitle(Text(self.astronaut.name), displayMode: .inline)
    }
//    struct MissionList {
//            let role: String
//            let astronaut: Astronaut
//
//        }
}



struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")


    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
