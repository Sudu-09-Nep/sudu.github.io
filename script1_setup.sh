#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# SCRIPT 1 of 3: Setup + Config + Layouts + Includes
# Run from: ~/website/sudu.github.io/
# ═══════════════════════════════════════════════════════════════
set -e
if [ ! -d "_posts" ] || [ ! -d "images" ]; then
    echo "❌ Run this from inside sudu.github.io/"
    echo "   cd ~/website/sudu.github.io && bash script1_setup.sh"
    exit 1
fi
echo "📁 Working in: $(pwd)"

echo ""; echo "═══ Removing old template files ═══"
rm -rf _layouts/ _includes/ _sass/
rm -f _config.yml _config_docker.yml
rm -f _data/navigation.yml
rm -f assets/css/main.css assets/css/main.scss assets/css/academicons.css assets/css/academicons.min.css assets/css/collapse.css
rm -rf assets/js/ assets/fonts/ assets/webfonts/
rm -f _pages/about.md _pages/year-archive.md _pages/year-archive.html _pages/projects.md _pages/portfolio.md _pages/404.md
rm -f _pages/category-nature.html _pages/category-reflection.html _pages/category-archive.html
rm -f _pages/archive-layout-with-content.md _pages/collection-archive.html _pages/page-archive.html
rm -f _pages/markdown.md _pages/non-menu-page.md _pages/sitemap.md _pages/publications.html
rm -f _pages/tag-archive.html _pages/talkmap.html _pages/talks.html _pages/teaching.html _pages/terms.md
echo "✅ Old files removed"

echo ""; echo "═══ Creating directories ═══"
mkdir -p _layouts _includes _pages _data assets/css
echo "✅ Directories ready"

echo ""; echo "═══ Writing _config.yml ═══"
cat > _config.yml << 'XEOF'
locale : "en-US"
title : "Sudarshan Aryal"
title_separator : "-"
name : &name "Sudarshan Aryal"
description : &description "Researcher · Writer · Scientist — Genomics, Bioinformatics & Science Writing"
url : "https://sudu-09-nep.github.io"
baseurl : "/sudu.github.io"
repository : "Sudu-09-Nep/sudu.github.io"
author:
  name : "Sudarshan Aryal"
  avatar : "https://sudu-09-nep.github.io/sudu.github.io/images/post.png"
  pronouns : "he/his"
  bio : "Undergraduate Bioscience and Biotechnology Student"
  location : "Gulmi, Nepal"
  uri : "https://sudu-09-nep.github.io/sudu.github.io/"
  email : "sudarshanaryal99@gmail.com"
  student : "Sri Sathya Sai Institute of Higher Learning"
  github : "Sudu-09-Nep"
  linkedin : "https://www.linkedin.com/in/sudarshan-aryal-94838a2a5/"
teaser :
breadcrumbs : false
words_per_minute: 160
future : true
read_more : "disabled"
talkmap_link : false
comments:
  provider :
atom_feed:
  hide : false
  path :
include:
  - .htaccess
  - _pages
  - files
exclude:
  - "*.sublime-project"
  - "*.sublime-workspace"
  - .asset-cache
  - .bundle
  - .github
  - .jekyll-assets-cache
  - .sass-cache
  - CHANGELOG
  - Capfile
  - config
  - Dockerfile
  - Gemfile
  - Gruntfile.js
  - gulpfile.js
  - LICENSE
  - local
  - log
  - node_modules
  - package.json*
  - Rakefile
  - README
  - tmp
  - vendor
  - "*.sh"
keep_files:
  - .git
  - .svn
encoding : "utf-8"
markdown_ext: "markdown,mkdown,mkdn,mkd,md"
markdown : kramdown
highlighter : rouge
lsi : false
excerpt_separator: "\n\n"
incremental : false
kramdown:
  input : GFM
  hard_wrap : false
  auto_ids : true
  footnote_nr : 1
  entity_output: as_char
  toc_levels : 1..6
  smart_quotes : lsquo,rsquo,ldquo,rdquo
  enable_coderay: false
collections:
  teaching:
    output : true
    permalink: /:collection/:path/
  publications:
    output : true
    permalink: /:collection/:path/
  portfolio:
    output : true
    permalink: /:collection/:path/
  talks:
    output : true
    permalink: /:collection/:path/
  projects:
    output : true
    permalink: /:collection/:path/
defaults:
  - scope:
      path: ""
      type: posts
    values:
      layout : post
      author_profile: true
      read_time : true
      comments : true
      share : true
      related : true
  - scope:
      path: ""
      type: pages
    values:
      layout : page
  - scope:
      path: ""
      type: portfolio
    values:
      layout : single
      author_profile: true
  - scope:
      path: ""
      type: projects
    values:
      layout : single
      author_profile: true
  - scope:
      path: ""
      type: teaching
    values:
      layout : single
      author_profile: true
  - scope:
      path: ""
      type: publications
    values:
      layout : single
      author_profile: true
  - scope:
      path: ""
      type: talks
    values:
      layout : single
      author_profile: true
