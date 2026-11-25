"""Build the Little Summit Labs SVG set (mark C, Indigo) with the wordmark converted to outlines."""
import os
import sys

from fontTools.pens.boundsPen import BoundsPen
from fontTools.pens.svgPathPen import SVGPathPen
from fontTools.pens.transformPen import TransformPen
from fontTools.ttLib import TTFont

FONT_DIR, OUT = sys.argv[1], sys.argv[2]
os.makedirs(OUT, exist_ok=True)

INDIGO_TOP, INDIGO_BOTTOM = "#6E7BFF", "#2F38C8"
INK, GRAY, PAPER = "#16171B", "#55575E", "#F5F5F7"
DARK_BG, DARK_GRAY = "#16171B", "#A4A7AE"

fonts = {w: TTFont(os.path.join(FONT_DIR, f"PlusJakartaSans-{w}.ttf")) for w in (500, 800)}

MOUNTAIN = "M6 82 L25 55 Q28 51 31 55 L36 62 L52 32 Q56 25 60 32 L94 82 Z"
TRAIL = "M34 80 L70 70 L48 60 L62 46 L56 34"
STOPS = [(70, 70), (48, 60), (62, 46)]


def mark(color, mid, small=False):
    """The Little Summit mark: a solid mountain with the trail and its stops cut out of it.

    The cut is a mask, so whatever is behind the mark (the tile's gradient, a page)
    shows through the trail. `small` thickens the trail and stops for 16-32 px.
    """
    w, r = (7.5, 6.5) if small else (5.5, 5)
    cut = (f'<path d="{TRAIL}" fill="none" stroke="#000" stroke-width="{w}" stroke-linecap="round" stroke-linejoin="round"/>'
           + "".join(f'<circle cx="{x}" cy="{y}" r="{r}" fill="#000"/>' for x, y in STOPS))
    return (f'<defs><mask id="{mid}" maskUnits="userSpaceOnUse" x="0" y="0" width="100" height="100">'
            f'<rect width="100" height="100" fill="#fff"/>{cut}</mask></defs>'
            f'<g transform="translate(0 -3)"><path d="{MOUNTAIN}" fill="{color}" stroke="{color}" stroke-width="4" '
            f'stroke-linejoin="round" mask="url(#{mid})"/></g>')


def gradient(gid, x1=0, y1=0, x2=0, y2=1, units="objectBoundingBox"):
    return (f'<defs><linearGradient id="{gid}" x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" gradientUnits="{units}">'
            f'<stop offset="0" stop-color="{INDIGO_TOP}"/><stop offset="1" stop-color="{INDIGO_BOTTOM}"/>'
            f'</linearGradient></defs>')


def tile(size=100, rx=None, inner=None, full_bleed=False, gid="lsg"):
    """Indigo gradient tile with the white mark centred at 80% of the tile."""
    inner = inner or mark("#FFFFFF", gid + "m")
    rx = 0 if full_bleed else (rx if rx is not None else size * 0.225)
    s = size * 0.8 / 100
    off = (size - 100 * s) / 2
    return (f'{gradient(gid)}<rect width="{size:g}" height="{size:g}" rx="{rx:g}" fill="url(#{gid})"/>'
            f'<g transform="translate({off:g} {off:g}) scale({s:g})">{inner}</g>')


def text_path(text, weight, size, x, baseline):
    font = fonts[weight]
    gs, cmap, hmtx = font.getGlyphSet(), font.getBestCmap(), font["hmtx"]
    scale = size / font["head"].unitsPerEm
    pen, bounds = SVGPathPen(gs), BoundsPen(gs)
    cx = 0
    for ch in text:
        name = cmap[ord(ch)]
        tr = (scale, 0, 0, -scale, x + cx * scale, baseline)
        gs[name].draw(TransformPen(pen, tr))
        gs[name].draw(TransformPen(bounds, tr))
        cx += hmtx[name][0]
    b = bounds.bounds or (0, baseline, 0, baseline)
    return pen.getCommands(), cx * scale, (b[1], b[3])


