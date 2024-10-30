//
//  Song.swift
//  Songs
//
//  Created by Isidro Treviño on 09/10/24.
//

import Foundation
import SwiftData

@Model
class Song: Identifiable {
    var name: String
    var songLength: String
    var genre: String
    var plays: String
    var isFavorite: Bool
    var isFeatured: Bool
    var album: String
    var band: String
    var desc: String
    var bandImageName: String
    var albumImageName: String
    var url: URL?
    
    init(name: String, songLength: String, genre: String, plays: String, isFavorite: Bool = false,
             isFeatured: Bool = false, album: String, band: String, description: String,
             bandImageName: String, albumImageName: String, url: URL?) {
            self.name = name
            self.songLength = songLength
            self.genre = genre
            self.plays = plays
            self.isFavorite = isFavorite
            self.isFeatured = isFeatured
            self.album = album
            self.band = band
            self.desc = description
            self.bandImageName = bandImageName
            self.albumImageName = albumImageName
            self.url = url
        }
        
    static let sampleData: [Song] = [
        Song(name: "Creep", songLength: "3:58", genre: "Alternative rock", plays: "1,795,692,370",
             isFavorite: true, isFeatured: true, album: "Pablo Honey", band: "Radiohead",
             description: "Un himno melancólico sobre la alienación y el sentimiento de no encajar, 'Creep' es una de las canciones más icónicas de Radiohead, fusionando guitarras distorsionadas con la voz desesperada de Thom Yorke.",
             bandImageName: "radiohead", albumImageName: "PabloHoney",
             url: URL(string: "https://music.apple.com/mx/album/creep/1097862062?i=1097862231&l=en-GB")),
        Song(name: "Stronger", songLength: "5:12", genre: "Hip-Hop", plays: "1,455,928,389",
             isFavorite: true, isFeatured: true, album: "Graduation", band: "Kanye West",
             description: "Con un sample de Daft Punk, 'Stronger' es un himno de superación y empoderamiento. Kanye mezcla electrónica con rap, creando un track dinámico y energético que definió su estilo durante la era 'Graduation'.",
             bandImageName: "KanyeWest", albumImageName: "Graduation",
             url: URL(string: "https://music.apple.com/mx/album/stronger/1451901307?i=1451902446&l=en-GB")),
        Song(name: "I Wonder", songLength: "4:03", genre: "Hip-Hop", plays: "773,432,798",
             isFavorite: false, isFeatured: false, album: "Graduation", band: "Kanye West",
             description: "Reflexiva y emotiva, 'I Wonder' explora los sueños y deseos de Kanye, mientras mezcla beats electrónicos con elementos de soul. Es una pieza introspectiva dentro de un álbum lleno de éxitos.",
             bandImageName: "KanyeWest", albumImageName: "Graduation",
             url: URL(string: "https://music.apple.com/mx/album/i-wonder/1451901307?i=1451902760&l=en-GB")),
        Song(name: "Apple", songLength: "2:32", genre: "Pop", plays: "168,817,894",
             isFavorite: false, isFeatured: false, album: "Brat", band: "Charli XCX",
             description: "Una canción de pop sintético y experimental, 'Apple' muestra el estilo audaz y futurista de Charli XCX, con ritmos pegajosos y voces distorsionadas que capturan la esencia de su innovador sonido.",
             bandImageName: "Charlixcx", albumImageName: "Brat",
             url: URL(string: "https://music.apple.com/mx/album/apple/1739079974?i=1739080645&l=en-GB")),
        Song(name: "Heart-Shaped Box", songLength: "4:41", genre: "Grunge", plays: "774,819,607",
             isFavorite: false, isFeatured: false, album: "In Utero", band: "Nirvana",
             description: "Intensa y oscura, 'Heart-Shaped Box' representa lo mejor del grunge, con letras enigmáticas y guitarras abrasadoras. Es una de las canciones más emblemáticas de Nirvana y una obra maestra de su álbum In Utero.",
             bandImageName: "Nirvana", albumImageName: "InUtero",
             url: URL(string: "https://music.apple.com/mx/album/heart-shaped-box/1440858699?i=1440859107&l=en-GB")),
        Song(name: "4:44", songLength: "4:44", genre: "Hip-Hop", plays: "152,013,596",
             isFavorite: true, isFeatured: true, album: "4:44", band: "Jay Z",
             description: "Un tema confesional y maduro donde Jay-Z reflexiona sobre su vida personal, errores y crecimiento. '4:44' es una canción cruda y sincera que muestra un lado más vulnerable del rapero.",
             bandImageName: "JayZ", albumImageName: "444",
             url: URL(string: "https://music.apple.com/mx/album/4-44/1440935425?i=1440935862&l=en-GB")),
        Song(name: "m.A.A.d city", songLength: "5:50", genre: "Hip-Hop", plays: "765,195,954",
             isFavorite: false, isFeatured: true, album: "good kid, m.A.A.d city", band: "Kendrick Lamar",
             description: "Con ritmos agresivos y una narrativa que explora la vida en Compton, 'm.A.A.d city' es una representación brutal de las realidades urbanas. Kendrick Lamar combina su habilidad lírica con un beat dinámico y cautivador.",
             bandImageName: "Kendrick", albumImageName: "goodkid",
             url: URL(string: "https://music.apple.com/mx/album/m-a-a-d-city-feat-mc-eiht/1440818890?i=1440818977&l=en-GB")),
        Song(name: "Alright", songLength: "3:39", genre: "Hip-Hop", plays: "755,182,882",
             isFavorite: true, isFeatured: true, album: "To Pimp a Butterfly", band: "Kendrick Lamar",
             description: "Un himno de esperanza en tiempos difíciles, 'Alright' se ha convertido en una canción representativa del activismo social. Kendrick Lamar ofrece un mensaje de resistencia y optimismo, acompañado de un ritmo vibrante.",
             bandImageName: "Kendrick", albumImageName: "tpab",
             url: URL(string: "https://music.apple.com/mx/album/alright/1440828886?i=1440829463&l=en-GB")),
        Song(name: "BIRDS OF A FEATHER", songLength: "3:30", genre: "Pop", plays: "1,085,748,490",
             isFavorite: true, isFeatured: true, album: "HIT ME HARD AND SOFT", band: "Billie Eilish",
             description: "Con un estilo oscuro y etéreo, Billie Eilish combina su característica voz suave con ritmos minimalistas. 'BIRDS OF A FEATHER' es un ejemplo perfecto de su estilo único y alternativo dentro del pop contemporáneo.",
             bandImageName: "Billie", albumImageName: "Hitme",
             url: URL(string: "https://music.apple.com/mx/album/birds-of-a-feather/1739659134?i=1739659142&l=en-GB")),
        Song(name: "Karma Police", songLength: "4:24", genre: "Alternative rock", plays: "577,380,564",
             isFavorite: false, isFeatured: true, album: "Ok Computer", band: "Radiohead",
             description: "'Karma Police' es una canción introspectiva y crítica, con letras que exploran la culpa y el castigo. Los elementos electrónicos y la instrumentación atmosférica reflejan la evolución sonora de Radiohead en su álbum OK Computer.",
             bandImageName: "radiohead", albumImageName: "OkComputer",
             url: URL(string: "https://music.apple.com/mx/album/karma-police/1097861387?i=1097861836&l=en-GB")),
        Song(name: "Even Flow", songLength: "4:52", genre: "Grunge", plays: "620,216,740",
             isFavorite: false, isFeatured: true, album: "Ten", band: "Pearl Jam",
             description: "Con potentes guitarras y la distintiva voz de Eddie Vedder, 'Even Flow' es un himno grunge lleno de energía y emoción. La canción aborda temas de lucha y supervivencia, encapsulando el espíritu de la escena musical de Seattle.",
             bandImageName: "PearlJam", albumImageName: "Ten",
             url: URL(string: "https://music.apple.com/mx/album/even-flow/425465247?i=425465318&l=en-GB")),
        Song(name: "American Idiot", songLength: "2:56", genre: "Alternative rock", plays: "1,016,097,470",
             isFavorite: true, isFeatured: true, album: "American Idiot", band: "Green Day",
             description: "Un ataque mordaz al estado político y social de EE. UU., 'American Idiot' es una explosiva canción punk-rock que capturó el descontento de una generación. Con un ritmo rápido y letras directas, Green Day ofrece un comentario sociopolítico contundente.",
             bandImageName: "GreenDay", albumImageName: "AmericanIdiot",
             url: URL(string: "https://music.apple.com/mx/album/american-idiot/207192731?i=207192732&l=en-GB")),
        Song(name: "Blank Space", songLength: "3:51", genre: "Pop", plays: "1,909,836,002",
             isFavorite: false, isFeatured: true, album: "1989", band: "Taylor Swift",
             description: "Una sátira juguetona sobre el estereotipo de 'chica loca', 'Blank Space' es uno de los mayores éxitos de Taylor Swift. Con su pegajoso estribillo y producción pop impecable, la canción es un reflejo de la habilidad de Taylor para contar historias.",
             bandImageName: "TaylorSwift", albumImageName: "1989",
             url: URL(string: "https://music.apple.com/mx/album/blank-space-taylors-version/1713845538?i=1713845737&l=en-GB"))
    ]
}
