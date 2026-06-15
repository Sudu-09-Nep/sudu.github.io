#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# SCRIPT 2 of 3: All Pages (_pages/)
# Run from: ~/website/sudu.github.io/
# ═══════════════════════════════════════════════════════════════
set -e
echo "═══ Writing _pages/ ═══"

# --- 404.md ---
cat > _pages/404.md << 'PAGE404EOF'
---
title: "Page Not Found"
layout: default
permalink: /404.html
---

<div class="error-page">
  <div class="error-code">404</div>
  <h2>Page not found</h2>
  <p>The page you're looking for doesn't exist or has been moved.</p>
  <a href="{{ '/' | relative_url }}" class="btn btn-primary"><i class="fa-solid fa-arrow-left"></i> Back to Home</a>
</div>

PAGE404EOF
echo "✅ _pages/404.md"

# --- year-archive.md ---
cat > _pages/year-archive.md << 'YAEOF'
---
title: "Blog"
layout: default
permalink: /year-archive/
---

<div class="page-hero">
  <h1>Blog</h1>
  <p>Reflections on nature, life, science, and things that don't have clear answers yet.</p>
  <div class="filter-tabs">
    <a href="{{ '/year-archive/' | relative_url }}" class="filter-tab active">All</a>
    <a href="{{ '/category/nature/' | relative_url }}" class="filter-tab">Nature</a>
    <a href="{{ '/category/reflection/' | relative_url }}" class="filter-tab">Reflection</a>
  </div>
</div>

<section class="section" style="padding-top: 40px;">
  <div class="blog-cards-grid">
    {% assign posts = site.posts | sort: "date" | reverse %}
    {% for post in posts %}
      <a href="{{ post.url | relative_url }}" class="blog-card-v reveal">
        {% if post.header.teaser %}
          <img class="card-img" src="{{ post.header.teaser | relative_url }}" alt="{{ post.title }}" loading="lazy">
        {% else %}
          <div class="card-img" style="background: linear-gradient(135deg, var(--accent-glow), var(--bg-subtle)); display:flex; align-items:center; justify-content:center;">
            <i class="fa-solid fa-pen-nib" style="font-size:2rem; color:var(--accent-light); opacity:0.4;"></i>
          </div>
        {% endif %}
        <div class="card-body">
          <div class="card-meta">
            {% if post.categories.size > 0 %}
              <span class="cat">{{ post.categories | first }}</span>
            {% endif %}
            <span><i class="fa-regular fa-calendar"></i> {{ post.date | date: "%b %d, %Y" }}</span>
            {% assign words = post.content | number_of_words %}
            {% assign rt = words | divided_by: 160 %}
            {% if rt < 1 %}{% assign rt = 1 %}{% endif %}
            <span><i class="fa-regular fa-clock"></i> {{ rt }} min</span>
          </div>
          <h3>{{ post.title }}</h3>
          <p class="excerpt">{{ post.excerpt | strip_html | truncate: 180 }}</p>
        </div>
      </a>
    {% endfor %}
  </div>
</section>

YAEOF
echo "✅ _pages/year-archive.md"

# --- portfolio.md ---
cat > _pages/portfolio.md << 'PORTEOF'
---
layout: default
title: "Portfolio"
permalink: /portfolio/
---

<div class="page-hero">
  <h1>Portfolio</h1>
  <p>Conferences, workshops, presentations, and hands-on training in bioscience and biotechnology.</p>
</div>

<section class="section" style="padding-top: 40px;">
  {% assign portfolio_collection = site.collections | where: "label", "portfolio" | first %}
  {% if portfolio_collection %}
    {% assign all_items = portfolio_collection.docs | sort: "date" | reverse %}
    <div class="portfolio-grid">
      {% for item in all_items %}
        <a href="{{ item.url | relative_url }}" class="portfolio-card reveal">
          <p class="port-date"><i class="fa-regular fa-calendar"></i> {{ item.date | date: "%B %d, %Y" }}</p>
          <h3>{{ item.title }}</h3>
          {% if item.excerpt %}
            <p class="port-excerpt">{{ item.excerpt | strip_html | truncate: 180 }}</p>
          {% endif %}
          {% if item.tags and item.tags.size > 0 %}
            <div class="port-tags">
              {% for tag in item.tags %}
                <span class="tool-tag">{{ tag }}</span>
              {% endfor %}
            </div>
          {% endif %}
        </a>
      {% endfor %}
    </div>
  {% else %}
    <p style="color: var(--text-light); text-align: center;">No portfolio items found yet.</p>
  {% endif %}
