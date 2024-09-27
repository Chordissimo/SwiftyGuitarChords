import Foundation
import CoreGraphics
import SwiftUI

public struct Chords {
    
    public enum Group {
        case major, minor, diminished, augmented, suspended, other
    }

    public enum Key: String, CaseIterable, Codable, Comparable {
        case c = "C"
        case cSharp = "C#"
        case dFlat = "Db"
        case d = "D"
        case dSharp = "D#"
        case eFlat = "Eb"
        case e = "E"
        case f = "F"
        case fSharp = "F#"
        case gFlat = "Gb"
        case g = "G"
        case gSharp = "G#"
        case aFlat = "Ab"
        case a = "A"
        case aSharp = "A#"
        case bFlat = "Bb"
        case b = "B"
        
        /// Implement Comparable
        public static func < (lhs: Self, rhs: Self) -> Bool {
            return allCases.firstIndex(of: lhs)! < allCases.firstIndex(of: rhs)!
        }
        
        /// Contains text for accessibility text-to-speech and symbolized versions.
        public var display: (accessible: String, symbol: String) {
            switch self {
            case .c:
                return ("C", "C")
            case .cSharp:
                return ("C sharp", "C♯")
            case .dFlat:
                return ("D flat", "D♭")
            case .d:
                return ("D", "D")
            case .dSharp:
                return ("D sharp", "D♯")
            case .eFlat:
                return ("E flat", "E♭")
            case .e:
                return ("E", "E")
            case .f:
                return ("F", "F")
            case .fSharp:
                return ("F sharp", "F♯")
            case .gFlat:
                return ("G flat", "G♭")
            case .g:
                return ("G", "G")
            case .gSharp:
                return ("G sharp", "G♯")
            case .aFlat:
                return ("A flat", "A♭")
            case .a:
                return ("A", "A")
            case .aSharp:
                return ("A sharp", "A♯")
            case .bFlat:
                return ("B flat", "B♭")
            case .b:
                return ("B", "B")
            }
        }
    }

    public enum Suffix: String, CaseIterable, Codable, Comparable {
        case _major = "major"
        case _overCSharp = "/c#"
        case _overD = "/d"
        case _overDSharp = "/d#"
        case _overE = "/e"
        case _overF = "/f"
        case _overFSharp = "/f#"
        case _overG = "/g"
        case _overGSharp = "/g#"
        case _overA = "/a"
        case _overASharp = "/a#"
        case _overB = "/b"
        case _minor = "minor"
        case _mOverCSharp = "m/c#"
        case _mOverD = "m/d"
        case _mOverDSharp = "m/d#"
        case _mOverE = "m/e"
        case _mOverF = "m/f"
        case _mOverFSharp = "m/f#"
        case _mOverG = "m/g"
        case _mOverGSharp = "m/g#"
        case _mOverA = "m/a"
        case _mOverASharp = "m/a#"
        case _mOverB = "m/b"
        case _dim = "dim"
        case _aug = "aug"
        case _sus2 = "sus2"
        case _sus4 = "sus4"
        case _majb5 = "majb5"
        case _mSharp5 = "m#5"
        case _sus4sharp5 = "sus4#5"
        case _sus2b5 = "sus2b5"
        case _sus2sharp5 = "sus2#5"
        case _7 = "7"
        case _m7 = "m7"
        case _maj7 = "maj7"
        case _mMaj7 = "mmaj7"
        case _dim7 = "dim7"
        case _aug7 = "aug7"
        case _7b5 = "7b5"
        case _maj7b5 = "maj7b5"
        case _m7b5 = "m7b5"
        case _mMaj7b5 = "mmaj7b5"
        case _m7sharp5 = "m7#5"
        case _mMaj7sharp5 = "mmaj7#5"
        case _7b9 = "7b9"
        case _6 = "6"
        case _m6 = "m6"
        case _6b5 = "6b5"
        case _6add9 = "6add9"
        case _m6add9 = "m6add9"
        case _9 = "9"
        case _m9 = "m9"
        case _m9OverA = "m9/a"
        case _maj9 = "maj9"
        case _mMaj9 = "mmaj9"
        case _9b5 = "9b5"
        case _aug9 = "aug9"
        case _9sus4 = "9sus4"
        case _7sharp9 = "7#9"
        case _7sharp9b5 = "7#9b5"
        case _11 = "11"
        case _m11 = "m11"
        case _maj11 = "maj11"
        case _mMaj11 = "mmaj11"
        case _majSharp11 = "maj#11"
        case _13 = "13"
        case _m13 = "m13"
        case _maj13 = "maj13"
        case _mMaj13 = "mmaj13"
        case _7sus2 = "7sus2"
        case _maj7sus2 = "maj7sus2"
        case _7sus4 = "7sus4"
        case _maj7sus4 = "maj7sus4"
        case _7sus2sharp5 = "7sus2#5"
        case _7sus4sharp5 = "7sus4#5"
        case _5 = "5"
        case _add9 = "add9"
        case _overC = "/c"
        case _mOverC = "m/c"
        case _9sharp11 = "9#11"
        case _maj7sharp5 = "maj7#5"
        case _7sharp5 = "7#5"
        case _madd9 = "madd9"
        
