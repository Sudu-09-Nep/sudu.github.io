---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
classes: has-section-hero
---

{% include base_path %}

<div class="section-hero">
  <h1 class="section-hero__title">Projects</h1>

  <div class="section-hero__filters">
    <span class="section-hero__label">Topics:</span>
    <a href="{{ '/projects/' | relative_url }}" class="section-hero__link is-active">
      All
    </a>
    {# optional future filters, similar to year-archive #}
  </div>
</div>

{% assign projects_collection = site.collections | where: "label", "projects" | first %}
{% if projects_collection %}
  {% assign all_projects = projects_collection.docs | sort: "date" | reverse %}

  <div class="kp-list">
  {% for project in all_projects %}
    <article class="kp-item">
      <a class="kp-item-image" href="{{ project.url | relative_url }}">
        {% if project.header.teaser %}
        <img src="{{ project.header.teaser | relative_url }}" alt="{{ project.title }}">
        {% endif %}
      </a>
      <div class="kp-item-body">
        {% if project.categories and project.categories.size > 0 %}
        <div class="kp-item-category">
          {{ project.categories | join: " / " }}
        </div>
        {% endif %}
        <h2 class="kp-item-title">
          <a href="{{ project.url | relative_url }}">{{ project.title }}</a>
        </h2>
        <p class="kp-item-meta">
          {% if project.date %}
          {{ project.date | date: "%B %d, %Y" }}
          {% endif %}
        </p>
        {% if project.excerpt %}
        <p class="kp-item-excerpt">
          {{ project.excerpt | strip_newlines | strip_html | truncate: 160 }}
        </p>
        {% endif %}
      </div>
    </article>
  {% endfor %}
  </div>
{% else %}
  <p>No projects found yet.</p>
{% endif %}
