# Little Summit Labs — combined to-do list

*This file is public on the studio site, like everything in this repo.*

Built on 2026-11-05 (last updated 2026-11-22: repo-rename references fixed in every repo. 2026-11-21: every repo rechecked, nothing new merged; hardware builds added; plan pushed back a week. 2026-11-20: netmap's merged roadmap work and #11; Android Studio installed; branch clean-up; repo renamed littlesummitlabs. 2026-11-19: Bellwether and CellarStories icons. 2026-11-18: every repo reviewed again; studio renamed Little Summit Labs; HLB's first TestFlight upload; netmap's tests pass; diabetes-project's analysis and manuscript draft) from every connected repo's TODO.md, PLAN*.md, ROADMAP.md, README "next steps", docs and code comments. Open pull requests are listed with the item they belong to. Covers 16 repos; netmap and diabetes-project were added on 2026-11-05, and the two hardware builds on 2026-11-21.

**How it's ordered:** first fixes for problems people can hit today, then apps that are built and only need launch steps, then feature work. Within each tier, the item that finishes an app comes before the one that starts something new.

**Who does it:**
- 🧑 You: Apple Developer portal, App Store Connect, Xcode and Android Studio on your Mac, real devices, dashboards.
- 🤖 Me: code, docs and pages I can do from a session.
- 🤝 Both: I prepare it and you finish it.

---

## Tier 0 — Fix now (people can hit these today)

