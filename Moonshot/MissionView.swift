import SwiftUI

struct MissionView: View {
    let mission: Mission
    let astronauts: [CrewMember]
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission

        var matches = [CrewMember]()


        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                //e.g. アポロ1号のcrewをループ(一人一人をmemberに代入)
                //crew(member)はnameとroleを所持しており、member.nameでgrissomを取得
                //astronautsには全てのastronautsのデータが入っていて、その中でgrissomというidを持った最初のastronautをmatchに代入
                //データが揃ったので、CrewMember型でmatchesに代入
                //そのmatchesをastronauts:[CrewMember](astronauts:[Astronaut]と区別)に入れて
                //そのastronauts:[CrewMember]をこのファイルでは主に処理に使っている
                
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }

        self.astronauts = matches
    }
    
    var body: some View {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack {
                        Image(self.mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.7)
                            .padding(.top)
                        
                        Text(self.mission.formattedLaunchDate).padding(.top)
                        
                        

                        Text(self.mission.description)
                            .padding()
                        
                        
                        ForEach(self.astronauts, id: \.role) {
                            //matchesを代入したastronautsをloopしてる
                            //ひとつひとつはCrew Member構造体の形をしている
                            //CrewMemberの下にはroleとastronautがあり、astronaut以下にAstronaut.swiftで定義したastronaut構造体がある
                            // crewmember.role　と crewmember.astronaut.idの違いはここ！
                            
                            crewMember in
                            
                            NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, missions: self.missions)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))

                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()
                            }
                            .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }

                        Spacer(minLength: 25)
                    }
                }
            }
            .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
        }
    struct CrewMember {
        let role: String
        let astronaut: Astronaut

//        let id: Int
    }
    }


struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
    }
}
