//
//  LittleSummit.swift
//  The Little Summit Labs brand, shared by every app.
//
//  Copy this file into an app target (iOS 17+, macOS 14+, watchOS 10+). It has no
//  dependencies and no asset-catalog entries. The values match the design system
//  and brand/little-summit-labs/README.md; change them there first, then here.
//
//  Use the studio colours on studio surfaces (About screens, "More apps" lists).
//  Inside an app, prefer the system's semantic colours (.primary, .secondary,
//  backgrounds) and set the app's own accent with `.tint(LittleSummit.App.x.accent)`.
//

import SwiftUI

public enum LittleSummit {

    // MARK: Studio colours

    /// Top of the tile gradient. Logo tiles only; never put text on it (white is 3.5:1).
    public static let indigoTop = Color(lsHex: 0x6E7BFF)
    /// The brand indigo in both appearances: tile gradient bottom, primary button fill.
    public static let indigoSolid = Color(lsHex: 0x2F38C8)
    /// Indigo for text and links. Lifts in Dark Mode so it stays readable.
    public static let indigo = Color(lsLight: 0x2F38C8, dark: 0x8C96FF)
    /// Primary text and the "Little Summit" wordmark.
    public static let ink = Color(lsLight: 0x16171B, dark: 0xF5F5F7)
    /// Secondary text and "Labs" in the wordmark.
    public static let gray = Color(lsLight: 0x55575E, dark: 0xA4A7AE)
    /// Page background.
    public static let paper = Color(lsLight: 0xF5F5F7, dark: 0x16171B)
    /// Raised surfaces such as cards.
    public static let card = Color(lsLight: 0xFFFFFF, dark: 0x1F2026)
    /// Hairlines and card outlines. Decorative only.
    public static let border = Color(lsLight: 0xE4E5EA, dark: 0x2E3038)
    /// Fill behind an app icon that doesn't exist yet.
    public static let placeholder = Color(lsLight: 0xE5E8FF, dark: 0x262A52)

    /// The tile gradient: straight down, indigoTop to indigoSolid.
    public static let gradient = LinearGradient(colors: [indigoTop, indigoSolid],
                                                startPoint: .top, endPoint: .bottom)

    // MARK: Shape

    /// Corner radius of a logo tile as a share of its side (22.5).
    public static let tileCornerRatio: CGFloat = 0.225
    /// Corner radius of a 64 pt app icon.
    public static let iconCornerRadius: CGFloat = 15
    /// Corner radius of cards.
    public static let cardCornerRadius: CGFloat = 20
    /// Corner radius of buttons.
    public static let buttonCornerRadius: CGFloat = 12

    // MARK: Apps and their accents

    /// Every studio app, with the accent colour its own code uses today.
    public enum App: String, CaseIterable, Identifiable {
        case waymarkStudy, classroomDesigner, highLowBuffalo, citeItRight, jobTrack,
             fuelTrack, markdownDoctor, bellwether, quoteBloom, dateGlow, cellarStories

        public var id: String { rawValue }

        public var name: String {
            switch self {
            case .waymarkStudy: "Waymark Study"
            case .classroomDesigner: "ClassroomDesigner"
            case .highLowBuffalo: "High Low Buffalo"
            case .citeItRight: "Cite It Right"
            case .jobTrack: "JobTrack"
            case .fuelTrack: "FuelTrack"
            case .markdownDoctor: "MarkdownDoctor"
            case .bellwether: "Bellwether"
            case .quoteBloom: "QuoteBloom"
            case .dateGlow: "DateGlow"
            case .cellarStories: "CellarStories"
            }
        }

        /// The app's accent, taken from its repo (AccentColor asset or `--accent` CSS).
        /// `nil` means the app has no accent of its own yet and uses the system accent.
        public var accent: Color? {
            switch self {
            case .waymarkStudy: Color(lsLight: 0xB0552F, dark: 0xD97A4E)      // terracotta, globals.css --accent
            case .classroomDesigner: Color(lsHex: 0x2563EB)                   // blue, index.css --accent (light only)
            case .highLowBuffalo: Color(lsLight: 0xC8553D, dark: 0xD9694F)    // terracotta, AccentColor asset
            case .citeItRight: Color(lsLight: 0x3B5BDB, dark: 0x7C96FF)       // blue, AccentColor asset
            case .markdownDoctor: Color(lsHex: 0x0A84FF)                      // blue, AccentColor asset (one value)
            case .jobTrack, .fuelTrack, .bellwether, .quoteBloom, .dateGlow:
                nil                                                         // AccentColor asset left empty
            case .cellarStories:
                nil                                                         // user-chosen; defaults to system .pink
            }
        }

        /// The accent to tint with: the app's own, or the system accent.
        public var tint: Color { accent ?? .accentColor }
    }

    // MARK: Type

