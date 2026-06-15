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

