# Morph website architecture

## Runtime shape

The website is static HTML, CSS, and JavaScript served directly by Cloudflare
Pages. There is no application server, client framework, package installation,
cookie, form submission, or runtime API request.

Public routes:

- `/` — Morph product continuation.
- `/privacy` — Morph app privacy notice.
- `/404.html` — custom not-found document.

Cloudflare Pages maps HTML files to extensionless routes and uses the top-level
`404.html` for unknown paths. `_redirects` canonicalizes `/privacy/`, while
`_headers` supplies the security, cache, language, and no-index policies.

## Design continuation

The homepage continues the expanded product-cell layout used by `kaizosha.org`:

- `assets/styles/markdown.css` provides the shared frame, grid, product cells, document pages, responsive behavior, and accessibility states.
- `assets/styles/brand.css` constructs the visible Kaizōsha mark from HTML and CSS.
- `assets/styles/product-continuation.css` adds a generic scrollable product-detail layer without product-specific selectors.
- `assets/scripts/product-continuation.js` applies the incoming Kaizōsha product
  slot during the initial document render and cleans the temporary URL state.
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

## Cloudflare Pages hosting

The repository root is the complete public site. Cloudflare Pages connects to
the Git repository with framework preset `None`, production branch `main`, no
build command, and build output directory `.`. A push to `main` publishes the
committed static files directly, including the social card and metadata.