</section>

PORTEOF
echo "✅ _pages/portfolio.md"

# --- category-nature.html ---
cat > _pages/category-nature.html << 'CATNATEOF'
---
layout: default
title: "Nature Posts"
permalink: /category/nature/
---

<div class="page-hero">
  <h1>Nature</h1>
  <p>Stories about the natural world, wildlife, and our place within it.</p>
  <div class="filter-tabs">
    <a href="{{ '/year-archive/' | relative_url }}" class="filter-tab">All</a>
    <a href="{{ '/category/nature/' | relative_url }}" class="filter-tab active">Nature</a>
    <a href="{{ '/category/reflection/' | relative_url }}" class="filter-tab">Reflection</a>
  </div>
</div>

<section class="section" style="padding-top: 40px;">
  <div class="blog-cards-grid">
    {% assign posts = site.posts | sort: "date" | reverse %}
    {% for post in posts %}
      {% if post.categories contains "nature" %}
        <a href="{{ post.url | relative_url }}" class="blog-card-v reveal">
          {% if post.header.teaser %}
            <img class="card-img" src="{{ post.header.teaser | relative_url }}" alt="{{ post.title }}" loading="lazy">
          {% else %}
            <div class="card-img" style="background: linear-gradient(135deg, var(--accent-glow), var(--bg-subtle)); display:flex; align-items:center; justify-content:center;">
              <i class="fa-solid fa-leaf" style="font-size:2rem; color:var(--accent-light); opacity:0.4;"></i>
            </div>
          {% endif %}
          <div class="card-body">
            <div class="card-meta">
              <span class="cat">nature</span>
              <span><i class="fa-regular fa-calendar"></i> {{ post.date | date: "%b %d, %Y" }}</span>
              {% assign words = post.content | number_of_words %}
              {% assign rt = words | divided_by: 160 %}
              {% if rt < 1 %}{% assign rt = 1 %}{% endif %}
              <span><i class="fa-regular fa-clock"></i> {{ rt }} min</span>
            </div>
            <h3>{{ post.title }}</h3>
            <p class="excerpt">{{ post.excerpt | strip_html | truncate: 180 }}</p>
          </div>
        </a>
      {% endif %}
    {% endfor %}
  </div>
</section>

CATNATEOF
echo "✅ _pages/category-nature.html"

# --- category-reflection.html ---
cat > _pages/category-reflection.html << 'CATREFEOF'
---
layout: default
title: "Reflection Posts"
permalink: /category/reflection/
---

<div class="page-hero">
  <h1>Reflections</h1>
  <p>Personal thoughts on life, learning, and the moments that shape who we are.</p>
  <div class="filter-tabs">
    <a href="{{ '/year-archive/' | relative_url }}" class="filter-tab">All</a>
    <a href="{{ '/category/nature/' | relative_url }}" class="filter-tab">Nature</a>
    <a href="{{ '/category/reflection/' | relative_url }}" class="filter-tab active">Reflection</a>
  </div>
</div>

<section class="section" style="padding-top: 40px;">
  <div class="blog-cards-grid">
    {% assign posts = site.posts | sort: "date" | reverse %}
    {% for post in posts %}
      {% if post.categories contains "reflection" %}
        <a href="{{ post.url | relative_url }}" class="blog-card-v reveal">
          {% if post.header.teaser %}
            <img class="card-img" src="{{ post.header.teaser | relative_url }}" alt="{{ post.title }}" loading="lazy">
          {% else %}
            <div class="card-img" style="background: linear-gradient(135deg, var(--accent-glow), var(--bg-subtle)); display:flex; align-items:center; justify-content:center;">
              <i class="fa-solid fa-feather" style="font-size:2rem; color:var(--accent-light); opacity:0.4;"></i>
            </div>
          {% endif %}
          <div class="card-body">
            <div class="card-meta">
              <span class="cat">reflection</span>
              <span><i class="fa-regular fa-calendar"></i> {{ post.date | date: "%b %d, %Y" }}</span>
              {% assign words = post.content | number_of_words %}
              {% assign rt = words | divided_by: 160 %}
              {% if rt < 1 %}{% assign rt = 1 %}{% endif %}
              <span><i class="fa-regular fa-clock"></i> {{ rt }} min</span>
            </div>
            <h3>{{ post.title }}</h3>
            <p class="excerpt">{{ post.excerpt | strip_html | truncate: 180 }}</p>
          </div>
        </a>
      {% endif %}
    {% endfor %}
  </div>