        /// Implement Comparable
        public static func < (lhs: Self, rhs: Self) -> Bool {
            return allCases.firstIndex(of: lhs)! < allCases.firstIndex(of: rhs)!
        }
        
        /// A suitible string for displaying to users.
        /// - `accessible:`  "seven flat five". Useful for text to speech.
        /// - `short:` Maj, min
        /// - `symbol:` dim⁷, + For the most common uses of symbols in music notation.
        /// - `altSymbol:` °, ⁺ Alternative examples of the above `symbol` examples.
        ///
        /// Advice is to look through this list and choose what is appropriate for your app. Please submit a PR if you'd like to add or change some of these items if you beleive it could be improved.
        /// Because of this, do not rely on these values to always remain the same. So don't use them as identifiers, or keys.
        ///
        /// For accessibility strings the "th" is dropped from numbers. While not completely accurate, it rolls better.
        ///
        /// Symbols use superscript where appropriate (and possible). Be aware that not all fonts will support this. Use `short` instead if you're unsure.
        ///
        /// Some items may also be identical across types. Only in rare cases will an alt symbol be provided e.g. (`dim⁷`,`°`)
        public var display: (accessible: String, short: String, symbolized: String, altSymbol: String) {
            switch self {
            case ._major:
                return ("", "major", "major", "")
            case ._overCSharp:
                return ("", "/C#", "/C♯", "")
            case ._overD:
                return ("", "/D", "/D", "")
            case ._overDSharp:
                return ("", "/D#", "/D♯", "")
            case ._overE:
                return ("", "/E", "/E", "")
            case ._overF:
                return ("", "/F", "/F", "")
            case ._overFSharp:
                return ("", "/F#", "/F♯", "")
            case ._overG:
                return ("", "/G", "/G", "")
            case ._overGSharp:
                return ("", "/G#", "/G♯", "")
            case ._overA:
                return ("", "/A", "/A", "")
            case ._overASharp:
                return ("", "/A#", "/A♯", "")
            case ._overB:
                return ("", "/B", "/B", "")
            case ._minor:
                return ("", "minor", "minor", "")
            case ._mOverCSharp:
                return ("", "m/C#", "m/C♯", "")
            case ._mOverD:
                return ("", "m/D", "m/D", "")
            case ._mOverDSharp:
                return ("", "m/D#", "m/D♯", "")
            case ._mOverE:
                return ("", "m/E", "m/E", "")
            case ._mOverF:
                return ("", "m/F", "m/F", "")
            case ._mOverFSharp:
                return ("", "m/F#", "m/F♯", "")
            case ._mOverG:
                return ("", "m/G", "m/G", "")
            case ._mOverGSharp:
                return ("", "m/G#", "m/G♯", "")
            case ._mOverA:
                return ("", "m/A", "m/A", "")
            case ._mOverASharp:
                return ("", "m/A#", "m/A♯", "")
            case ._mOverB:
                return ("", "m/B", "m/B", "")
            case ._dim:
                return ("", "dim", "dim", "")
            case ._aug:
                return ("", "aug", "aug", "")
            case ._sus2:
                return ("", "sus2", "sus²", "")
            case ._sus4:
                return ("", "sus4", "sus⁴", "")
            case ._majb5:
                return ("", "majb5", "maj♭⁵", "")
            case ._mSharp5:
                return ("", "m#5", "m♯⁵", "")
            case ._sus4sharp5:
                return ("", "sus4#5", "sus⁴♯⁵", "")
            case ._sus2b5:
                return ("", "sus2b5", "sus²♭⁵", "")
            case ._sus2sharp5:
                return ("", "sus2#5", "sus²♯⁵", "")
            case ._7:
                return ("", "7", "⁷", "")
            case ._m7:
                return ("", "m7", "m⁷", "")
            case ._maj7:
                return ("", "maj7", "maj⁷", "")
            case ._mMaj7:
                return ("", "mmaj7", "mmaj⁷", "")
            case ._dim7:
                return ("", "dim7", "dim⁷", "")
            case ._aug7:
                return ("", "aug7", "aug⁷", "")
            case ._7b5:
                return ("", "7b5", "⁷♭⁵", "")
            case ._maj7b5:
                return ("", "maj7b5", "maj⁷♭⁵", "")
            case ._m7b5:
                return ("", "m7b5", "m⁷♭⁵", "")
            case ._mMaj7b5:
                return ("", "mmaj7b5", "mmaj⁷♭⁵", "")
            case ._m7sharp5:
                return ("", "m7#5", "m⁷♯⁵", "")
            case ._mMaj7sharp5:
                return ("", "mmaj7#5", "mmaj⁷♯⁵", "")
            case ._7b9:
                return ("", "7b9", "⁷b⁹", "")
            case ._6:
                return ("", "6", "⁶", "")
            case ._m6:
                return ("", "m6", "m⁶", "")
            case ._6b5:
                return ("", "6b5", "⁶♭⁵", "")
            case ._6add9:
                return ("", "6add9", "⁶add⁹", "")
            case ._m6add9:
                return ("", "m6add9", "m⁶add⁹", "")
            case ._9:
                return ("", "9", "⁹", "")
            case ._m9:
                return ("", "m9", "m⁹", "")
            case ._m9OverA:
                return ("", "m9/A", "m⁹/A", "")
            case ._maj9:
                return ("", "maj9", "maj⁹", "")
            case ._mMaj9:
                return ("", "mmaj9", "mmaj⁹", "")
            case ._9b5:
                return ("", "9b5", "⁹♭⁵", "")
            case ._aug9:
                return ("", "aug9", "aug⁹", "")
            case ._9sus4:
                return ("", "9sus4", "⁹sus⁴", "")
            case ._7sharp9:
                return ("", "7#9", "⁷♯⁹", "")
            case ._7sharp9b5:
                return ("", "7#9b5", "⁷♯⁹♭⁵", "")
            case ._11:
                return ("", "11", "¹¹", "")
            case ._m11:
                return ("", "m11", "m¹¹", "")
            case ._maj11:
                return ("", "maj11", "maj¹¹", "")
            case ._mMaj11:
                return ("", "mmaj11", "mmaj¹¹", "")
            case ._majSharp11:
                return ("", "maj#11", "maj♯¹¹", "")
            case ._13:
                return ("", "13", "¹³", "")
            case ._m13:
                return ("", "m13", "m¹³", "")
            case ._maj13:
                return ("", "maj13", "maj¹³", "")
            case ._mMaj13:
                return ("", "mmaj13", "mmaj¹³", "")
            case ._7sus2:
                return ("", "7sus2", "⁷sus²", "")
            case ._maj7sus2:
                return ("", "maj7sus2", "maj⁷sus²", "")
            case ._7sus4:
                return ("", "7sus4", "⁷sus⁴", "")
            case ._maj7sus4:
                return ("", "maj7sus4", "maj⁷sus⁴", "")
            case ._7sus2sharp5:
                return ("", "7sus2#5", "⁷sus²♯⁵", "")
            case ._7sus4sharp5:
                return ("", "7sus4#5", "⁷sus⁴♯⁵", "")
            case ._5:
                return ("", "5", "⁵", "")
            case ._add9:
                return ("", "add9", "add⁹", "")
            case ._overC:
                return ("", "/C", "/C", "")
            case ._mOverC:
                return ("", "m/C", "m/C", "")
            case ._9sharp11:
                return ("", "9#11","9#11","⁹♯¹¹")
            case ._maj7sharp5:
                return ("", "maj7#5","maj7#5","maj⁷♯⁵")
            case ._7sharp5:
                return ("", "7#5","7#5","⁷♯⁵")
            case ._madd9:
                return ("", "madd9","madd9","add⁹")
            }
        }
        /// Supports a few most popular groupings. Major, Minor, Diminished, Augmented, Suspended.
        /// Please open a PR if you'd like to introduce more types or offer corrections.
        /// Anything that doesn't fit into the above categories are put in `other`.
        ///
        /// The intention for the group is for developers to offer different filter types for chart lookup.
        var group: Chords.Group {
            return .other
//            switch self {
//            case .major, .majorSeven, .majorSevenFlatFive, .majorSevenSharpFive, .majorNine, .majorEleven, .majorThirteen, .addNine, .slashE, .slashF, .slashFSharp, .slashG, .slashGSharp, .slashA, .slashBFlat, .slashB, .slashC, .slashCSharp, .slashD, .slashDSharp:
//                return .major
//            case .minor, .minorSix, .minorSixNine, .minorSeven, .minorEleven, .minorSevenFlatFive, .minorMajorSeven, .minorMajorSeventFlatFive, .minorMajorNine, .minorMajorEleven, .minorAddNine, .minorSlashB, .minorSlashC, .minorSlashCSharp, .minorSlashD, .minorSlashDSharp, .minorSlashE, .minorSlashF, .minorSlashFSharp, .minorSlashG, .minorNine, .minorSlashGSharp:
//                return .minor
//            case .dim, .dimSeven:
//                return .diminished
//            case .susTwo, .susFour, .sevenSusFour:
//                return .suspended
//            case .aug, .augSeven, .augNine:
//                return .augmented
//            case .altered, .five, .six, .sixNine, .seven, .sevenFlatFive, .nine, .nineFlatFive, .sevenFlatNine, .sevenSharpNine, .eleven, .nineSharpEleven, .thirteen, .sevenSharpFive:
//                return .other
//            }
        }
    }