- [x] **CellarStories: the "Continue with Apple" button.** Already hidden since 2026-10-20 behind `APPLE_SIGN_IN_ENABLED = false`; its `TODO.md` was out of date (fixed in nmuschin/CellarStories#1). To bring it back: configure the Apple provider (`docs/deployment-guide.md` C3), then flip the flag. 🧑
- [x] **Waymark Study: password-reset emails.** The sending domain `updates.waymarkstudy.com` is verified in Resend, and `MAIL_FROM` and `APP_URL` were already set on the host (confirmed 2026-11-08). Worth one test: request a reset for a second address you own and check it arrives. 🧑
- [x] **QuoteBloom: `TODO.md` was copied into the app bundle.** Fixed in nmuschin/QuoteBloom#1, merged 2026-11-05. The same PR fixed the macOS build: the iOS-only widget is now embedded only in the iOS build. Confirmed in Xcode on iOS and macOS. 🤝

## Decide this week (these have lead time and block several launches)

- [ ] **Developer account: going with an organization account** (decided 2026-11-10, to keep your legal name off the App Store). An individual account shows your legal name as the seller; an organization account shows the company's legal name instead. Apple doesn't accept a DBA or trade name, so this needs a real legal entity. In order: (1) pick the studio name; (2) form an LLC under that name, and ask about a state or registered-agent setup that keeps your name out of public filings; (3) EIN; (4) D-U-N-S number (free, can take a week or two); (5) the domain, with a public website and an email at it, which Apple checks; (6) enroll the organization ($99/year); (7) move the apps over with App Transfer or recreate their records. **Until then, don't release anything publicly**, because the first public release shows the seller name. Internal TestFlight is fine. 🧑
- [x] **Studio name: Little Summit Labs** (decided 2026-11-18; formerly Switchback Labs), with the summit mark (a mountain with the trail cut into it) on the indigo tile. No matches in the USPTO wordmark search or the Oklahoma business entity search. New brand kit and site in nmuschin/switchbacklabs#13. 🤝
- [ ] **Buy the domains:** `littlesummit.app` (the main one) and `littlesummitlabs.com` (redirects to it); both were available on 2026-11-13. Turn on WHOIS privacy. Then forward `hello@` to Gmail, point GitHub Pages at `littlesummit.app`, and update the site's `og:url` and `og:image` tags 🧑
- [ ] **Form Little Summit Labs LLC** in Oklahoma, with a registered agent so your home address stays off the filing, then the EIN and D-U-N-S number (steps in the developer-account item above) 🧑
- [x] Renamed the GitHub repo `switchbacklabs` to `littlesummitlabs` (2026-11-20). The site moved to https://nmuschin.github.io/littlesummitlabs/ and its link-preview tags now point there; links to the old repo name redirect 🧑
- [x] **App Store Connect records** for High Low Buffalo, QuoteBloom, Cite It Right, CellarStories and FuelTrack (as "FuelTrack: Gas & Mileage Log"), created 2026-11-10. They're on the individual account for now; see the item above. 🧑
- [ ] **The rest of the Apple paperwork:** the Developer ID certificate and `notarytool` profile (MarkdownDoctor). Do this on the organization account if it's ready, since the certificate carries the account's name. 🧑

## Tier 1 — Ship what's built (closest to the finish line)

### 1. High Low Buffalo (HLB) for iPhone
Web is live. iOS milestones I0–I6 and Phase 2 (Friends, History, Settings, Widget) are built, and the listing text was committed on Oct 29.
- [x] App Store Connect app record (2026-11-10) 🧑
- [x] Demo account for App Review: `review@highlowbuffaloapp.com` (forwards to Gmail), with a friend and shared days (2026-11-10). Check it still exists before each submission, because reviewers may test Delete account 🧑
- [x] First TestFlight upload (2026-11-10) 🧑
- [ ] App Review notes: delete account, report and block paths (draft in `PLAN-ios.md` §8) 🤝
- [ ] Screenshots + the privacy "nutrition label" (email, name, user content, no tracking) 🧑
- [ ] **Push notifications: fix the key, then test.** `APNS_KEY_ID` and `APNS_PRIVATE_KEY` are in Vercel, but the server can't read the key (`ERR_OSSL_UNSUPPORTED`): the paste lost its line breaks or gained quotation marks. Re-paste the `.p8` with its six lines intact, redeploy, then react to one of your days from the demo account. Optional: have the server accept any paste of the key 🤝
- [ ] **Open the app straight away on launch** (nmuschin/HighLowBuffalo#21): build it, run the tests, and check a launch after 10 idle minutes and one in Airplane Mode, then merge. Launch still felt slow from Xcode; check from the Home Screen or TestFlight 🧑
- [x] Icon: the same bison on a terracotta gradient tile (option 1, kept simple while the studio name may still change). Merged in nmuschin/HighLowBuffalo#20 on 2026-11-06 🤝
- [x] Check the new icon on your Mac: the in-app logo, the Home Screen app icon and the site's favicon (checked 2026-11-19) 🧑
- [ ] After iPhone v1.0 ships: **Android.** The plan is merged (`PLAN-android.md`, nmuschin/HighLowBuffalo#23). The shared contract and the Android backend (S0, A0) are built and tested in draft nmuschin/HighLowBuffalo#22, held so nothing changes on the server during the TestFlight beta. Then phases A1 onward (Kotlin + Compose; Android Studio is installed on your Mac as of 2026-11-20) 🤝

### 2. QuoteBloom
Everything for 1.0 is done except the listing.
- [x] App Store Connect record (2026-11-10) 🧑
- [ ] Screenshots (iPhone, iPad, Mac) 🧑
- [ ] Description, using the draft in `docs/app-store-listing.md` 🤝
- [x] CloudKit schema in Production (done 2026-11-08): `UserQuote` and `Favorite`, each with a QUERYABLE `recordName` index, which the app's fetch-all sync queries need 🧑
- [ ] Privacy policy page declaring CloudKit and local notifications: `/privacy/quotebloom.html` in littlesummitlabs#3 🤝
- [x] iCloud sync is more forgiving: unsent changes are queued and retried, errors show in Settings, and a missing record type no longer fails the sync. The same PR fixed favorites not redrawing on iOS and macOS. Merged in nmuschin/QuoteBloom#3, tested on both platforms 2026-11-08 🤝
- [ ] Optional, after launch: a Mac widget. The widget code already handles macOS; the target needs macOS added, the App Sandbox entitlement and the Mac runpath. 🤖

### 3. Cite It Right (Apple app)
All six phases are merged. Per the plan in nmuschin/CiteItRight#6, the phase 6 build passes its unit and UI tests and the barcode camera works on a real iPhone.
- [x] First build of phase 6 in Xcode (recorded in nmuschin/CiteItRight#6) 🤝
- [x] Test the live camera features on a real iPhone (recorded in nmuschin/CiteItRight#6) 🧑
- [ ] **Merge nmuschin/CiteItRight#6:** the App Store listing (English and Spanish), the Chrome Web Store listing with screenshots (English and Spanish), and the plan update. Check the listing lengths against App Store Connect's limits 🧑
- [x] Bundle ID and App Store Connect record (2026-11-10) 🧑
- [ ] TestFlight: App Privacy, uploads for iOS and Mac (`docs/testflight.md`) 🧑
- [ ] Submit the Safari/Chrome extension to the Chrome Web Store with the new listing, if you want it there 🧑

### 4. CellarStories
Web went live on Oct 20. The iOS app is feature-complete for 1.0.
- [ ] Import your real journal (`.winenote` → `/import`) and check scores and photos survive, and that re-imports don't duplicate 🧑
- [ ] Re-run the acceptance test live with a friend on a real phone 🧑
- [ ] Test CloudKit sync across iPhone ⇄ iPhone and iPhone ⇄ Mac 🧑
- [x] Deploy the CloudKit schema from Development to Production (done 2026-11-08) 🧑
- [x] App Store Connect record (2026-11-10) 🧑
- [ ] Submit iOS: screenshots, privacy policy URL, 17+ age rating (alcohol) 🧑
- [x] New app icon: a bottle whose label is an open notebook (nmuschin/CellarStories#3, 2026-11-19) 🤝
- [ ] Check the icon on your Mac: Icon Composer's Default, Dark and Mono previews, then the Home Screen and Dock 🧑

### 5. MarkdownDoctor (Mac)
All engineering for 1.0 is done. `Scripts/release.sh` archives, signs, notarizes and builds the DMG.
- [ ] Create a "Developer ID Application" certificate 🧑 *(has lead time)*
- [ ] Create a `notarytool` keychain profile (needs an app-specific password) 🧑
- [ ] App Store Connect record + name reservation, if you want the Mac App Store too 🧑
- [ ] Metadata: screenshots, description, keywords, support URL 🤝
- [ ] Pick where the notarized DMG is downloaded from (a GitHub Release, or a download link on the studio site) and add it to the app grid 🤝

### 6. FuelTrack
The 1.0 build settings, privacy manifest and validation are done.
- [x] Deploy the CloudKit schema from Development to Production (done 2026-11-08; `CD_Car` and `CD_FuelEntry`) 🧑
- [x] App Store Connect record created 2026-11-10 as **FuelTrack: Gas & Mileage Log**, because "FuelTrack" was taken. The name under the icon stays FuelTrack 🧑
- [ ] Check the receipt-scanning extraction and the CSV import (0.5 items) 🤝
- [ ] Add more receipt-parser test fixtures beyond the 3 "oncue_regular" cases 🤖
- [ ] Fix the first-launch slowness when moving from Log to Map or Stats on iOS 🤖
- [ ] Check `FuelTrack.icon` at every size and appearance 🧑
- [ ] Screenshots + listing metadata 🧑

## Tier 2 — Feature work on apps you're using

### 7. JobTrack (Mac, version 0.6 in progress)
- [ ] **Confirm the distribution channel:** the roadmap in nmuschin/JobTrack#2 records **Developer ID (direct download, notarized)**, which keeps the MCP helper. The Mac App Store would need a redesign. Confirm it's still your choice 🧑
- [ ] 0.6 polish: searchable text, help documentation, the toolbar margin TODO in `JobDetailView.swift`, two-pane layout for the views that show "No Job Selected", accessibility, Spanish to 100% 🤖
- [ ] Fix the broken `defaultsAreOpeningAndFourBeats` test (TODO in `JobTrackTests.swift`) 🤖
- [ ] Local notifications for follow-ups and interview dates 🤖
- [ ] Deploy the CloudKit schema to Production before shipping beyond your own Mac 🧑
- [ ] Per-job "why this score" view: built in nmuschin/JobTrack#2 with tests and Spanish strings. Build it, run the tests, check a scan-scored and a locally scored job, then merge 🧑
- [ ] 0.7 automation round-trip (skill, scheduled search, a discoverable sync folder) → 0.8 charts → 0.9 generalize for other users (remove the MSL-specific language) 🤝

### 8. DateGlow
- [ ] 0.6: App Group + shared store, a widget target, iOS and Mac widgets, widget deep links, tappable menu bar rows 🤖
- [ ] Fill in 0.7–1.0 (currently empty) and an App Store checklist like FuelTrack's 🤝
- [x] Deploy the CloudKit schema to Production (done 2026-11-08) 🧑

### 9. Bellwether (iPhone + Watch)
- [x] An app icon: a silent bell with haptic buzz marks, light, dark, tinted and watch (nmuschin/Bellwether#2, 2026-11-19) 🤝
- [ ] Check the icon on your Mac: Home Screen in Light, Dark and Tinted, and the watch app grid 🧑
- [ ] "Paste your bell schedule" import instead of adding periods one at a time 🤖
- [ ] Half-day and exam schedules that shift bell times 🤖
- [ ] Localize the bare "Weekdays" string 🤖
- [ ] Write a 1.0 / TestFlight checklist; there's no plan doc yet 🤖

### 10. Waymark Study (after the Tier 0 email fix)
- [ ] FSRS parameter optimization per user, once there are enough reviews 🤖
- [ ] Tier 4 nice-to-haves: cloze cards (which also unblocks cloze import from Anki), reverse cards, reminders, text-to-speech 🤖
- [ ] An iOS client (roadmap section "Toward an iOS client") 🤝

### 11. ClassroomDesigner
Every module in `PLAN.md`'s build order is built, and there's no open backlog.
- [ ] Try it with a real class or a teacher, and collect what's missing 🧑
- [ ] Link-preview image, once you share the production URL 🤖

### 12. Netmap (Mac + iPhone network scanner)
Phases 1–3 are written. The Swift package compiles and its tests pass (nmuschin/netmap#2), and **the Mac app runs on your network**: onboarding finds Home Assistant by its own announcement (#3), and the scanner is wired into both apps (#4). Phase 4 changed: **no nmap** (macOS blocks its unsigned installer); the built-in scanner went deeper instead. The plan is `docs/ROADMAP.md`. The work merged on 2026-11-19 and 20 (#5–#10) hasn't been compiled on a Mac yet.
- [x] Confirm the assumptions on your network (Home Assistant found by its announcement, on port 80 rather than 8123; nmuschin/netmap#3) 🧑
- [x] First build of the package: `swift build` and `swift test` pass (nmuschin/netmap#2, 2026-11-16) 🤝
- [x] Build and run the Mac app (nmuschin/netmap#3, #4) 🤝
- [x] Wire the scan screens into both apps' navigation (nmuschin/netmap#4) 🤖
- [x] README status: the package compiles and the Mac app runs (nmuschin/netmap#8, merged 2026-11-20) 🤖
- [x] Phase 4: built-in scanner depth instead of nmap: services identified from their replies, TLS certificates, ~150 ranked ports, several hosts at once, a native "Thorough scan" (nmuschin/netmap#5) 🤖
- [x] "Skip host discovery" (`-Pn`) now works in the built-in scanner (nmuschin/netmap#6), with a fix to the port-scan progress count (#9) 🤖
- [x] Roadmap 2: flag risky services in scan results (nmuschin/netmap#7) 🤖
- [x] Roadmap 3: a Bonjour browser for announced services (nmuschin/netmap#10) 🤖
- [ ] **Build the Mac app again** with #5–#10 in it, and fix what that turns up 🤝
- [ ] Build and run the iPhone app on a device 🧑
- [ ] iCloud setup per `docs/CLOUDKIT.md`: container ID, the queryable index, deploy the schema to Production, APNs environment 🧑
- [ ] Roadmap 4, watching websites alongside devices (with certificate-expiry warnings): built in nmuschin/netmap#11, open. Review, build and merge 🧑
- [ ] Roadmap 5: Shortcuts and Siri 🤖
- [ ] Phase 4, later: device names from Bonjour during a scan, and optionally a signed privileged helper for SYN scans and reading the ARP table 🤖
- [ ] App icons and asset catalogs 🤝
- [ ] Later: a headless watcher executable (`NetmapWatch` is already UI-free), the full IEEE vendor list instead of the seed `OUIDatabase`, and two-way device-settings sync 🤖

## Other repos

### diabetes-project
State variation in Medicaid GLP-1 use against diabetes burden. Not an app, so it's kept off the studio site. Steps 1–5 are merged (nmuschin/diabetes-project#2): burden data, the frozen GLP-1 product list, Medicare Part D and Medicaid drug data, the state-year panel, and the R models and figures. Step 6, the manuscript, is a first draft; step 7 is a medRxiv preprint. The full list is `manuscript/TODO.md`.
- [x] Decide the question, the data sources and the output; the pre-specified plan is `docs/ANALYSIS_PLAN.md` 🤝
- [ ] Review nmuschin/diabetes-project#3: the literature search and citations for the `[REF NEEDED]` places 🧑
- [ ] Verify the eight listed references against the originals, and add access dates for the CMS data 🧑
- [ ] Check the Arkansas explanation in the Discussion against CMS and state documentation, or delete it 🧑
- [ ] Reproduce the results on your machine with `R/05_models.R` and confirm they match Tables 2 and 3 🧑
- [ ] Author block and declarations: affiliation, ORCID, contributions, funding, conflicts of interest, AI-use statement and ethics determination 🧑
- [ ] Archive a release (for example on Zenodo) and cite the DOI; then post to medRxiv 🧑
- [ ] Should do: a published weight-management coverage list instead of the proxy, the quarterly sensitivity analysis, a methods read by a biostatistician, and trimming the abstract to the venue's limit 🤝

### Hardware builds (CAD Mouse MK2, Focus Dial)
Copies of Salim Benbouziyane's open hardware projects, unchanged so far (CC BY-NC-SA 4.0: fine for personal builds, but nothing made from them can be sold). Build guides are on Instructables, linked from each README.
- [ ] Decide whether and when to build them; nothing in the studio depends on them 🧑
- [ ] CAD Mouse MK2: order the PCB and parts from `bom/`, print the enclosure and spring (the README warns the PETG spring may wear out), flash the firmware with PlatformIO 🧑
- [ ] Focus Dial: build it, then point its webhook at your Home Assistant for the focus-mode scenes (the same Pi Netmap watches) 🤝

## Studio (Little Summit Labs)

- [ ] **Privacy policy and support pages.** Written in nmuschin/littlesummitlabs#3 (draft) for QuoteBloom, FuelTrack, DateGlow, Bellwether, MarkdownDoctor and CellarStories, plus `/support.html`. Waiting on a contact email to replace the `CONTACT_EMAIL` placeholder. They also need renaming from Switchback Labs to Little Summit Labs; once the domain is bought, `hello@littlesummit.app` is the natural contact address (your call). 🧑
- [ ] Add App Store and website links to the app grid as each app ships 🤖
- [x] Followed the repo rename everywhere else: a one-line `CLAUDE.md` fix in each of 13 repos, plus CodeAI's `CLAUDE.md` and scripts (nmuschin/CodeAI#5), merged 2026-11-22 🤖
- [ ] On your Mac, rename a local `switchbacklabs` clone folder to `littlesummitlabs`, so CodeAI's `render_app_icons.js` finds the Waymark Study icon 🧑
- [x] Branding round: icons for Bellwether (a silent bell with haptic buzz marks, nmuschin/Bellwether#2) and CellarStories (a bottle whose label is an open notebook, nmuschin/CellarStories#3), each in its own colour. Merged 2026-11-19; check them on your Mac 🤝
- [x] **Shared working preferences in every repo.** A short "Working preferences" section in each of the 14 repos' `CLAUDE.md`, pointing at the full version in nmuschin/CodeAI. Merged 2026-11-05. 🤖
- [ ] Delete the leftover branch `milestone/msl-personal` (JobTrack): everything on it is already on `main`, and with no PR it's deleted from the repo's Branches page (rechecked 2026-11-20). Branches with open PRs go once those merge. 🧑
- [x] Netmap's default branch renamed from `claude/confident-bohr-i73ycp` to `main` (2026-11-10) 🧑

---

## Plan to finish (week by week)

Rough times, assuming evenings and weekends. Each week ends with something shipped or submitted. If a week slips, push the whole plan back a week rather than starting the next app early.

**Where things stand (Nov 21):** week 1 is done apart from the domains, the LLC and the Developer ID certificate. Week 2 is partly done: HLB is on TestFlight with its demo account, but the push key, review notes and screenshots are still open, and so are QuoteBloom's screenshots and description. Week 3 didn't start, so from week 3 on **the plan moved back a week** (2026-11-21). Public releases wait for the organization account, so each app's "submit" step means **ready to submit** until then: TestFlight, screenshots and listing in place.

### Week 1 · Nov 5–8 · decisions and paperwork (~3 h)
1. ~~Waymark Study: set `MAIL_FROM` and `APP_URL` on the host~~ (already set).
2. ~~Decide the studio name~~ (Little Summit Labs, 2026-11-18). Buy `littlesummit.app` and `littlesummitlabs.com`, form the LLC and start the D-U-N-S request.
3. Apple paperwork: ~~App Store Connect records for HLB, QuoteBloom, Cite It Right, CellarStories and FuelTrack~~ (done 2026-11-10). Still to do: the Developer ID certificate and `notarytool` profile.
4. ~~Deploy CloudKit schemas to Production for QuoteBloom, FuelTrack, DateGlow and CellarStories~~ (all done 2026-11-08).

### Week 2 · Nov 9–15 · High Low Buffalo and QuoteBloom (~6 h)
Get each app ready to submit, but hold the public release until the organization account exists (see "Decide this week").
1. HLB: ~~TestFlight upload, demo account~~ (done); fix the push key, review notes, screenshots, ready to submit.
2. QuoteBloom: screenshots for iPhone, iPad and Mac, description from the draft, submit.
3. Studio: once the contact email is chosen, merge the privacy and support pages so both apps have their URLs.

### Week 3 · Nov 23–29 · Cite It Right and MarkdownDoctor (~6 h; Thanksgiving week)
Finish week 2's leftovers first if you can (HLB push key, QuoteBloom screenshots).
1. Cite It Right: ~~first phase-6 build in Xcode, camera test on a real iPhone~~ (done); merge #6, then TestFlight.
2. MarkdownDoctor: run `Scripts/release.sh`, publish the DMG, add it to the site. The Developer ID certificate carries the account's name, so do this on the organization account if it's ready.

### Week 4 · Nov 30–Dec 6 · CellarStories
1. Import your real journal, run the live acceptance test with a friend, test iCloud sync across devices.
2. Screenshots, 17+ age rating, submit.

### Week 5 · Dec 7–13 · FuelTrack
1. Check receipt scanning and CSV import, fix the slow first switch to Map or Stats, more parser test fixtures.
2. Check the icon at every size, screenshots, submit.

### From Dec 14 · feature work
JobTrack's distribution decision and 0.6 polish, DateGlow widgets, Bellwether's schedule import, and Netmap's Mac rebuild with #5–#11.

## App Store submission checklist (use for every app)

- [ ] Bundle ID registered, and the App Store Connect record created
- [ ] Version and build number bumped; export-compliance answer set (`ITSAppUsesNonExemptEncryption`)
- [ ] Privacy manifest (`PrivacyInfo.xcprivacy`) present in the app and each extension
- [ ] iCloud apps: CloudKit schema deployed to Production
- [ ] Privacy policy URL and support URL (the studio site's `/privacy/<app>.html` and `/support.html`)
- [ ] App Privacy "nutrition label" filled in, matching the privacy policy
- [ ] Age rating questionnaire
- [ ] Screenshots: the largest iPhone (6.9", 1320 × 2868), 13" iPad (2064 × 2752) if it runs on iPad, and a Mac size (such as 2880 × 1800) for Mac apps. Check App Store Connect for the current list.
- [ ] Name, subtitle, description, keywords, promotional text
- [ ] Apps with sign-in: a demo account and review notes explaining account deletion, reporting and blocking
- [ ] Archive, upload, test it yourself in TestFlight, then submit

## Tips for finishing on time

- **One app in flight at a time.** Finish its submission before starting the next; a half-submitted app costs more to pick back up than it saves.
- **Batch the same kind of work.** All App Store Connect records in one sitting, all screenshots in another. In the Simulator, `xcrun simctl io booted screenshot shot.png` saves a full-resolution screenshot.
- **Ask Claude for the text.** Listings, review notes and release notes can be drafted from each repo's README and docs; you edit and paste.
- **Keep this file current.** Tick items off as they land and print a fresh copy each week; it's the one list.
- **Expect one App Review round-trip.** First submissions are often rejected once for something small, like a missing demo account or a privacy-label mismatch. Leave a few days of slack before any date that matters.

## Quick reference

- Studio site: https://nmuschin.github.io/littlesummitlabs/ (brand page at `/brand.html`); repo `nmuschin/littlesummitlabs` (renamed from `switchbacklabs` on 2026-11-20)
- Live web apps: High Low Buffalo at https://www.highlowbuffaloapp.com, CellarStories at https://cellarstories.app, Cite It Right at https://citeitright.org
- Email (Resend, sending only): `updates.cellarstories.app`, `updates.waymarkstudy.com`, `highlowbuffaloapp.com`. `hello@highlowbuffaloapp.com` forwards to Gmail.
- iCloud apps that need a CloudKit schema in Production: JobTrack, Netmap. Done: QuoteBloom, FuelTrack, DateGlow, CellarStories. To check one: CloudKit Console → container → switch the P/D badge at the top → Schema → Record Types; Production should list the app's types, not just the built-in `Users`.