sass:
  sass_dir: _sass
  style : compressed
permalink : /:categories/:title/
timezone : Etc/UTC
plugins:
  - jekyll-feed
  - jekyll-gist
  - jekyll-paginate
  - jekyll-sitemap
  - jekyll-redirect-from
  - jemoji
whitelist:
  - jekyll-feed
  - jekyll-gist
  - jekyll-paginate
  - jekyll-sitemap
  - jekyll-redirect-from
  - jemoji
category_archive:
  type: liquid
  path: /categories/
tag_archive:
  type: liquid
  path: /tags/
compress_html:
  clippings: all
  ignore:
    envs: development
XEOF
echo "✅ _config.yml"

echo "═══ Writing _data/navigation.yml ═══"
cat > _data/navigation.yml << 'XEOF'
main:
  - title: "Home"
    url: /
  - title: "About"
    url: /#about
  - title: "Projects"
    url: /projects/
  - title: "Blog"
    url: /year-archive/
  - title: "Portfolio"
    url: /portfolio/
  - title: "Contact"
    url: /#contact
XEOF
echo "✅ _data/navigation.yml"

echo ""; echo "═══ Writing _includes/ ═══"

cat > _includes/head.html << 'XEOF'
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{% if page.title %}{{ page.title }} – {% endif %}{{ site.title }}</title>
<meta name="description" content="{{ page.excerpt | default: site.description | strip_html | truncate: 160 }}">
<meta name="author" content="{{ site.author.name }}">
<meta property="og:title" content="{{ page.title | default: site.title }}">
<meta property="og:description" content="{{ page.excerpt | default: site.description | strip_html | truncate: 160 }}">
<meta property="og:type" content="website">
<meta property="og:url" content="{{ page.url | absolute_url }}">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Playfair+Display:wght@500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="{{ '/assets/css/style.css' | relative_url }}">
<link rel="icon" href="{{ '/images/favicon.ico' | relative_url }}">
<link rel="apple-touch-icon" href="{{ '/images/apple-touch-icon-180x180.png' | relative_url }}">
{% feed_meta %}
XEOF
echo "✅ _includes/head.html"

cat > _includes/nav.html << 'XEOF'
<nav class="nav" id="nav">
  <div class="nav-inner">
    <a href="{{ '/' | relative_url }}" class="nav-logo">Sudu<span>.</span></a>
    <ul class="nav-links">
      {% for item in site.data.navigation.main %}
        {% if item.title == "Contact" or item.title == "About" %}
          <li><a href="{{ item.url }}">{{ item.title }}</a></li>
        {% else %}
          <li><a href="{{ item.url | relative_url }}">{{ item.title }}</a></li>
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
    <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
  {% endfor %}
  <a href="{{ site.baseurl }}/files/Sudarshan_Resume.pdf" target="_blank" rel="noopener">Download CV</a>
</div>
XEOF
echo "✅ _includes/nav.html"

cat > _includes/footer.html << 'XEOF'
<footer class="footer">
  <div class="footer-inner">
    <div class="footer-left">
      <p>&copy; {{ 'now' | date: "%Y" }} {{ site.author.name }}. Built with care on <a href="https://pages.github.com" target="_blank" rel="noopener">GitHub Pages</a>.</p>
    </div>
    <div class="footer-social">
      <a href="https://github.com/{{ site.author.github }}" target="_blank" rel="noopener" aria-label="GitHub"><i class="fa-brands fa-github"></i></a>
      <a href="{{ site.author.linkedin }}" target="_blank" rel="noopener" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
      <a href="mailto:{{ site.author.email }}" aria-label="Email"><i class="fa-solid fa-envelope"></i></a>
    </div>
  </div>
</footer>
XEOF
echo "✅ _includes/footer.html"