    /// Display options for the chord name
    public struct Name {
        /// Init the struct
        public init(show: Bool = true, key: Name.Display.Key = .raw, suffix: Name.Display.Suffix = .raw) {
            self.show = show
            self.key = key
            self.suffix = suffix
        }
        /// Show the name in the chord shape
        public var show: Bool
        /// Display of the Key value
        public var key: Display.Key
        /// Display of the Suffix value
        public var suffix: Display.Suffix
        /// Display modus of the chord name
        public enum Display {
            /// Key display modus
            public enum Key {
                case raw
                case accessible
                case symbol
            }
            /// Suffix display modus
            public enum Suffix {
                case raw
                case short
                case symbolized
                case altSymbol
            }
        }
    }
    
    public static var guitar: [ChordPosition] = Chords.readData(for: "GuitarChords")
    public static var ukulele: [ChordPosition] = Chords.readData(for: "UkuleleChords")
    
    private static func readData(for name: String) -> [ChordPosition] {
        do {
            let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let resourceUrl = documentsPath.appendingPathComponent(name + ".json")
            let data = try Data(contentsOf: resourceUrl)
            let allChords = try JSONDecoder().decode([ChordPosition].self, from: data)
            #if DEBUG
            print("Loaded JSON from \(resourceUrl.absoluteString), chords count:", allChords.count)
            #endif
            return allChords
        } catch {
            #if DEBUG
            print("There is no chord data:", error)
            #endif
        }

        do {
            var resourceUrl = Bundle.module.resourceURL
            resourceUrl?.appendPathComponent(name)
            resourceUrl?.appendPathExtension("json")
            if let fileUrl = resourceUrl {
                let data = try Data(contentsOf: fileUrl)
                let allChords = try JSONDecoder().decode([ChordPosition].self, from: data)
                #if DEBUG
                print("Loaded JSON from \(fileUrl.absoluteString), chords count:", allChords.count)
                #endif
                return allChords
            }
        } catch {
            #if DEBUG
            print("There is no chord data:", error)
            #endif
        }
        
        return []
    }
    
}

private class BundleFinder {}
