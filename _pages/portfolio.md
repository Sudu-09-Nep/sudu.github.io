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