    /// Plus Jakarta Sans when the app bundles it (add the TTFs and list them under
    /// "Fonts provided by application"), otherwise the system font at the same size.
    /// Every style scales with Dynamic Type.
    public enum Typography {
        /// Hero headline. 800, tight leading; pair with `.kerning(-0.64)` at 32 pt.
        public static let display = jakarta(.extraBold, size: 32, relativeTo: .largeTitle)
        /// Section heading. 800.
        public static let title = jakarta(.extraBold, size: 22, relativeTo: .title2)
        /// App names and list headlines. 700.
        public static let headline = jakarta(.bold, size: 17, relativeTo: .headline)
        /// Default text. 400.
        public static let body = jakarta(.regular, size: 17, relativeTo: .body)
        /// Secondary descriptions. 400.
        public static let callout = jakarta(.regular, size: 15, relativeTo: .callout)
        /// Platform line, uppercase with `.textCase(.uppercase)` and `.kerning(0.5)`. 700.
        public static let eyebrow = jakarta(.bold, size: 12, relativeTo: .caption)

        public enum Weight: String {
            case regular = "Regular", medium = "Medium", bold = "Bold", extraBold = "ExtraBold"
            var system: Font.Weight {
                switch self {
                case .regular: .regular
                case .medium: .medium
                case .bold: .bold
                case .extraBold: .heavy
                }
            }
        }

        public static func jakarta(_ weight: Weight, size: CGFloat,
                                   relativeTo style: Font.TextStyle = .body) -> Font {
            let postScriptName = "PlusJakartaSans-\(weight.rawValue)"
            if isInstalled(postScriptName) {
                return .custom(postScriptName, size: size, relativeTo: style)
            }
            return .system(style, weight: weight.system)
        }

        private static func isInstalled(_ name: String) -> Bool {
            #if canImport(UIKit)
            return UIFont(name: name, size: 12) != nil
            #elseif canImport(AppKit)
            return NSFont(name: name, size: 12) != nil
            #else
            return false
            #endif
        }
    }
}

// MARK: - Studio tile

extension LittleSummit {
    /// The indigo gradient tile at any size, for About screens. Pass the white mark
    /// from the brand kit (littlesummit-mark-white.svg added to the asset catalog).
    public struct Tile<Mark: View>: View {
        private let size: CGFloat
        private let mark: Mark

        public init(size: CGFloat, @ViewBuilder mark: () -> Mark) {
            self.size = size
            self.mark = mark()
        }

        public var body: some View {
            RoundedRectangle(cornerRadius: size * LittleSummit.tileCornerRatio, style: .continuous)
                .fill(LittleSummit.gradient)
                .frame(width: size, height: size)
                .overlay { mark.frame(width: size * 0.8, height: size * 0.8) }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Little Summit Labs")
        }
    }
}

// MARK: - Colour helpers

extension Color {
    /// A colour from a 0xRRGGBB literal, the same in light and dark.
    fileprivate init(lsHex hex: UInt32) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xFF) / 255,
                  green: Double((hex >> 8) & 0xFF) / 255,
                  blue: Double(hex & 0xFF) / 255,
                  opacity: 1)
    }

    /// A colour that switches with the system appearance. watchOS is always dark.
    fileprivate init(lsLight light: UInt32, dark: UInt32) {
        #if os(watchOS)
        self.init(lsHex: dark)
        #elseif canImport(UIKit)
        self.init(uiColor: UIColor { traits in
            UIColor(Color(lsHex: traits.userInterfaceStyle == .dark ? dark : light))
        })
        #elseif canImport(AppKit)
        self.init(nsColor: NSColor(name: nil) { appearance in
            let isDark = appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
            return NSColor(Color(lsHex: isDark ? dark : light))
        })
        #else
        self.init(lsHex: light)
        #endif
    }

    // The names from the original brand README, kept so existing code still compiles.
    // Delete that old snippet from an app when you add this file, or these will clash.
    static let littleSummitIndigoTop = LittleSummit.indigoTop
    static let littleSummitIndigo = LittleSummit.indigoSolid
    static let littleSummitInk = Color(lsHex: 0x16171B)
    static let littleSummitGray = Color(lsHex: 0x55575E)
}

extension LinearGradient {
    static let littleSummit = LittleSummit.gradient
}

#Preview("Studio colours and app accents") {
    List {
        Section("Studio") {
            LittleSummit.Tile(size: 64) { Image(systemName: "mountain.2.fill").resizable().scaledToFit().foregroundStyle(.white) }
            Text("Little Summit").font(LittleSummit.Typography.display).foregroundStyle(LittleSummit.ink)
            Text("Small, useful apps, each one a step up.").font(LittleSummit.Typography.callout).foregroundStyle(LittleSummit.gray)
        }
        Section("App accents") {
            ForEach(LittleSummit.App.allCases) { app in
                Label(app.name, systemImage: app.accent == nil ? "circle.dashed" : "circle.fill")
                    .foregroundStyle(app.tint)
            }
        }
    }
}