</section>

CATREFEOF
echo "✅ _pages/category-reflection.html"

# --- projects.md ---
cat > _pages/projects.md << 'PROJEOF'
---
layout: default
title: "Projects"
permalink: /projects/
---

<div class="page-hero">
  <h1>Projects</h1>
  <p>Computational biology and bioinformatics research — from genome assembly to genotyping pipelines.</p>
</div>

<section class="section" style="padding-top: 40px;">
  <div class="reveal">
    <div class="section-label">GitHub Repositories</div>
    <h2 class="section-title">Research Projects</h2>
  </div>

  <div class="projects-grid" style="margin-top: 32px;">
    <div class="project-card reveal reveal-delay-1">
      <div class="project-icon"><i class="fa-solid fa-dna"></i></div>
      <h3>Karkinos HPV Genotyping Pipeline</h3>
      <p>Reproducible Nextflow-based workflow for HPV genotyping from NGS data — read QC, alignment to HPV reference genomes, mapping-quality filtering, and coverage analysis.</p>
      <div class="project-tools">
        <span class="tool-tag">Nextflow</span>
        <span class="tool-tag">fastp</span>
        <span class="tool-tag">BWA-MEM</span>
        <span class="tool-tag">SAMtools</span>
        <span class="tool-tag">MultiQC</span>
        <span class="tool-tag">Shell</span>
      </div>
      <a href="https://github.com/Sudu-09-Nep/hpv_genotype_detection" target="_blank" rel="noopener" class="project-link">View on GitHub <i class="fa-solid fa-arrow-right"></i></a>
    </div>

    <div class="project-card reveal reveal-delay-2">
      <div class="project-icon"><i class="fa-solid fa-microscope"></i></div>
      <h3>Hybrid Genome Assembly of <em>Brucella anthropi</em></h3>
      <p>Hybrid ONT + Illumina assembly achieving 99.5% BUSCO completeness (5.10 Mb, 5 contigs). Comprehensive annotation and AMR screening.</p>
      <div class="project-tools">
        <span class="tool-tag">Trycycler</span>
        <span class="tool-tag">Medaka</span>
        <span class="tool-tag">Polypolish</span>
        <span class="tool-tag">BUSCO</span>
        <span class="tool-tag">QUAST</span>
        <span class="tool-tag">Bakta</span>
        <span class="tool-tag">AMRFinderPlus</span>
      </div>
      <a href="https://github.com/Sudu-09-Nep/ont-illumina-hybrid-assembly" target="_blank" rel="noopener" class="project-link">View on GitHub <i class="fa-solid fa-arrow-right"></i></a>
      <br>
      <a href="{{ site.baseurl }}/files/Brucella_report.pdf" target="_blank" rel="noopener" class="project-link" style="margin-top:8px;"><i class="fa-solid fa-file-pdf"></i> Download Full Report <i class="fa-solid fa-arrow-right"></i></a>
    </div>

    <div class="project-card reveal reveal-delay-3">
      <div class="project-icon"><i class="fa-solid fa-code-branch"></i></div>
      <h3><em>Brucella</em> Phylogenomics & Species Identification</h3>
      <p>Reproducible Snakemake workflow for 16S rRNA extraction, BLAST-based species calling, and phylogenetic analysis from hybrid-assembled bacterial genomes.</p>
      <div class="project-tools">
        <span class="tool-tag">Snakemake</span>
        <span class="tool-tag">BLAST</span>
        <span class="tool-tag">Python</span>
        <span class="tool-tag">16S rRNA</span>
        <span class="tool-tag">Phylogenetics</span>
      </div>
      <a href="https://github.com/Sudu-09-Nep/Brucella_phylo" target="_blank" rel="noopener" class="project-link">View on GitHub <i class="fa-solid fa-arrow-right"></i></a>
    </div>
  </div>

  <!-- Auto-populated from _projects/ collection -->
  {% assign projects_collection = site.collections | where: "label", "projects" | first %}
  {% if projects_collection %}
    {% assign all_projects = projects_collection.docs | sort: "date" | reverse %}
    {% if all_projects.size > 0 %}
      <div class="reveal" style="margin-top: 64px;">
        <div class="section-label">Detailed Reports</div>
        <h2 class="section-title">Project Write-ups</h2>
      </div>
      <div class="projects-grid" style="margin-top: 32px;">
        {% for project in all_projects %}
          <div class="project-card reveal">
            <div class="project-icon"><i class="fa-solid fa-file-lines"></i></div>
            <h3>{{ project.title }}</h3>
            {% if project.excerpt %}
              <p>{{ project.excerpt | strip_html | truncate: 200 }}</p>
            {% endif %}
            {% if project.date %}
              <div style="font-size:0.8rem; color:var(--text-muted); margin-bottom:12px;">
                <i class="fa-regular fa-calendar"></i> {{ project.date | date: "%B %d, %Y" }}
              </div>
            {% endif %}
            <a href="{{ project.url | relative_url }}" class="project-link">Read more <i class="fa-solid fa-arrow-right"></i></a>
          </div>
        {% endfor %}
      </div>
    {% endif %}
  {% endif %}
