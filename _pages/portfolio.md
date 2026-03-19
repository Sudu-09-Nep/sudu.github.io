---
layout: archive
title: "Portfolio"
permalink: /portfolio/
author_profile: true
classes: has-section-hero
---

{% include base_path %}

<div class="section-hero">
  <h1 class="section-hero__title">Portfolio</h1>
</div>

{% assign portfolio_collection = site.collections | where: "label", "portfolio" | first %}

{% if portfolio_collection %}
  {% assign all_items = portfolio_collection.docs | sort: "date" | reverse %}

  <div class="kp-list">
  {% for item in all_items %}
    <article class="kp-item">
      <a class="kp-item-image" href="{{ item.url | relative_url }}">
        {% if item.header.teaser %}
        <img src="{{ item.header.teaser | relative_url }}" alt="{{ item.title }}">
        {% endif %}
      </a>
      <div class="kp-item-body">
        {% if item.categories and item.categories.size > 0 %}
        <div class="kp-item-category">
          {{ item.categories | join: " / " }}
        </div>
        {% endif %}
        <h2 class="kp-item-title">
          <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
        </h2>
        <p class="kp-item-meta">
          {% if item.date %}
          {{ item.date | date: "%B %d, %Y" }}
          {% endif %}
        </p>
        {% if item.excerpt %}
        <p class="kp-item-excerpt">
          {{ item.excerpt | strip_newlines | strip_html | truncate: 160 }}
        </p>
        {% endif %}
      </div>
    </article>
  {% endfor %}
  </div>
{% else %}
  <p>No portfolio items found yet.</p>
{% endif %}
