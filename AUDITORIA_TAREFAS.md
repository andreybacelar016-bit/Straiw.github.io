# Auditoria da base — status das correções

Este documento registra os problemas identificados anteriormente e o status atual após as correções aplicadas.

## 1) Erro de digitação no `sitemap.xml`
- **Problema anterior:** URL raiz malformada (`https:/`).
- **Status:** ✅ Corrigido para `https://Straiw.github.io/`.

## 2) Inconsistência de metadado social (`og:image`)
- **Problema anterior:** `og:image` apontava para domínio externo.
- **Status:** ✅ Corrigido para `https://Straiw.github.io/logo.png` na home.

## 3) Discrepância README vs implementação (`contentinfo`)
- **Problema anterior:** README declarava `role="contentinfo"`, mas os `<footer>` não tinham o atributo.
- **Status:** ✅ Corrigido com `role="contentinfo"` em todas as páginas HTML.

## 4) Melhoria de teste/validação
- **Problema anterior:** não existia checagem automatizada para SEO/consistência.
- **Status:** ✅ Adicionado script `scripts/check-seo.sh` para validar:
  - URL raiz do sitemap;
  - `canonical`, `og:url`, `og:image`, `twitter:url`, `twitter:image` da home;
  - `role="contentinfo"` nos footers.

## Como validar
```bash
./scripts/check-seo.sh
```