</section>

PROJEOF
echo "✅ _pages/projects.md"

# --- about.md (HOMEPAGE) ---
cat > _pages/about.md << 'ABOUTEOF'
---
permalink: /
title: "Sudarshan Aryal"
layout: home
redirect_from:
  - /about/
  - /about.html
---

<!-- ═══ Hero ═══ -->
<section class="hero" id="home">
  <div class="hero-content">
    <div class="hero-badge">
      <i class="fa-solid fa-circle"></i>
      Researcher & Writer
    </div>
    <h1>Hi, I'm <span class="accent">Sudarshan</span></h1>
    <p class="hero-tagline">
      I'm a researcher who also writes about science, nature, and the questions that keep me curious. My work focuses on genomics, bioinformatics, and making complex biology accessible.
    </p>
    <div class="hero-actions">
      <a href="{{ '/projects/' | relative_url }}" class="btn btn-primary">
        <i class="fa-solid fa-flask"></i> View My Projects
      </a>
      <a href="{{ '/year-archive/' | relative_url }}" class="btn btn-secondary">
        <i class="fa-solid fa-pen-nib"></i> Read My Blog
      </a>
    </div>
    <div class="hero-meta">
      <div class="hero-meta-item">
        <i class="fa-solid fa-location-dot"></i> Nepal
      </div>
      <div class="hero-meta-item">
        <i class="fa-solid fa-dna"></i> Genomics & Bioinformatics
      </div>
      <div class="hero-meta-item">
        <i class="fa-brands fa-github"></i> Sudu-09-Nep
      </div>
    </div>
  </div>
  <div class="hero-photo">
    <div style="position: relative;">
      <div class="photo-decoration"></div>
      <div class="photo-frame">
        <img src="{{ '/images/post.png' | relative_url }}" alt="Sudarshan Aryal">
      </div>
    </div>
  </div>
</section>

<!-- ═══ About ═══ -->
<div class="section-alt">
  <section class="section" id="about">
    <div class="reveal">
      <div class="section-label">About Me</div>
      <h2 class="section-title">Bridging genomics and curiosity</h2>
      <p class="section-subtitle">Undergraduate researcher at Sri Sathya Sai Institute of Higher Learning, working at the intersection of computational biology and public health.</p>
    </div>
    <div class="about-grid">
      <div class="about-text reveal reveal-delay-1">
        <p>
          I'm <strong>Sudarshan Aryal</strong>, an undergraduate in Bioscience and Biotechnology, originally from Gulmi, Nepal. My research focuses on <strong>genomics, bioinformatics pipelines, and computational biology</strong> — from hybrid genome assembly to viral genotyping workflows.
        </p>
        <p>
          I've worked on projects including hybrid genome assembly of <em>Brucella anthropi</em> using ONT and Illumina sequencing, a Nextflow-based HPV genotyping pipeline, and phylogenomic analysis of bacterial genomes. I enjoy taking complex biological questions and building reproducible computational workflows to address them.
        </p>
        <p>
          Beyond the lab, I write about science in a way that's meant to be felt — not just cited. I believe the natural world tells stories worth listening to, and my blog is where those stories live alongside my scientific work.
        </p>
      </div>
      <div class="about-details reveal reveal-delay-2">
        <div class="detail-card">
          <div class="detail-card-header">
            <div class="detail-card-icon"><i class="fa-solid fa-graduation-cap"></i></div>
            <h4>Education</h4>
          </div>
          <p>B.Sc. Bioscience & Biotechnology — Sri Sathya Sai Institute of Higher Learning</p>
        </div>
        <div class="detail-card">
          <div class="detail-card-header">
            <div class="detail-card-icon"><i class="fa-solid fa-code"></i></div>
            <h4>Technical Skills</h4>
          </div>
          <div class="interest-tags">
            <span class="tag">Nextflow</span>
            <span class="tag">Snakemake</span>
            <span class="tag">Python</span>
            <span class="tag">Shell</span>
            <span class="tag">Linux</span>
            <span class="tag">Git</span>
          </div>
        </div>
        <div class="detail-card">
          <div class="detail-card-header">
            <div class="detail-card-icon"><i class="fa-solid fa-heart"></i></div>
            <h4>Broader Interests</h4>
          </div>
          <div class="interest-tags">
            <span class="tag">Science Communication</span>
            <span class="tag">Nature Writing</span>
            <span class="tag">Evolutionary Biology</span>
            <span class="tag">Open Science</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<!-- ═══ Projects (auto-populated from _projects/ + hardcoded GitHub repos) ═══ -->
