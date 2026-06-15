#!/bin/bash
# ═══════════════════════════════════════════════════════
# FIX: About & Contact 404 error
# Run from: ~/website/sudu.github.io/
# ═══════════════════════════════════════════════════════
set -e

if [ ! -d "_posts" ]; then
    echo "❌ Run from inside sudu.github.io/"
    exit 1
fi

echo "Fixing navigation..."

# Fix 1: Update _includes/nav.html — make ALL links use relative_url properly
cat > _includes/nav.html << 'NAVEOF'
<nav class="nav" id="nav">
  <div class="nav-inner">
    <a href="{{ '/' | relative_url }}" class="nav-logo">Sudu<span>.</span></a>
    <ul class="nav-links">
      {% for item in site.data.navigation.main %}
        {% if item.url contains "#" %}
          <li><a href="{{ '/' | relative_url }}{{ item.hash }}" {% if page.url == item.url %}class="active"{% endif %}>{{ item.title }}</a></li>
        {% else %}
          <li><a href="{{ item.url | relative_url }}" {% if page.url == item.url %}class="active"{% endif %}>{{ item.title }}</a></li>
        {% endif %}
      {% endfor %}
      <li><a href="{{ site.baseurl }}/files/Sudarshan_Resume.pdf" class="nav-cta" target="_blank" rel="noopener"><i class="fa-solid fa-arrow-down"></i> CV</a></li>
    </ul>
    <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu">
      <i class="fa-solid fa-bars"></i>
    </button>
  </div>
</nav>
<div class="mobile-menu" id="mobileMenu">
  {% for item in site.data.navigation.main %}
    {% if item.url contains "#" %}
      <a href="{{ '/' | relative_url }}{{ item.hash }}">{{ item.title }}</a>
    {% else %}
      <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
    {% endif %}
  {% endfor %}
  <a href="{{ site.baseurl }}/files/Sudarshan_Resume.pdf" target="_blank" rel="noopener">Download CV</a>
</div>
NAVEOF
echo "✅ _includes/nav.html fixed"

# Fix 2: Update _data/navigation.yml — add hash field for anchor links
cat > _data/navigation.yml << 'NAVYMLEOF'
main:
  - title: "Home"
    url: /
  - title: "About"
    url: /#about
    hash: "#about"
  - title: "Projects"
    url: /projects/
  - title: "Blog"
    url: /year-archive/
  - title: "Portfolio"
    url: /portfolio/
  - title: "Contact"
    url: /#contact
    hash: "#contact"
NAVYMLEOF
echo "✅ _data/navigation.yml fixed"

# Commit and push
git add _includes/nav.html _data/navigation.yml
git commit -m "Fix: About & Contact nav links now work with baseurl"
git push origin master

echo ""
echo "╔══════════════════════════════════════╗"
echo "║ ✅ Fixed! Wait ~2 min, then test:   ║"
echo "║ - Click About from any page         ║"
echo "║ - Click Contact from any page       ║"
echo "╚══════════════════════════════════════╝"

