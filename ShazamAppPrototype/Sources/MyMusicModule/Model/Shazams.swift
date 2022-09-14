//
//  Shazams.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 12.09.2022.
//

class Shazams {
    func getShazams() -> [ShazamSection] {
        return [
            ShazamSection(type: .list, shazams: [
                Shazam(title: "Шазамы", subTitle: String(Int.random(in: 0...300)), image: nil),
                Shazam(title: "Исполнители", subTitle: nil, image: nil)]),
            
            ShazamSection(type: .verticalCard, shazams: [
                Shazam(title: "Kool Aid and Frozen Pizza", subTitle: "Mac Miller", image: "kool.aid"),
                Shazam(title: "Silhouetter of You", subTitle: "isaac gracie", image: "isaac"),
                Shazam(title: "Брошу курить", subTitle: "HOLLYFLAME", image: "hollyflame"),
                Shazam(title: "1 сентября", subTitle: "Автошазам", image: "another.love"),
                Shazam(title: "As It Was", subTitle: "Harry Styles", image: "harry.styles"),
                Shazam(title: "As It Was", subTitle: "Harry Styles", image: "harry.styles"),
                Shazam(title: "Hollywood Swinging", subTitle: "Kool & The Gang", image: "kool.thegang"),
                Shazam(title: "Sad Guitar Beat 1", subTitle: "Nebo7_beatz", image: "sad.guitar"),
                Shazam(title: "Snowfall", subTitle: "Dmitry Volynkin & Eugene Chirkov", image: "snowfall"),
                Shazam(title: "Faint", subTitle: "LINKIN PARK", image: "linkin.park"),
                Shazam(title: "Better Things", subTitle: "Shiloh Dynasty & prod.by.Sunny", image: "better.things"),
                Shazam(title: "Дай мне огня", subTitle: "Xcho, Mr Lambo & Пабло", image: "xcho")]),
            
            ShazamSection(type: .horizontalCard, shazams: [
                Shazam(title: "Live Free", subTitle: "Mac Miller", image: "live.free"),
                Shazam(title: "Coming Back (feat, MAC MILLER)", subTitle: "Domo Genesis", image: "domo.genesis"),
                Shazam(title: "People Under the Stairs", subTitle: "Mac Miller", image: "people.under"),
                Shazam(title: "Malcom Interlude (feat. Mac Miller)", subTitle: "Thelonious Martin", image: "wunderkid"),
                Shazam(title: "Buttons", subTitle: "Mac Miller", image: "buttons")])
        ]
    }
}