<section class="section" id="projects">
  <div class="reveal">
    <div class="section-label">Research Projects</div>
    <h2 class="section-title">Genomics & Bioinformatics</h2>
    <p class="section-subtitle">Computational biology projects from genome assembly to genotyping pipelines.</p>
  </div>
  <div class="projects-grid">

    <div class="project-card reveal reveal-delay-1">
      <div class="project-icon"><i class="fa-solid fa-dna"></i></div>
      <h3>Karkinos HPV Genotyping Pipeline</h3>
      <p>Reproducible Nextflow-based workflow for HPV genotyping from NGS data — read QC, alignment, mapping-quality filtering, and coverage analysis.</p>
      <div class="project-tools">
        <span class="tool-tag">Nextflow</span>
        <span class="tool-tag">fastp</span>
        <span class="tool-tag">BWA-MEM</span>
        <span class="tool-tag">SAMtools</span>
        <span class="tool-tag">MultiQC</span>
      </div>
      <a href="https://github.com/Sudu-09-Nep/hpv_genotype_detection" target="_blank" rel="noopener" class="project-link">
        View on GitHub <i class="fa-solid fa-arrow-right"></i>
      </a>
    </div>

    <div class="project-card reveal reveal-delay-2">
      <div class="project-icon"><i class="fa-solid fa-microscope"></i></div>
      <h3>Hybrid Genome Assembly of <em>Brucella anthropi</em></h3>
      <p>Hybrid ONT + Illumina assembly achieving 99.5% BUSCO completeness. Included genome annotation and antimicrobial resistance screening.</p>
      <div class="project-tools">
        <span class="tool-tag">Trycycler</span>
        <span class="tool-tag">Medaka</span>
        <span class="tool-tag">Polypolish</span>
        <span class="tool-tag">BUSCO</span>
        <span class="tool-tag">Bakta</span>
      </div>
      <a href="https://github.com/Sudu-09-Nep/ont-illumina-hybrid-assembly" target="_blank" rel="noopener" class="project-link">
        View on GitHub <i class="fa-solid fa-arrow-right"></i>
      </a>
    </div>

    <div class="project-card reveal reveal-delay-3">
      <div class="project-icon"><i class="fa-solid fa-code-branch"></i></div>
      <h3><em>Brucella</em> Phylogenomics & Species ID</h3>
      <p>Snakemake workflow for 16S rRNA extraction, BLAST-based species calling, and phylogenetic analysis from hybrid-assembled genomes.</p>
      <div class="project-tools">
        <span class="tool-tag">Snakemake</span>
        <span class="tool-tag">BLAST</span>
        <span class="tool-tag">Python</span>
        <span class="tool-tag">16S rRNA</span>
      </div>
      <a href="https://github.com/Sudu-09-Nep/Brucella_phylo" target="_blank" rel="noopener" class="project-link">
        View on GitHub <i class="fa-solid fa-arrow-right"></i>
      </a>
    </div>

  </div>
</section>

