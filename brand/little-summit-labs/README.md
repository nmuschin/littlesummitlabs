# Little Summit Labs: brand kit

Small, useful apps, each one a step up.

**Mark:** a solid mountain with a smaller peak beside it, and the trail to the summit cut into it, with a stop at each turn. The cut is transparent, so the tile's gradient (or the page behind a bare mark) shows through. **Colour:** Indigo gradient. **Wordmark:** Plus Jakarta Sans (ExtraBold "Little Summit", Medium "Labs"), converted to outlines, so no font is needed.

## Files

| File | Use |
|---|---|
| `svg/littlesummit-tile.svg`, `png/littlesummit-tile-512.png` | The primary mark: website header, About pages, docs |
| `png/littlesummit-avatar-400.png` | GitHub, App Store Connect, social profile pictures |
| `svg/app-icon.svg`, `png/app-icon-1024.png` | Full-bleed 1024 square for anything that applies its own corner mask (iOS/macOS icon slots) |
| `svg/littlesummit-lockup-horizontal(-dark).svg` + `@2x.png` | Website header, README banners, email signature |
| `svg/littlesummit-lockup-stacked(-dark).svg` + `@2x.png` | Splash and About screens, square spots |
| `svg/social-card.svg`, `png/social-card-1200x630.png` | `og:image` / link-preview card for the website |
| `svg/littlesummit-mark.svg` / `-white.svg` / `-ink.svg` | The mark without a tile, on light / dark / one-colour backgrounds |
| `svg/favicon.svg`, `png/favicon.ico`, `favicon-16/32/48.png` | Web favicons. Same mark with a thicker trail, so it stays readable at 16 px. |
| `svg/littlesummit-mark-small.svg` | The thicker-trail mark on its own, for other tiny placements |
| `png/apple-touch-icon-180.png` | `<link rel="apple-touch-icon">` |

## Colours

| Role | Hex |
|---|---|
| Indigo, gradient top | `#6E7BFF` |
| Indigo, gradient bottom (and the solid fallback) | `#2F38C8` |
| Ink (wordmark) | `#16171B` |
| Gray ("Labs", secondary text) | `#55575E` |
| Paper (light background) | `#F5F5F7` |
| Dark-mode gray ("Labs" on dark) | `#A4A7AE` |

The gradient runs straight down, top to bottom.

## Quick rules
- Keep clear space around the tile of at least a quarter of its width.
- Use the tile wherever you can. Use the bare mark only where a tile won't fit.
- At 32 px and below, use the favicon / small mark (thicker trail).
- The mark is one colour: white on the tile, or indigo/ink on its own. Don't fill the trail cut with another colour.

## Website snippet

```html
<link rel="icon" href="/favicon.svg" type="image/svg+xml">
<link rel="icon" href="/favicon.ico" sizes="any">
<link rel="apple-touch-icon" href="/apple-touch-icon-180.png">
<meta property="og:image" content="https://YOUR-DOMAIN/social-card-1200x630.png">
```

## SwiftUI

```swift
extension Color {
    static let littleSummitIndigoTop = Color(red: 0x6E/255, green: 0x7B/255, blue: 0xFF/255)
    static let littleSummitIndigo    = Color(red: 0x2F/255, green: 0x38/255, blue: 0xC8/255)
    static let littleSummitInk       = Color(red: 0x16/255, green: 0x17/255, blue: 0x1B/255)
    static let littleSummitGray      = Color(red: 0x55/255, green: 0x57/255, blue: 0x5E/255)
}

extension LinearGradient {
    static let littleSummit = LinearGradient(colors: [.littleSummitIndigoTop, .littleSummitIndigo],
                                             startPoint: .top, endPoint: .bottom)
}
```

Plus Jakarta Sans is licensed under the SIL Open Font License, so commercial use is fine.
