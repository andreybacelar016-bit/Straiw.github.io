#!/usr/bin/env bash
set -euo pipefail

fail=0

check_contains() {
  local file="$1" pattern="$2" msg="$3"
  if ! rg -q "$pattern" "$file"; then
    echo "[ERRO] $msg ($file)"
    fail=1
  fi
}

check_not_contains() {
  local file="$1" pattern="$2" msg="$3"
  if rg -q "$pattern" "$file"; then
    echo "[ERRO] $msg ($file)"
    fail=1
  fi
}

# sitemap should use https://
check_contains sitemap.xml '<loc>https://Straiw.github.io/</loc>' 'URL raiz do sitemap inválida'

# core meta tags on homepage
check_contains index.html 'property="og:url" content="https://Straiw.github.io/"' 'og:url inválida na home'
check_contains index.html 'property="og:image" content="https://Straiw.github.io/logo.png"' 'og:image inválida na home'
check_contains index.html 'property="twitter:url" content="https://Straiw.github.io/"' 'twitter:url inválida na home'
check_contains index.html 'property="twitter:image" content="https://Straiw.github.io/logo.png"' 'twitter:image inválida na home'
check_contains index.html 'rel="canonical" href="https://Straiw.github.io/"' 'canonical inválida na home'

# footer consistency with README claim
for file in index.html moda.html maquiagem.html privacidade.html termos.html; do
  check_contains "$file" '<footer role="contentinfo">' 'Footer sem role=contentinfo'
done

if [[ "$fail" -ne 0 ]]; then
  echo "\nFalhou validação SEO/consistência."
  exit 1
fi

echo "Validação SEO/consistência: OK"