def svg(w, h, body, label):
    return (f'<svg xmlns="http://www.w3.org/2000/svg" width="{w:g}" height="{h:g}" viewBox="0 0 {w:g} {h:g}" '
            f'role="img" aria-label="{label}"><title>{label}</title>{body}</svg>\n')


def write(name, content):
    with open(os.path.join(OUT, name), "w") as f:
        f.write(content)


NAME = "Little Summit Labs"
WORD = "Little Summit"

# Standalone marks (no tile)
write("littlesummit-mark.svg", svg(100, 100, mark(INDIGO_BOTTOM, "m"), NAME))
write("littlesummit-mark-white.svg", svg(100, 100, mark("#FFFFFF", "m"), NAME))
write("littlesummit-mark-ink.svg", svg(100, 100, mark(INK, "m"), NAME))
write("littlesummit-mark-small.svg", svg(100, 100, mark(INDIGO_BOTTOM, "m", small=True), NAME))

# Tiles
write("littlesummit-tile.svg", svg(100, 100, tile(), NAME))
write("app-icon.svg", svg(1024, 1024, tile(1024, full_bleed=True), f"{NAME} app icon"))
write("favicon.svg", svg(100, 100, tile(inner=mark("#FFFFFF", "fm", small=True)), NAME))


# Horizontal lockup: tile (100) + "Little Summit Labs", text centred on the tile
def lockup_h(word_color, labs_color, suffix):
    size, x0 = 56, 124
    _, _, (y0, y1) = text_path(WORD, 800, size, 0, 0)
    baseline = 50 - (y0 + y1) / 2
    d1, w1, _ = text_path(WORD, 800, size, x0, baseline)
    d2, w2, _ = text_path(" Labs", 500, size, x0 + w1, baseline)
    width = x0 + w1 + w2 + 4
    body = f'{tile(gid="h" + suffix)}<path d="{d1}" fill="{word_color}"/><path d="{d2}" fill="{labs_color}"/>'
    return svg(round(width, 1), 100, body, NAME)


write("littlesummit-lockup-horizontal.svg", lockup_h(INK, GRAY, "l"))
write("littlesummit-lockup-horizontal-dark.svg", lockup_h(PAPER, DARK_GRAY, "d"))


# Stacked lockup: tile centred above the wordmark
def lockup_s(word_color, labs_color, suffix):
    size = 40
    _, w1, _ = text_path(WORD, 800, size, 0, 0)
    _, w2, _ = text_path(" Labs", 500, size, 0, 0)
    width = w1 + w2 + 8
    tx = (width - (w1 + w2)) / 2
    baseline = 100 + 22 + size * 0.74
    d1, _, _ = text_path(WORD, 800, size, tx, baseline)
    d2, _, (_, ymax) = text_path(" Labs", 500, size, tx + w1, baseline)
    height = max(ymax, baseline) + 6
    body = (f'<g transform="translate({(width - 100) / 2:g} 0)">{tile(gid="s" + suffix)}</g>'
            f'<path d="{d1}" fill="{word_color}"/><path d="{d2}" fill="{labs_color}"/>')
    return svg(round(width, 1), round(height, 1), body, NAME)


write("littlesummit-lockup-stacked.svg", lockup_s(INK, GRAY, "l"))
write("littlesummit-lockup-stacked-dark.svg", lockup_s(PAPER, DARK_GRAY, "d"))

# Social / Open Graph card (1200x630): stacked lockup on paper
d1, w1, _ = text_path(WORD, 800, 88, 0, 0)
_, w2, _ = text_path(" Labs", 500, 88, 0, 0)
tx = (1200 - (w1 + w2)) / 2
d1, _, _ = text_path(WORD, 800, 88, tx, 470)
d2, _, _ = text_path(" Labs", 500, 88, tx + w1, 470)
og = (f'<rect width="1200" height="630" fill="{PAPER}"/>'
      f'<g transform="translate(480 100) scale(2.4)">{tile(gid="og")}</g>'
      f'<path d="{d1}" fill="{INK}"/><path d="{d2}" fill="{GRAY}"/>')
write("social-card.svg", svg(1200, 630, og, NAME))
print("ok")
