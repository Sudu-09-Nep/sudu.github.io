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

