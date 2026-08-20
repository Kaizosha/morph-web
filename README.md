# Morph website

The dependency-free static product website for Morph at `morph.kaizosha.org`.

Morph is an iPhone- and iPad-first Safari Web Extension for previewable, reversible webpage edits. The public site presents the product as in development and does not advertise a source repository or public download.

## Local preview

```sh
./tools/dev-server.py 5173
```

Open `http://127.0.0.1:5173`.

The site has no package manager, runtime dependency, client framework,
analytics, external font request, generated output, or server process.

## Social preview

Root metadata references
`assets/media/social/morph-social-card.png` at 1200 × 630 pixels.

## Cloudflare Pages

The repository root is the deployable website. Connect this repository to a
Cloudflare Pages project with framework preset `None`, production branch
`main`, no build command, and build output directory `.`. Every push to `main`
publishes the committed static files directly; there is no generated output or
manual deployment command. Attach `morph.kaizosha.org` as the Pages custom
domain.

Production uses `main`. Feature branches can be used for review and preview deployments, but product websites should remain separate repositories rather than separate branches of one website repository.

## Shared design

`assets/styles/brand.css`, `assets/styles/markdown.css`, `assets/scripts/site-motion.js`, and `assets/scripts/document-navigation.js` use the Kaizōsha site grammar. `product-continuation.css` and `product-continuation.js` are product-neutral continuation layers that can be reused by sibling product sites.

The visible Kaizōsha mark is constructed from HTML and CSS. `icon.svg` keeps
its Japanese glyphs as real text for supporting browsers; `icon.png` is the
Apple touch, PWA, and metadata fallback.
