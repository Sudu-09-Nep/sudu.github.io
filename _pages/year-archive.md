---
title: "Blog posts"
layout: archive
permalink: /year-archive/
show_excerpts: false
author_profile: true
---

{% include base_path %}

Topics:  
[All]({{ '/year-archive/' | relative_url }}) [Nature]({{ '/category/nature/' | relative_url }}) [Reflection]({{ '/category/reflection/' | relative_url }})

<div class="kp-list">
{% assign posts = site.posts | sort: "date" | reverse %}
{% for post in posts %}
  <article class="kp-item">
    {% if post.image %}
    <a class="kp-item-image" href="{{ post.url | relative_url }}">
      <img src="{{ post.image | relative_url }}" alt="{{ post.title }}">
    </a>
    {% endif %}
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
