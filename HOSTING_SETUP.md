# Free Hosting Setup

This version is designed for:

- `Vercel Hobby` for hosting
- `Supabase Free` for the shared database

## 1. Supabase

Open the SQL editor in your Supabase project and run:

- [supabase_schema.sql](/Users/janjakobsen/Documents/Codex/2026-04-20-files-mentioned-by-the-user-aerodrome/supabase_schema.sql)

Then copy these two values from your project settings:

- Project URL
- Anon public key

Paste them into:

- [config.js](/Users/janjakobsen/Documents/Codex/2026-04-20-files-mentioned-by-the-user-aerodrome/config.js)

## 2. Vercel

Deploy this folder as a static project.

Important files:

- [hosted_fuel_app.html](/Users/janjakobsen/Documents/Codex/2026-04-20-files-mentioned-by-the-user-aerodrome/hosted_fuel_app.html)
- [config.js](/Users/janjakobsen/Documents/Codex/2026-04-20-files-mentioned-by-the-user-aerodrome/config.js)
- [vercel.json](/Users/janjakobsen/Documents/Codex/2026-04-20-files-mentioned-by-the-user-aerodrome/vercel.json)

## Notes

- This app requires users to enter:
  - fuel before filling
  - fuel after filling
- The app calculates added litres automatically.
- Public users can add records and read records.
- Delete actions are intentionally not exposed in the hosted version.
