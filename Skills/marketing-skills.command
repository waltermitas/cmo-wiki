#!/bin/bash

clear

BOLD='\033[1m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${BOLD}  Marketing Skills — Installed for Claude Code${RESET}"
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

SKILLS=(
  "launch-strategy        | Plan a product or feature launch"
  "referral-program       | Build or optimize a referral program"
  "social-content         | Create and schedule social media content"
  "email-sequence         | Write email drip or waitlist sequences"
  "community-marketing    | Grow and leverage communities (peñas, groups)"
  "copywriting            | Write or rewrite marketing copy"
  "paid-ads               | Plan Google/Meta/X ad campaigns"
  "marketing-psychology   | Apply psychological principles to campaigns"
  "competitor-profiling   | Research and profile competitors"
  "pricing-strategy       | Pricing decisions and packaging"
  "content-strategy       | Plan a content calendar or strategy"
  "ad-creative            | Generate and iterate ad creatives"
  "cold-email             | Write B2B cold email sequences"
  "customer-research      | Conduct or synthesize customer research"
  "lead-magnets           | Create lead magnets for email capture"
  "marketing-ideas        | Brainstorm marketing ideas and strategies"
  "co-marketing           | Plan joint campaigns with partners"
  "sales-enablement       | Create pitch decks and sales collateral"
  "ab-test-setup          | Design and run A/B tests"
  "analytics-tracking     | Set up or audit analytics"
  "seo-audit              | Audit and fix SEO issues"
  "ai-seo                 | Optimize for AI search engines"
  "programmatic-seo       | Build SEO pages at scale"
  "page-cro               | Optimize landing page conversions"
  "signup-flow-cro        | Optimize signup and onboarding flow"
  "onboarding-cro         | Improve post-signup activation"
  "form-cro               | Optimize forms for conversion"
  "popup-cro              | Design popups and overlays"
  "paywall-upgrade-cro    | Build upgrade/paywall flows"
  "churn-prevention       | Reduce churn and cancellations"
  "revops                 | Revenue operations and lead lifecycle"
  "product-marketing-context | Set product marketing context for Claude"
  "free-tool-strategy     | Plan free tools as marketing assets"
  "directory-submissions  | Submit to startup and product directories"
  "site-architecture      | Plan website structure and navigation"
  "schema-markup          | Add structured data markup"
  "aso-audit              | Audit App Store listing"
  "competitor-alternatives| Build competitor comparison pages"
  "copy-editing           | Edit and improve existing copy"
  "image                  | Create or optimize marketing images"
  "video                  | Plan or produce video content"
)

i=1
for entry in "${SKILLS[@]}"; do
  name=$(echo "$entry" | cut -d'|' -f1 | xargs)
  desc=$(echo "$entry" | cut -d'|' -f2 | xargs)
  printf "  ${GREEN}%2d.${RESET} ${BOLD}%-35s${RESET} ${YELLOW}%s${RESET}\n" "$i" "/$name" "$desc"
  ((i++))
done

echo ""
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "  ${BOLD}41 skills installed${RESET} — use them in Claude Code by typing"
echo -e "  ${CYAN}/skill-name${RESET}  or invoking via the Skill tool"
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
read -p "  Press any key to close..." -n 1
