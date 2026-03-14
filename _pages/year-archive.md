---
title: "Blog posts"
layout: archive
permalink: /year-archive/
show_excerpts: false
author_profile: true
---

{% include base_path %}

<div class="section-hero">
  <h1 class="section-hero__title">Blog posts</h1>

  <div class="section-hero__filters">
    <span class="section-hero__label">Topics:</span>
    <a href="{{ '/year-archive/' | relative_url }}" class="section-hero__link is-active">
      All
    </a>
    <a href="{{ '/category/nature/' | relative_url }}" class="section-hero__link">
      Nature
    </a>
    <a href="{{ '/category/reflection/' | relative_url }}" class="section-hero__link">
      Reflection
    </a>
  </div>
</div>

{% assign posts = site.posts | sort: "date" | reverse %}

<div class="kp-list">
{% for post in posts %}
  <article class="kp-item">
    <a class="kp-item-image" href="{{ post.url | relative_url }}">
      {% if post.header.teaser %}
      <img src="{{ post.header.teaser | relative_url }}" alt="{{ post.title }}">
      {% endif %}
    </a>
    <div class="kp-item-body">
      {% if post.categories and post.categories.size > 0 %}
      <div class="kp-item-category">
        {{ post.categories | join: " / " }}
      </div>
      {% endif %}
      <h2 class="kp-item-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h2>
      <p class="kp-item-meta">
        {{ post.date | date: "%B %d, %Y" }}
      </p>
      {% if post.excerpt %}
      <p class="kp-item-excerpt">
        {{ post.excerpt | strip_newlines | strip_html | truncate: 160 }}
      </p>
      {% endif %}
    </div>
  </article>
{% endfor %}
</div>
