# Little Summit Labs — combined to-do list

*This file is public on the studio site, like everything in this repo.*

Built on 2026-11-05 (last updated 2026-11-28: CellarStories' wine-club question decided and shipped (#8, #10), and #7 merged; netmap's port 53 found and fixed (#24). 2026-11-27: netmap's SYN scans checked on the Mac and #22–#23 merged; every repo rechecked; plan pushed back another week; netmap's roadmap finished (#11–#21); CellarStories' tasting guide and two open PRs; FairCarCompare (carcost) added. 2026-11-26: diabetes-project's Medicare prescriber pull merged and its items brought up to date. 2026-11-25: studio design system and shared Swift file added under Studio. 2026-11-22: repo-rename references fixed in every repo. 2026-11-21: every repo rechecked, nothing new merged; hardware builds added; plan pushed back a week. 2026-11-20: netmap's merged roadmap work and #11; Android Studio installed; branch clean-up; repo renamed littlesummitlabs. 2026-11-19: Bellwether and CellarStories icons. 2026-11-18: every repo reviewed again; studio renamed Little Summit Labs; HLB's first TestFlight upload; netmap's tests pass; diabetes-project's analysis and manuscript draft) from every connected repo's TODO.md, PLAN*.md, ROADMAP.md, README "next steps", docs and code comments. Open pull requests are listed with the item they belong to. Covers 17 repos; netmap and diabetes-project were added on 2026-11-05, the two hardware builds on 2026-11-21, and FairCarCompare (carcost) on 2026-11-27.

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
- [x] A tasting guide: an ⓘ beside every characteristic and score, a "How to taste" sheet in the app and a public `/guide` page on the web; Dry/Sweet moved to Characteristics. Merged in nmuschin/CellarStories#6 (2026-11-26) 🤖
- [x] Tappable tasting words under Aromas & Taste, ranked from your own past notes (no schema change). Merged in nmuschin/CellarStories#7 (2026-11-27) 🤝
- [x] **Where wine clubs live in the app — decided and built.** The design doc is
      nmuschin/CellarStories#8; you picked option 2 plus the join-code field, and it shipped in
      nmuschin/CellarStories#10 (2026-11-28). The Wine Club tab now says clubs live on the
      website, takes a join code and opens `/join?code=…`, and the same signpost sits at the
      foot of the comparison list. The `/join` page no longer drops the code when you're signed
      out — nor does the `/onboarding` claim step, which lost it the same way. 48/48 app tests
      after a clean rebuild, macOS builds, web 31/31 with typecheck and build clean, and the
      screen exercised in the Simulator. **Not checked:** the browser round trip against a
      running stack 🤝
- [ ] **Deploy the website before shipping an app build with the join-code field.** The app
      points at production, so if an app build goes out first, codes still get dropped at
      sign-in. No action while nothing is submitted; just don't ship them out of order 🧑
- [ ] **Full Supabase sign-in in the app (phase 3)** stays parked, gated on your own journal
      actually being in the website. See `docs/app-clubs-options.md` in CellarStories for the
      three options, the costs, and why four of the six Path to 1.0 items come first 🧑
- [ ] **Review and merge nmuschin/CellarStories#9:** a "would buy again" verdict. Open since 2026-11-27 🧑

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
The Mac app builds and runs on your network, now with a signed root helper that reads the ARP table (#18) and runs SYN scans of the local network (#21, fixed in #23). A Quick scan of the home network takes 8 seconds instead of 18, and port 53, which connect scans showed open on every host, turned out to be Little Snitch answering DNS connections for every address; connect scans now leave such ports out, with a note (#24). All five roadmap items are merged: built-in scanner depth instead of nmap, risky-service flags, a Bonjour browser, watched websites with certificate-expiry warnings (#11, #13, #15) and Shortcuts and Siri on iPhone (#14). The plan is `docs/ROADMAP.md`. The iPhone app still hasn't been run on a device.
- [x] Confirm the assumptions on your network (Home Assistant found by its announcement, on port 80 rather than 8123; nmuschin/netmap#3) 🧑
- [x] First build of the package: `swift build` and `swift test` pass (nmuschin/netmap#2, 2026-11-16) 🤝
- [x] Build and run the Mac app, then again with #5–#10, the root helper and SYN scans (nmuschin/netmap#3, #4, #18, #23; last run 2026-11-27) 🤝
- [x] Roadmap 1–3: built-in scanner depth instead of nmap (#5, #6, #9), risky-service flags (#7) and a Bonjour browser (#10) 🤖
- [x] Roadmap 4: watch websites alongside devices (#11), warn before a certificate expires (#13), and show certificates on the iPhone (#15). Merged 2026-11-25 🤖
- [x] Roadmap 5: Siri and Shortcuts actions on iPhone (nmuschin/netmap#14, 2026-11-25) 🤖
- [x] Name scanned devices by what they announce over Bonjour (nmuschin/netmap#16) 🤖
- [x] A signed root helper on the Mac that reads the ARP table, turned on in Settings › General › Hardware addresses (nmuschin/netmap#18, 2026-11-26) 🤝
- [x] The full IEEE vendor list bundled, about 40,000 prefixes; made-up Wi-Fi addresses show as "Private address" (nmuschin/netmap#19) 🤖
- [x] Saved scans described in plain words (nmuschin/netmap#20) 🤖
- [x] SYN scans of the local network through the helper, local addresses only, with a fallback to connect scans (nmuschin/netmap#21, merged 2026-11-27) 🤖
- [x] Check the SYN scan on your Mac. The first run hung in the helper and fell back to a connect scan; with #23 it finished: 43 hosts in about 8 seconds, 60 open ports, and the app used the helper's answer, per the helper's and the app's logs (2026-11-27) 🤝
- [x] Fix the build's concurrency and unused-result warnings, no behaviour change (nmuschin/netmap#22, merged 2026-11-27) 🤖
- [x] Stop SYN scans hanging in the helper: a read timeout on the capture device, a deadline, and logging of each step in the helper and the app (nmuschin/netmap#23, merged 2026-11-27) 🤝
- [x] Find what answers port 53 on every host in a connect scan: Little Snitch's network extension handles all DNS on the Mac. Connect scans now spot ports answered for every address and leave them out, with a note; SYN scans aren't affected (nmuschin/netmap#24, merged 2026-11-28) 🤝
- [ ] Build and run the iPhone app on a device 🧑
- [ ] iCloud setup per `docs/CLOUDKIT.md`: container ID, the queryable index, deploy the schema to Production, APNs environment 🧑
- [ ] Show the closed and filtered port counts the SYN scan already returns (left out of #21) 🤖
- [ ] Update the README's "Build status (Nov 16)" note, which predates the helper and SYN scans 🤖
- [ ] App icons and asset catalogs 🤝
- [ ] Later: an always-on watcher on the Pi or another always-on machine (`NetmapWatch` is already UI-free), so checks don't stop while the Mac sleeps; two-way device-settings sync 🤖

### 13. FairCarCompare (carcost; web)
A web app that picks a car buyer's top 3 vehicles by true monthly cost of ownership: loan or lease, insurance, fuel or charging, taxes, fees, maintenance and depreciation. Next.js on Vercel with Neon Postgres and a pure TypeScript cost engine. Web only for now: no Swift app unless there's traction. The plan is `PLAN.md`; started 2026-11-27.
- [x] MVP plan and name: **FairCarCompare**, short form FairCar (nmuschin/carcost#1) 🤝
- [x] Icon kit: three bars with a check on the cheapest, on a green gradient tile (nmuschin/carcost#2) 🤖
- [x] M0: the skeleton on Vercel and Neon, `/api/health`, CI (nmuschin/carcost#3, #4) 🤖
- [x] M1: the cost engine reproduces all 8 totals in the founding spreadsheet (nmuschin/carcost#5), and leases with Oklahoma's lease tax (#6) 🤖
- [ ] M1 leftovers: Oklahoma's registration discount for older cars, other states, calibrated depreciation and maintenance (placeholders now), and how Service Oklahoma treats a trade-in on a lease under HB 1183 🤖
- [ ] M2: the vehicle catalogue, an EPA and NHTSA import with the top ~300 models 🤖
- [ ] M3: the questionnaire and top-3 matcher; M4: the compare view and a shareable dealer sheet 🤖
- [ ] M5: 20–30 real car shoppers try it; M6: a first revenue test (a manual deal-check report and one or two affiliate links) 🤝
- [ ] Before launch: buy `faircarcompare.com` (and maybe `faircar.app`), search USPTO for "FairCar", rename the repo from `carcost`, and check the legal list in `PLAN.md` §9 (disclaimers, affiliate disclosure, a lawyer before paid leads) 🧑

## Other repos

### diabetes-project
State variation in Medicaid GLP-1 use against diabetes burden. Not an app, so it's kept off the studio site. Steps 1–5 are merged (nmuschin/diabetes-project#2): burden data, the frozen GLP-1 product list, Medicare Part D and Medicaid drug data, the state-year panel, and the R models and figures. Medicare Part D by state and prescriber specialty is merged too (nmuschin/diabetes-project#5). Step 6, the manuscript, is a first draft; nmuschin/diabetes-project#3 (open) adds the literature review. Step 7 is a medRxiv preprint. The full list is `manuscript/TODO.md`.
- [x] Decide the question, the data sources and the output; the pre-specified plan is `docs/ANALYSIS_PLAN.md` 🤝
- [x] Medicare Part D GLP-1 use by state, Oklahoma against the US, and prescriber specialty, 2019–2024: run against CMS with every check passing and merged in nmuschin/diabetes-project#5 (2026-11-25) 🤖
- [ ] Review and merge nmuschin/diabetes-project#3: the literature search, 24 references checked against PubMed and Crossref, and a rewritten Introduction and Discussion. It found the question was studied before (Do et al., *J Manag Care Spec Pharm* 2026, one year of claims), so the draft now says what this study adds instead of claiming to be first 🧑
- [ ] Read the two relevant papers that couldn't be opened, Dun et al. (*Diabetes Care* 2026) and Klebanoff et al. (*J Gen Intern Med* 2026), and revise if they change the picture 🧑
- [ ] Confirm three reference details #3 couldn't: the KFF brief's author, the ADA Standards section 9 wording behind the first paragraph, and PopHIVE's preferred citation 🧑
- [ ] Arkansas: cite a source for its expansion adults being covered through private plans (an Arkansas DHS ARHOME quarterly report is the likely one), or delete the sentence. #3 rewrote the passage and left this one `[REF NEEDED]` 🧑
- [ ] Reproduce the results on your machine with `R/05_models.R` and confirm they match Tables 2 and 3 🧑
- [ ] Author block and declarations: affiliation, ORCID, contributions, funding, conflicts of interest, AI-use statement and ethics determination 🧑
- [ ] Archive a release (for example on Zenodo) and cite the DOI; then post to medRxiv 🧑
- [ ] Add generic liraglutide to the frozen product list with a dated amendment: it first appears in 2024 and is kept but flagged in the Medicare prescriber pull 🤝
- [ ] Should do: a published weight-management coverage list instead of the proxy, the quarterly sensitivity analysis, a methods read by a biostatistician, and trimming to the venue's limits (with #3 the main text is about 3,050 words and the abstract about 360; JAMA Network Open allows 3,000 and 350) 🤝

### Hardware builds (CAD Mouse MK2, Focus Dial)
Copies of Salim Benbouziyane's open hardware projects, unchanged so far (CC BY-NC-SA 4.0: fine for personal builds, but nothing made from them can be sold). Build guides are on Instructables, linked from each README.
- [ ] Decide whether and when to build them; nothing in the studio depends on them 🧑
- [ ] CAD Mouse MK2: order the PCB and parts from `bom/`, print the enclosure and spring (the README warns the PETG spring may wear out), flash the firmware with PlatformIO 🧑
- [ ] Focus Dial: build it, then point its webhook at your Home Assistant for the focus-mode scenes (the same Pi Netmap watches) 🤝

## Studio (Little Summit Labs)

- [ ] **Privacy policy and support pages.** Written in nmuschin/littlesummitlabs#3 (draft) for QuoteBloom, FuelTrack, DateGlow, Bellwether, MarkdownDoctor and CellarStories, plus `/support.html`. Waiting on a contact email to replace the `CONTACT_EMAIL` placeholder. They also need renaming from Switchback Labs to Little Summit Labs; once the domain is bought, `hello@littlesummit.app` is the natural contact address (your call). 🧑
- [ ] Add App Store and website links to the app grid as each app ships 🤖
- [ ] Add FairCarCompare (carcost) to the repo table in CodeAI's `CLAUDE.md` 🤖
- [x] Followed the repo rename everywhere else: a one-line `CLAUDE.md` fix in each of 13 repos, plus CodeAI's `CLAUDE.md` and scripts (nmuschin/CodeAI#5), merged 2026-11-22 🤖
- [ ] On your Mac, rename a local `switchbacklabs` clone folder to `littlesummitlabs`, so CodeAI's `render_app_icons.js` finds the Waymark Study icon 🧑
- [x] Branding round: icons for Bellwether (a silent bell with haptic buzz marks, nmuschin/Bellwether#2) and CellarStories (a bottle whose label is an open notebook, nmuschin/CellarStories#3), each in its own colour. Merged 2026-11-19; check them on your Mac 🤝
- [x] **Studio design system** (colours, type, spacing, logos, app icons, website components and every app's accent colour), built from this repo and the app repos on 2026-11-20 and 23: https://claude.ai/artifact/JJkKeFpRHaozNpigMcTxut. Also merged in nmuschin/littlesummitlabs#18 on 2026-11-23: the shared Swift file `brand/swift/LittleSummit.swift` (studio colours with Dark Mode values, type styles, every app's accent) and a "Design system" section on `brand.html` linking both 🤖
- [ ] **Share the design system** from its page's Share menu (anyone with the link can view). Until then the "Open the design system" button on the public brand page doesn't open for visitors 🧑
- [x] **Built `LittleSummit.swift` in Xcode** and checked its `#Preview` (2026-11-25). Delete an app's old copy-pasted `littleSummit` colour snippet when you add it, or the two clash 🧑
- [x] **Accent colours from the icons** for Bellwether (teal `#137A7E`, dark and Watch `#30B4A3`, nmuschin/Bellwether#4) and CellarStories (wine `#8C2240`, dark `#D9668A`, a new default "Wine" choice, nmuschin/CellarStories#5), plus the Swift file. Checked on your Mac and merged 2026-11-25 🤝
- [x] **QuoteBloom accent:** the icon's purple (`#6E3EA6`, dark `#A47FD6`, nmuschin/QuoteBloom#5), plus the Swift file. Checked on your Mac and merged 2026-11-25 🤝
- [x] JobTrack, FuelTrack and DateGlow stay on the system accent (decided 2026-11-25) 🧑
- [x] **Shared working preferences in every repo.** A short "Working preferences" section in each of the 14 repos' `CLAUDE.md`, pointing at the full version in nmuschin/CodeAI. Merged 2026-11-05. 🤖
- [ ] Delete the leftover branch `milestone/msl-personal` (JobTrack): everything on it is already on `main`, and with no PR it's deleted from the repo's Branches page (rechecked 2026-11-20). Branches with open PRs go once those merge. 🧑
- [x] Netmap's default branch renamed from `claude/confident-bohr-i73ycp` to `main` (2026-11-10) 🧑

---

## Plan to finish (week by week)

Rough times, assuming evenings and weekends. Each week ends with something shipped or submitted. If a week slips, push the whole plan back a week rather than starting the next app early.

**Where things stand (Nov 27):** week 1 is done apart from the domains, the LLC and the Developer ID certificate. Week 2's leftovers are still open (HLB's push key, review notes and screenshots; QuoteBloom's screenshots and description), and week 3's apps (Cite It Right, MarkdownDoctor) haven't moved yet. This week's time went to the studio design system and app accents, Netmap's roadmap, CellarStories' tasting guide and starting FairCarCompare. So **the plan moved back another week** (2026-11-27): week 3 now starts Nov 30. Public releases wait for the organization account, so each app's "submit" step means **ready to submit** until then: TestFlight, screenshots and listing in place.

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

### Week 3 · Nov 30–Dec 6 · Cite It Right and MarkdownDoctor (~6 h)
Finish week 2's leftovers first if you can (HLB push key, QuoteBloom screenshots).
1. Cite It Right: ~~first phase-6 build in Xcode, camera test on a real iPhone~~ (done); merge #6, then TestFlight.
2. MarkdownDoctor: run `Scripts/release.sh`, publish the DMG, add it to the site. The Developer ID certificate carries the account's name, so do this on the organization account if it's ready.

### Week 4 · Dec 7–13 · CellarStories
1. Import your real journal, run the live acceptance test with a friend, test iCloud sync across devices.
2. Screenshots, 17+ age rating, submit.

### Week 5 · Dec 14–20 · FuelTrack
1. Check receipt scanning and CSV import, fix the slow first switch to Map or Stats, more parser test fixtures.
2. Check the icon at every size, screenshots, submit.

### From Dec 21 · feature work
JobTrack's distribution decision and 0.6 polish, DateGlow widgets, Bellwether's schedule import, Netmap's iPhone app and iCloud setup, and FairCarCompare's M2 catalogue.

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