cat > _includes/scripts.html << 'XEOF'
<script>
var nav=document.getElementById('nav');window.addEventListener('scroll',function(){nav.classList.toggle('scrolled',window.scrollY>20)});var sections=document.querySelectorAll('section[id], .section-alt section[id]');var navLinks=document.querySelectorAll('.nav-links a:not(.nav-cta)');function setActiveLink(){var c='';sections.forEach(function(s){if(window.scrollY>=s.offsetTop-120)c=s.getAttribute('id')});navLinks.forEach(function(l){l.classList.remove('active');if(l.getAttribute('href').endsWith('#'+c))l.classList.add('active')})}window.addEventListener('scroll',setActiveLink);var mobileToggle=document.getElementById('mobileToggle'),mobileMenu=document.getElementById('mobileMenu'),menuOpen=false;if(mobileToggle){mobileToggle.addEventListener('click',function(){menuOpen=!menuOpen;mobileMenu.classList.toggle('open',menuOpen);mobileToggle.innerHTML=menuOpen?'<i class="fa-solid fa-xmark"></i>':'<i class="fa-solid fa-bars"></i>'});mobileMenu.querySelectorAll('a').forEach(function(l){l.addEventListener('click',function(){menuOpen=false;mobileMenu.classList.remove('open');mobileToggle.innerHTML='<i class="fa-solid fa-bars"></i>'})})}var revealEls=document.querySelectorAll('.reveal');var revealObs=new IntersectionObserver(function(entries){entries.forEach(function(e){if(e.isIntersecting){e.target.classList.add('visible');revealObs.unobserve(e.target)}})},{threshold:0.12,rootMargin:'0px 0px -40px 0px'});revealEls.forEach(function(el){revealObs.observe(el)});function showToast(m){var t=document.getElementById('toast');if(!t)return;document.getElementById('toastMsg').textContent=m;t.classList.add('show');setTimeout(function(){t.classList.remove('show')},3500)}var cf=document.getElementById('contactForm');if(cf){cf.addEventListener('submit',function(e){e.preventDefault();showToast('Thanks, '+new FormData(this).get('name')+'! Message noted.');this.reset()})}window.addEventListener('resize',function(){if(window.innerWidth>640&&menuOpen){menuOpen=false;mobileMenu.classList.remove('open');mobileToggle.innerHTML='<i class="fa-solid fa-bars"></i>'}});
</script>
XEOF
echo "✅ _includes/scripts.html"

echo ""; echo "═══ Writing _layouts/ ═══"

cat > _layouts/default.html << 'XEOF'
<!DOCTYPE html>
<html lang="en">
<head>{% include head.html %}</head>
<body>
{% include nav.html %}
{{ content }}
{% include footer.html %}
<div class="toast" id="toast"><i class="fa-solid fa-check-circle"></i><span id="toastMsg">Done!</span></div>
{% include scripts.html %}
</body>
</html>
XEOF
echo "✅ _layouts/default.html"

cat > _layouts/home.html << 'XEOF'
<!DOCTYPE html>
<html lang="en">
<head>{% include head.html %}</head>
<body>
{% include nav.html %}
{{ content }}
{% include footer.html %}
<div class="toast" id="toast"><i class="fa-solid fa-check-circle"></i><span id="toastMsg">Done!</span></div>
{% include scripts.html %}
</body>
</html>
XEOF
echo "✅ _layouts/home.html"

cat > _layouts/page.html << 'XEOF'
---
layout: default
---
{{ content }}
XEOF
echo "✅ _layouts/page.html"

cat > _layouts/post.html << 'XEOF'
---
layout: default
---
<article class="post-page">
  {% if page.categories and page.categories.size > 0 %}
    <span class="post-cat">{{ page.categories | first }}</span>
  {% endif %}
  <h1>{{ page.title }}</h1>
  <div class="post-meta-bar">
    <span><i class="fa-regular fa-calendar"></i> {{ page.date | date: "%B %d, %Y" }}</span>
    {% assign words = content | number_of_words %}{% assign read_time = words | divided_by: 160 %}{% if read_time < 1 %}{% assign read_time = 1 %}{% endif %}
    <span><i class="fa-regular fa-clock"></i> {{ read_time }} min read</span>
    <span><i class="fa-solid fa-font"></i> {{ words }} words</span>
  </div>
  <div class="post-body">{{ content }}</div>
  {% if page.tags and page.tags.size > 0 %}
    <div class="post-tags">{% for tag in page.tags %}<span class="tag">#{{ tag }}</span>{% endfor %}</div>
  {% endif %}
</article>
XEOF
echo "✅ _layouts/post.html"

cat > _layouts/single.html << 'XEOF'
---
layout: default
---
<article class="single-page">
  <h1>{{ page.title }}</h1>
  {% if page.date %}
    <div class="post-meta-bar">
      <span><i class="fa-regular fa-calendar"></i> {{ page.date | date: "%B %d, %Y" }}</span>
      {% assign words = content | number_of_words %}{% assign read_time = words | divided_by: 160 %}{% if read_time < 1 %}{% assign read_time = 1 %}{% endif %}
      <span><i class="fa-regular fa-clock"></i> {{ read_time }} min read</span>
    </div>
  {% endif %}
  <div class="post-body">{{ content }}</div>
  {% if page.tags and page.tags.size > 0 %}
    <div class="post-tags">{% for tag in page.tags %}<span class="tag">#{{ tag }}</span>{% endfor %}</div>
  {% endif %}
</article>
XEOF
echo "✅ _layouts/single.html"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║ ✅ Script 1 DONE!                       ║"
echo "║ Now run: bash script2_pages.sh           ║"
echo "╚══════════════════════════════════════════╝"