<!-- ═══ Blog (auto-populated from _posts/) ═══ -->
<div class="section-alt">
  <section class="section" id="blog">
    <div class="reveal">
      <div class="section-label">Blog</div>
      <h2 class="section-title">Writing & Reflections</h2>
      <p class="section-subtitle">Thoughts on nature, life, science, and things that don't have clear answers yet.</p>
    </div>
    <div class="blog-grid">
      {% assign recent_posts = site.posts | sort: "date" | reverse %}
      {% for post in recent_posts limit:5 %}
        <a href="{{ post.url | relative_url }}" class="blog-card reveal {% cycle 'reveal-delay-1', 'reveal-delay-1', 'reveal-delay-2', 'reveal-delay-2', 'reveal-delay-3' %}">
          <div class="blog-card-content">
            <h3>{{ post.title }}</h3>
            <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
            <div class="blog-meta">
              {% if post.categories.size > 0 %}
                <span class="blog-category">{{ post.categories | first }}</span>
              {% endif %}
              <span class="blog-meta-item"><i class="fa-regular fa-calendar"></i> {{ post.date | date: "%b %d, %Y" }}</span>
              {% assign words = post.content | number_of_words %}
              {% assign rt = words | divided_by: 160 %}
              {% if rt < 1 %}{% assign rt = 1 %}{% endif %}
              <span class="blog-meta-item"><i class="fa-regular fa-clock"></i> {{ rt }} min read</span>
            </div>
          </div>
          <div class="blog-arrow"><i class="fa-solid fa-arrow-right"></i></div>
        </a>
      {% endfor %}
    </div>
  </section>
</div>

<!-- ═══ CV Download ═══ -->
<section class="section cv-section" id="cv">
  <div class="reveal">
    <div class="cv-card">
      <i class="fa-solid fa-file-lines"></i>
      <h2>Download My CV</h2>
      <p>Get a detailed overview of my education, research experience, skills, and academic involvement.</p>
      <a href="{{ site.baseurl }}/files/Sudarshan_Resume.pdf" class="btn-cv" id="cvBtn" target="_blank" rel="noopener">
        <i class="fa-solid fa-download"></i> Download CV (PDF)
      </a>
    </div>
  </div>
</section>

<!-- ═══ Contact ═══ -->
<section class="section" id="contact">
  <div class="reveal">
    <div class="section-label">Get in Touch</div>
    <h2 class="section-title">Let's Connect</h2>
    <p class="section-subtitle">Whether it's a research collaboration, a question about my work, or just a conversation about science — I'd be glad to hear from you.</p>
  </div>
  <div class="contact-grid">
    <div class="contact-info reveal reveal-delay-1">
      <h3>Reach out directly</h3>
      <p>I'm always open to discussing research ideas, bioinformatics workflows, potential collaborations, or interesting conversations about science and nature.</p>
      <div class="contact-links">
        <a href="mailto:{{ site.author.email }}" class="contact-link">
          <div class="contact-link-icon"><i class="fa-solid fa-envelope"></i></div>
          <div class="contact-link-text">
            <span>Email</span>
            <span>{{ site.author.email }}</span>
          </div>
        </a>
        <a href="https://github.com/{{ site.author.github }}" target="_blank" rel="noopener" class="contact-link">
          <div class="contact-link-icon"><i class="fa-brands fa-github"></i></div>
          <div class="contact-link-text">
            <span>GitHub</span>
            <span>{{ site.author.github }}</span>
          </div>
        </a>
        <a href="{{ site.author.linkedin }}" target="_blank" rel="noopener" class="contact-link">
          <div class="contact-link-icon"><i class="fa-brands fa-linkedin-in"></i></div>
          <div class="contact-link-text">
            <span>LinkedIn</span>
            <span>Connect with me</span>
          </div>
        </a>
      </div>
    </div>
    <form class="contact-form reveal reveal-delay-2" id="contactForm">
      <div class="form-row">
        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" id="name" name="name" placeholder="Your name" required>
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" placeholder="you@example.com" required>
        </div>
      </div>
      <div class="form-group">
        <label for="subject">Subject</label>
        <input type="text" id="subject" name="subject" placeholder="What's this about?">
      </div>
      <div class="form-group">
        <label for="message">Message</label>
        <textarea id="message" name="message" placeholder="Your message..." required></textarea>
      </div>
      <button type="submit" class="btn btn-primary" style="align-self: flex-start;">
        <i class="fa-solid fa-paper-plane"></i> Send Message
      </button>
    </form>
  </div>
</section>

ABOUTEOF
echo "✅ _pages/about.md (HOMEPAGE)"


echo ""
echo "╔══════════════════════════════════════════╗"
echo "║ ✅ Script 2 DONE!                       ║"
echo "║ Now run: bash script3_css.sh             ║"
echo "╚══════════════════════════════════════════╝"
