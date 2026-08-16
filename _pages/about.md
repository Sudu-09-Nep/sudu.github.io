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
      Student · Writer · Curious Human
    </div>
    <h1>Hi, I'm <span class="accent">Sudarshan</span></h1>
    <p class="hero-tagline">
      I study bioscience, write stories about nature and life, and spend a lot of time thinking about questions I don't have answers to yet. This site is where I keep it all.
    </p>
    <div class="hero-actions">
      <a href="{{ '/year-archive/' | relative_url }}" class="btn btn-primary">
        <i class="fa-solid fa-pen-nib"></i> Read My Stories
      </a>
      <a href="{{ '/projects/' | relative_url }}" class="btn btn-secondary">
        <i class="fa-solid fa-flask"></i> See My Work
      </a>
    </div>
    <div class="hero-meta">
      <div class="hero-meta-item">
        <i class="fa-solid fa-location-dot"></i> From Nepal
      </div>
      <div class="hero-meta-item">
        <i class="fa-solid fa-book-open"></i> Studying in India
      </div>
      <div class="hero-meta-item">
        <i class="fa-solid fa-music"></i> Learning music
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
      <h2 class="section-title">A bit about who I am</h2>
      <p class="section-subtitle">Still figuring things out — but here's what I know so far.</p>
    </div>
    <div class="about-grid">
      <div class="about-text reveal reveal-delay-1">
        <p>
          I'm <strong>Sudarshan Aryal</strong>, an undergraduate student from Gulmi, Nepal, currently studying Bioscience and Biotechnology at Sri Sathya Sai Institute of Higher Learning in India.
        </p>
        <p>
          In the academic side of things, I work on bioinformatics, writing pipelines, assembling genomes, and trying to make sense of biological data also a bit of wet lab stuffs. It's still early days, but I enjoy the process of learning by building things.
        </p>
        <p>
          Outside the lab, I write. Mostly about nature, reflections, and the small moments that make me stop and think. I am also into music- I'm very much a beginner, but it's one of the best parts of my day.
        </p>
        <p>
          This site is a place for all of it — the scientific work, the stories, and the things I'm still trying to understand.
        </p>
      </div>
      <div class="about-details reveal reveal-delay-2">
        <div class="detail-card">
          <div class="detail-card-header">
            <div class="detail-card-icon"><i class="fa-solid fa-graduation-cap"></i></div>
            <h4>Currently</h4>
          </div>
          <p>B.S. Bioscience & Biotechnology — Sri Sathya Sai Institute of Higher Learning</p>
        </div>
        <div class="detail-card">
          <div class="detail-card-header">
            <div class="detail-card-icon"><i class="fa-solid fa-pen-nib"></i></div>
            <h4>Writing</h4>
          </div>
          <p>Nature stories, Reflections, and the occasional essay about things I can't stop thinking about</p>
        </div>
        <div class="detail-card">
          <div class="detail-card-header">
            <div class="detail-card-icon"><i class="fa-solid fa-music"></i></div>
            <h4>Learning</h4>
          </div>
          <p>Music (beginner), still finding a way, but enjoys.</p>
        </div>
        <div class="detail-card">
          <div class="detail-card-header">
            <div class="detail-card-icon"><i class="fa-solid fa-heart"></i></div>
            <h4>Interested in</h4>
          </div>
          <div class="interest-tags">
            <span class="tag">Nature</span>
            <span class="tag">Science</span>
            <span class="tag">Writing</span>
            <span class="tag">Music</span>
            <span class="tag">Walks</span>
            <span class="tag">Good conversations</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<!-- ═══ Blog (auto-populated from _posts/) ═══ -->
<div>
  <section class="section" id="blog">
    <div class="reveal">
      <div class="section-label">Writing</div>
      <h2 class="section-title">Stories & Reflections</h2>
      <p class="section-subtitle">Things I've noticed, felt, or couldn't stop thinking about until I wrote them down.</p>
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

<!-- ═══ What I Work On (brief, links to Projects page) ═══ -->
<div class="section-alt">
  <section class="section" id="work">
    <div class="reveal">
      <div class="section-label">Academic Work</div>
      <h2 class="section-title">What I've been working on</h2>
      <p class="section-subtitle">Bioinformatics projects I've built as part of my learning. The details and code live on the projects page.</p>
    </div>
    <div class="projects-grid">
      <div class="project-card reveal reveal-delay-1">
        <div class="project-icon"><i class="fa-solid fa-dna"></i></div>
        <h3>HPV Genotyping Pipeline</h3>
        <p>A Nextflow pipeline for processing HPV sequencing data — my first attempt at building a reproducible bioinformatics workflow.</p>
        <a href="{{ '/projects/' | relative_url }}" class="project-link">
          See details <i class="fa-solid fa-arrow-right"></i>
        </a>
      </div>
      <div class="project-card reveal reveal-delay-2">
        <div class="project-icon"><i class="fa-solid fa-microscope"></i></div>
        <h3>Genome Assembly</h3>
        <p>Hybrid assembly of a bacterial genome using long and short reads. A lot of trial and error, but I learned a great deal.</p>
        <a href="{{ '/projects/' | relative_url }}" class="project-link">
          See details <i class="fa-solid fa-arrow-right"></i>
        </a>
      </div>
      <div class="project-card reveal reveal-delay-3">
        <div class="project-icon"><i class="fa-solid fa-code-branch"></i></div>
        <h3>Phylogenomics</h3>
        <p>Species identification from assembled genomes using 16S rRNA and BLAST. Built a Snakemake workflow to make it reproducible.</p>
        <a href="{{ '/projects/' | relative_url }}" class="project-link">
          See details <i class="fa-solid fa-arrow-right"></i>
        </a>
      </div>
    </div>
  </section>
</div>

<!-- ═══ CV Download ═══ -->
<section class="section cv-section" id="cv">
  <div class="reveal">
    <div class="cv-card">
      <i class="fa-solid fa-file-lines"></i>
      <h2>My CV</h2>
      <p>If you'd like to know more about my academic background, here's the formal version.</p>
      <a href="{{ site.baseurl }}/files/Sudarshan_Resume.pdf" class="btn-cv" id="cvBtn" target="_blank" rel="noopener">
        <i class="fa-solid fa-download"></i> Download CV (PDF)
      </a>
    </div>
  </div>
</section>

<!-- ═══ Contact ═══ -->
<section class="section" id="contact">
  <div class="reveal">
    <div class="section-label">Say Hello</div>
    <h2 class="section-title">Get in Touch</h2>
    <p class="section-subtitle">No formalities needed. If something here resonated with you, or you just want to talk about science, nature, or music — I'd love to hear from you.</p>
  </div>
  <div class="contact-grid">
    <div class="contact-info reveal reveal-delay-1">
      <h3>Where to find me</h3>
      <p>I check my email regularly and try to reply within a day or two. For anything casual, LinkedIn or GitHub works too.</p>
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
    <form class="contact-form reveal reveal-delay-2" id="contactForm" action="https://formspree.io/f/xeajlpzg" method="POST">
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
        <input type="text" id="subject" name="subject" placeholder="What's on your mind?">
      </div>
      <div class="form-group">
        <label for="message">Message</label>
        <textarea id="message" name="message" placeholder="Say anything..." required></textarea>
      </div>
      <button type="submit" class="btn btn-primary" style="align-self: flex-start;">
        <i class="fa-solid fa-paper-plane"></i> Send Message
      </button>
    </form>
  </div>
</section>
