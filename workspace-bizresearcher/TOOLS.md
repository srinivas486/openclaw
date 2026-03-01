# TOOLS.md — BizResearcher

## Research Sources

- **ABN Lookup:** https://www.abn.business.gov.au
- **ASIC:** https://connectonline.asic.gov.au
- **Crunchbase:** https://www.crunchbase.com/organization/{slug}
- **LinkedIn company:** https://www.linkedin.com/company/{slug}
- **BuiltWith:** https://builtwith.com/{domain}
- **GitHub:** https://github.com/{org}
- **Glassdoor:** https://www.glassdoor.com.au/Overview/{slug}
- **Seek jobs:** https://www.seek.com.au/{company-name}-jobs (reveals tech stack via job ads)
- **Google News:** search `"{company name}" site:news.google.com`

## HTML Report Template — Skillfield Brand Colors

Use the **exact Skillfield brand palette** from skillfield.com.au:

| Variable       | Color     | Use                        |
|----------------|-----------|----------------------------|
| Primary accent | `#cd248b` | Headings, highlights, CTAs |
| Secondary      | `#348ec6` | Links, badges, icons       |
| Tertiary       | `#b152c7` | Gradients, accents         |
| Background     | `#0d0d0d` | Page background            |
| Card bg        | `#1f1f1f` | Card/panel backgrounds     |
| Dark mid       | `#111111` | Section backgrounds        |
| Text           | `#ffffff` | Body text                  |
| Muted text     | `#b0bcd4` | Secondary text             |
| Border         | `rgba(205,36,139,0.25)` | Card borders   |

Hero gradient: `linear-gradient(135deg, #0d0d0d 0%, #1a0a14 60%, #200d1a 100%)`
Button/badge gradient: `linear-gradient(135deg, #cd248b, #b152c7)`

## Skillfield Logo
The Skillfield logo PNG is saved at `/root/.openclaw/workspace-bizresearcher/skillfield-logo.png`.
Always embed it as a base64 data URI in the report header — never as an external URL.

```python
import base64
with open('/root/.openclaw/workspace-bizresearcher/skillfield-logo.png', 'rb') as f:
    logo_b64 = base64.b64encode(f.read()).decode()
logo_src = f"data:image/png;base64,{logo_b64}"
# Use as: <img src="{logo_src}" style="height:44px;width:auto;">
```

**After completing the HTML report, convert to PDF:**
`wkhtmltopdf --enable-local-file-access {slug}-research.html {slug}-research.pdf`
Copy both `.html` and `.pdf` to `/root/.openclaw/workspace/` for WhatsApp delivery.
