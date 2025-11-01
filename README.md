
Farcaster Punks — FINAL embed-ready static package
=================================================

THIS PACKAGE IS PREPARED TO MAKE YOUR MINI-APP APPEAR AS AN EMBED IN WARPCAST/BASE (NOT "OPEN URL").
Follow these exact steps BEFORE you register/preview in Warpcast or Base.

1) EDIT MANIFEST (CRITICAL)
   - Open .well-known/farcaster.json
   - Replace the three fields in accountAssociation with the exact signed values you obtained in Warpcast Domains tool:
     - header
     - payload
     - signature
   - DO NOT change any other keys or spacing.

2) DEPLOY TO VERCEL (OR ANY STATIC HOST)
   - Push this folder to GitHub and import to Vercel OR drag-and-drop to Vercel as a new project.
   - No build command required (static).
   - Ensure deployed root is exactly: https://fpp-sable.vercel.app/

3) VERIFY FILES & HEADERS (VERY IMPORTANT)
   - Run these checks locally (or in Termux / Git Bash):
     curl -I https://fpp-sable.vercel.app/.well-known/farcaster.json
     curl -I https://fpp-sable.vercel.app/
     curl https://fpp-sable.vercel.app/.well-known/farcaster.json | jq .
   - Expected results:
     - /.well-known/farcaster.json => HTTP 200, Content-Type: application/json
     - / => HTTP 200, Content-Type: text/html
     - Both endpoints should return headers:
         X-Frame-Options: ALLOWALL
         Content-Security-Policy: frame-ancestors https://warpcast.com https://*.warpcast.com https://base.dev https://*.base.dev 'self';
     - If any header is missing, add vercel.json to root (already included) and redeploy.

4) PREVIEW IN WARPCAST
   - In Warpcast -> Domains, add/check domain (without https, e.g. fpp-sable.vercel.app) and use the generated signed manifest there.
   - In Preview Mini App URL, enter the FULL URL with https: https://fpp-sable.vercel.app/ and click Preview.
   - If manifest header/payload/signature match and files/headers are correct, Warpcast will show embed (not Open URL).

5) COMMON MISTAKES (WHAT TO AVOID)
   - DO NOT add or remove whitespace/linebreaks inside accountAssociation fields.
   - DO NOT use a different homeUrl in the manifest than the actual deployed site.
   - DO NOT register a domain with protocol in Domains input (register domain as fpp-sable.vercel.app not https://...)
   - If Warpcast shows Open URL, re-check headers and accountAssociation exactness.

6) OPTIONAL: Add server relayer
   - For server-side minting (user doesn't pay gas), you need a relayer. This package is static-only. Ask me if you want relayer code.

7) QUICK DEBUG SHELL (verify.sh)
   - Make executable: chmod +x verify.sh
   - Run: ./verify.sh fpp-sable.vercel.app
   - It will show HTTP statuses and headers for root and manifest.

Good luck — deploy, run the verify checks, then paste the exact output of the three curl commands here if Warpcast still shows Open URL. I'll inspect immediately and fix anything left.
