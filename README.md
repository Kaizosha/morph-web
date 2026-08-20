# Morph website

The dependency-free static product website for Morph at `morph.kaizosha.org`.

Morph is an iPhone- and iPad-first Safari Web Extension for previewable, reversible webpage edits. The public site presents the product as in development and does not advertise a source repository or public download.

## Local preview

```sh
./tools/dev-server.py 5173
```

Open `http://127.0.0.1:5173`.

## Build

```sh
./tools/build-site.sh
```

The build creates:

- `dist/client/` — static files for the Cloudflare asset binding.
- `dist/server/index.js` — the Worker entrypoint.

Generated output is ignored by Git. The site has no package manager, runtime dependency, client framework, analytics, or external font request.

## Social preview

Root metadata expects `assets/media/social/morph-social-card.png` at 1200 × 630 pixels. The build copies that file when it exists and otherwise continues without it so the source tree can be prepared before the final card is installed.

## Cloudflare deployment

`wrangler.jsonc` points Cloudflare Workers at the generated Worker and static asset directory. Build first, deploy the Worker from this directory, then attach `morph.kaizosha.org` as its custom domain.

Production uses `main`. Feature branches can be used for review and preview deployments, but product websites should remain separate repositories rather than separate branches of one website repository.

## Shared design

`assets/styles/brand.css`, `assets/styles/markdown.css`, `assets/scripts/site-motion.js`, and `assets/scripts/document-navigation.js` use the Kaizōsha site grammar. `product-continuation.css` and `product-continuation.js` are product-neutral continuation layers that can be reused by sibling product sites.

The visible Kaizōsha mark is constructed from HTML and CSS. `icon.png` is reserved for favicon, Apple touch icon, manifest, and metadata use.
