---
layout: archive
title: Portfolio
permalink: /portfolio/
author_profile: true
classes: has-section-hero
---

{% include base_path %}

A visual **portfolio** of selected projects, pipelines, and analyses.

{% comment %}
If you later create a separate `portfolio` collection, switch `site.projects`
to `site.portfolio`. For now, we can reuse `site.projects`.
{% endcomment %}

{% include cards-grid.html items=site.projects %}
