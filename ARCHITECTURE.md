# Morph website architecture

## Runtime shape

The website is static HTML, CSS, and JavaScript with a small Cloudflare Worker in front of the asset binding. There is no application server, client framework, package installation, cookie, form submission, or runtime API request.

Public routes:

- `/` — Morph product continuation.
- `/privacy` — Morph app privacy notice.
- `/404.html` — custom not-found document.

The Worker canonicalizes `/index.html`, `/privacy.html`, and `/privacy/`. It accepts only `GET` and `HEAD`, attaches security and cache headers, and preserves the incoming Kaizōsha product slot on root requests such as `/?slot=bottom-left`.

## Design continuation

The homepage continues the expanded product-cell layout used by `kaizosha.org`:

- `assets/styles/markdown.css` provides the shared frame, grid, product cells, document pages, responsive behavior, and accessibility states.
- `assets/styles/brand.css` constructs the visible Kaizōsha mark from HTML and CSS.
- `assets/styles/product-continuation.css` adds a generic scrollable product-detail layer without product-specific selectors.
- `assets/scripts/product-continuation.js` preserves the source product slot for direct static previews. The Worker performs the equivalent transformation before HTML reaches a production browser.
- `assets/scripts/site-motion.js` provides pointer-responsive background-grid movement while respecting reduced-motion preferences.
- `assets/scripts/document-navigation.js` marks the current section on long documents.

The shared Kaizōsha raster icon is used only for favicon, Apple touch icon, web manifest, and metadata contexts. It is not visible page branding.

## Content boundaries

The product copy is based on the current Morph application architecture:

- iPhone and iPad Safari Web Extension targeting iOS and iPadOS 26 or later.
- Safe Mode for bounded visual and text changes.
- Agent Mode for validated, reversible DOM and layout edits without arbitrary generated JavaScript.
- Explicit Source Mode for allowlisted repositories on a trusted paired Mac.
- Codex Bridge, Apple Intelligence, local OpenAI-compatible, and cloud OpenAI-compatible provider paths.

Morph is in development. The website intentionally has no download, App Store, release, or public-source call to action.

## Privacy posture

The marketing site itself is self-contained and the Content Security Policy blocks network connections. The app privacy notice separately explains that Morph provider requests may leave the device depending on the provider a person configures. It must not be shortened to a blanket claim that all data always stays on device.

## Build and deployment

`tools/build-site.sh` copies the allowlisted source files to `dist/client` and the Worker to `dist/server/index.js`. The optional social card is copied only when present. `wrangler.jsonc` binds `dist/client` as `ASSETS` and runs the Worker first for redirects, slot continuation, and response headers.
