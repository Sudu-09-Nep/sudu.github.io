#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# SCRIPT 3 of 3: CSS + Update Posts + Git Push
# Run from: ~/website/sudu.github.io/
# ═══════════════════════════════════════════════════════════════
set -e
echo "═══ Writing assets/css/style.css ═══"
cat > assets/css/style.css << 'CSSEOF'
        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --accent: #0F766E;
            --accent-light: #14B8A6;
            --accent-dark: #0A5C56;
            --accent-glow: rgba(15, 118, 110, 0.12);
            --charcoal: #1E293B;
            --charcoal-light: #334155;
            --text: #334155;
            --text-light: #64748B;
            --text-muted: #94A3B8;
            --bg: #FFFFFF;
            --bg-warm: #F8FAFC;
            --bg-subtle: #F1F5F9;
            --border: #E2E8F0;
            --border-light: #F1F5F9;
            --card-shadow: 0 1px 3px rgba(0,0,0,0.04), 0 4px 12px rgba(0,0,0,0.04);
            --card-shadow-hover: 0 4px 12px rgba(0,0,0,0.06), 0 12px 32px rgba(0,0,0,0.08);
            --transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        html {
            scroll-behavior: smooth;
            scroll-padding-top: 80px;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            color: var(--text);
            background: var(--bg);
            line-height: 1.7;
            font-size: 16px;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        /* ─── Navigation ─── */
        .nav {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border-light);
            transition: var(--transition);
        }

        .nav.scrolled {
            box-shadow: 0 1px 8px rgba(0,0,0,0.04);
        }

        .nav-inner {
            max-width: 1120px;
            margin: 0 auto;
            padding: 0 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 68px;
        }

        .nav-logo {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 1.3rem;
            color: var(--charcoal);
            text-decoration: none;
            letter-spacing: -0.02em;
        }

        .nav-logo span {
            color: var(--accent);
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 8px;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-light);
            font-size: 0.875rem;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 8px;
            transition: var(--transition);
            position: relative;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: var(--accent);
            background: var(--accent-glow);
        }

        .nav-cta {
            background: var(--accent) !important;
            color: #fff !important;
            padding: 8px 20px !important;
            font-weight: 600 !important;
            border-radius: 8px !important;
        }

        .nav-cta:hover {
            background: var(--accent-dark) !important;
            transform: translateY(-1px);
        }

        .mobile-toggle {
            display: none;
            background: none;
            border: none;
            cursor: pointer;
            padding: 8px;
            color: var(--charcoal);
            font-size: 1.3rem;
        }

        .mobile-menu {
            display: none;
            position: fixed;
            top: 68px;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255,255,255,0.98);
            backdrop-filter: blur(20px);
            z-index: 999;
            padding: 32px 24px;
            flex-direction: column;
            gap: 4px;
        }

        .mobile-menu.open {
            display: flex;
        }

        .mobile-menu a {
            text-decoration: none;
            color: var(--charcoal);
            font-size: 1.1rem;
            font-weight: 500;
            padding: 16px 20px;
            border-radius: 12px;
            transition: var(--transition);
            display: block;
        }

        .mobile-menu a:hover {
            background: var(--accent-glow);
            color: var(--accent);
        }

        /* ─── Hero ─── */
        .hero {
            padding: 160px 24px 100px;
            max-width: 1120px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 320px;
            gap: 64px;
            align-items: center;
            min-height: 90vh;
        }

        .hero-content {
            opacity: 0;
            transform: translateY(30px);
            animation: fadeUp 0.8s ease forwards 0.2s;
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: var(--accent-glow);
            color: var(--accent);
            padding: 6px 16px;
            border-radius: 100px;
            font-size: 0.8rem;
            font-weight: 600;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            margin-bottom: 24px;
            border: 1px solid rgba(15, 118, 110, 0.15);
        }

        .hero-badge i {
            font-size: 0.65rem;
        }

        .hero h1 {
            font-family: 'Playfair Display', serif;
            font-size: clamp(2.8rem, 5.5vw, 4rem);
            font-weight: 700;
            color: var(--charcoal);
            line-height: 1.15;
            letter-spacing: -0.02em;
            margin-bottom: 20px;
        }

        .hero h1 .accent {
            color: var(--accent);
        }

        .hero-tagline {
            font-size: 1.2rem;
            color: var(--text-light);
            line-height: 1.7;
            max-width: 540px;
            margin-bottom: 36px;
            font-weight: 400;
        }

        .hero-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 48px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 28px;
            border-radius: 10px;
            font-size: 0.9rem;
            font-weight: 600;
            text-decoration: none;
            transition: var(--transition);
            cursor: pointer;
            border: none;
            font-family: inherit;
        }

        .btn-primary {
            background: var(--accent);
            color: #fff;
            box-shadow: 0 2px 8px rgba(15, 118, 110, 0.25);
        }

        .btn-primary:hover {
            background: var(--accent-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 16px rgba(15, 118, 110, 0.3);
        }

        .btn-secondary {
            background: var(--bg);
            color: var(--charcoal);
            border: 1.5px solid var(--border);
        }

        .btn-secondary:hover {
            border-color: var(--accent);
            color: var(--accent);
            background: var(--accent-glow);
        }

        .hero-meta {
            display: flex;
            align-items: center;
            gap: 28px;
            color: var(--text-muted);
            font-size: 0.85rem;
        }

        .hero-meta-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .hero-meta-item i {
            color: var(--accent-light);
            font-size: 0.9rem;
        }

        .hero-photo {
            opacity: 0;
            transform: translateY(30px);
            animation: fadeUp 0.8s ease forwards 0.5s;
            display: flex;
            justify-content: center;
        }

        .photo-frame {
            width: 280px;
            height: 340px;
            border-radius: 24px;
            overflow: hidden;
            position: relative;
            box-shadow: 0 8px 40px rgba(0,0,0,0.08), 0 2px 8px rgba(0,0,0,0.04);
            border: 3px solid #fff;
        }

        .photo-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .photo-placeholder {
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--accent-glow), var(--bg-subtle));
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--accent);
            gap: 12px;
        }

        .photo-placeholder i {
            font-size: 3rem;
            opacity: 0.5;
        }

        .photo-placeholder span {
            font-size: 0.8rem;
            font-weight: 500;
            opacity: 0.5;
        }

        .photo-decoration {
            position: absolute;
            width: 280px;
            height: 340px;
            border-radius: 24px;
            border: 2px solid var(--accent-light);
            opacity: 0.2;
            top: 16px;
            left: 16px;
            z-index: -1;
        }

        /* ─── Section Shared ─── */
        .section {
            padding: 100px 24px;
            max-width: 1120px;
            margin: 0 auto;
        }

        .section-label {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: var(--accent);
            font-size: 0.8rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            margin-bottom: 16px;
        }

        .section-label::before {
            content: '';
            width: 24px;
            height: 2px;
            background: var(--accent);
            border-radius: 2px;
        }

        .section-title {
            font-family: 'Playfair Display', serif;
            font-size: clamp(1.8rem, 3.5vw, 2.4rem);
            font-weight: 700;
            color: var(--charcoal);
            margin-bottom: 16px;
            letter-spacing: -0.02em;
            line-height: 1.2;
        }

        .section-subtitle {
            color: var(--text-light);
            font-size: 1.05rem;
            max-width: 580px;
            line-height: 1.7;
            margin-bottom: 48px;
        }

        .section-alt {
            background: var(--bg-warm);
        }

        .section-alt .section {
            /* nested within wrapper */
        }

        /* ─── About ─── */
        .about-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 64px;
            align-items: start;
        }

        .about-text p {
            margin-bottom: 20px;
            color: var(--text);
            font-size: 1.02rem;
            line-height: 1.8;
        }

        .about-text p strong {
            color: var(--charcoal);
            font-weight: 600;
        }

        .about-details {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .detail-card {
            background: #fff;
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 24px;
            transition: var(--transition);
        }

        .detail-card:hover {
            box-shadow: var(--card-shadow-hover);
            border-color: rgba(15, 118, 110, 0.2);
        }

        .detail-card-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
        }

        .detail-card-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: var(--accent-glow);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--accent);
            font-size: 0.95rem;
            flex-shrink: 0;
        }

        .detail-card-header h4 {
            font-size: 0.95rem;
            font-weight: 700;
            color: var(--charcoal);
        }

        .detail-card p {
            font-size: 0.9rem;
            color: var(--text-light);
            line-height: 1.6;
            padding-left: 52px;
        }

        .interest-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            padding-left: 52px;
        }

        .tag {
            padding: 5px 14px;
            background: var(--bg-subtle);
            color: var(--text-light);
            border-radius: 100px;
            font-size: 0.8rem;
            font-weight: 500;
            transition: var(--transition);
            border: 1px solid transparent;
        }

        .tag:hover {
            border-color: var(--accent-light);
            color: var(--accent);
            background: var(--accent-glow);
        }

        /* ─── Projects ─── */
        .projects-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .project-card {
            background: #fff;
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 32px 28px;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .project-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, var(--accent), var(--accent-light));
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.4s ease;
        }

        .project-card:hover::before {
            transform: scaleX(1);
        }

        .project-card:hover {
            box-shadow: var(--card-shadow-hover);
            border-color: rgba(15, 118, 110, 0.15);
            transform: translateY(-4px);
        }

        .project-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: var(--accent-glow);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--accent);
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .project-card h3 {
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--charcoal);
            margin-bottom: 12px;
            line-height: 1.35;
        }

        .project-card p {
            font-size: 0.9rem;
            color: var(--text-light);
            line-height: 1.65;
            margin-bottom: 20px;
            flex-grow: 1;
        }

        .project-tools {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            margin-bottom: 20px;
        }

        .tool-tag {
            padding: 3px 10px;
            background: var(--bg-subtle);
            color: var(--text-muted);
            border-radius: 6px;
            font-size: 0.75rem;
            font-weight: 500;
            font-family: 'SF Mono', 'Fira Code', monospace;
        }

        .project-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: var(--accent);
            font-size: 0.88rem;
            font-weight: 600;
            text-decoration: none;
            transition: var(--transition);
        }

        .project-link:hover {
            gap: 10px;
            color: var(--accent-dark);
        }

        .project-link i {
            font-size: 0.8rem;
            transition: var(--transition);
        }

        /* ─── Blog ─── */
        .blog-grid {
            display: grid;
            gap: 20px;
        }

        .blog-card {
            display: grid;
            grid-template-columns: 1fr auto;
            gap: 32px;
            align-items: center;
            padding: 28px 32px;
            background: #fff;
            border: 1px solid var(--border);
            border-radius: 14px;
            transition: var(--transition);
            text-decoration: none;
            color: inherit;
        }

        .blog-card:hover {
            box-shadow: var(--card-shadow-hover);
            border-color: rgba(15, 118, 110, 0.15);
            transform: translateX(4px);
        }

        .blog-card-content h3 {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--charcoal);
            margin-bottom: 8px;
            line-height: 1.4;
            transition: var(--transition);
        }

        .blog-card:hover .blog-card-content h3 {
            color: var(--accent);
        }

        .blog-card-content p {
            font-size: 0.9rem;
            color: var(--text-light);
            line-height: 1.6;
            margin-bottom: 12px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .blog-meta {
            display: flex;
            align-items: center;
            gap: 16px;
            font-size: 0.8rem;
            color: var(--text-muted);
        }

        .blog-meta-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .blog-meta-item i {
            font-size: 0.75rem;
        }

        .blog-category {
            padding: 4px 12px;
            background: var(--accent-glow);
            color: var(--accent);
            border-radius: 6px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .blog-arrow {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: var(--bg-subtle);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-muted);
            font-size: 0.85rem;
            transition: var(--transition);
            flex-shrink: 0;
        }

        .blog-card:hover .blog-arrow {
            background: var(--accent);
            color: #fff;
        }

        /* ─── CV Section ─── */
        .cv-section {
            text-align: center;
        }

        .cv-card {
            max-width: 600px;
            margin: 0 auto;
            background: linear-gradient(135deg, var(--charcoal) 0%, #0f172a 100%);
            border-radius: 24px;
            padding: 56px 48px;
            color: #fff;
            position: relative;
            overflow: hidden;
        }

        .cv-card::before {
            content: '';
            position: absolute;
            top: -60%;
            right: -20%;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: var(--accent);
            opacity: 0.08;
        }

        .cv-card::after {
            content: '';
            position: absolute;
            bottom: -40%;
            left: -10%;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: var(--accent-light);
            opacity: 0.06;
        }

        .cv-card > * {
            position: relative;
            z-index: 1;
        }

        .cv-card i {
            font-size: 2.5rem;
            color: var(--accent-light);
            margin-bottom: 24px;
        }

        .cv-card h2 {
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .cv-card p {
            color: rgba(255,255,255,0.6);
            font-size: 0.95rem;
            margin-bottom: 32px;
            line-height: 1.6;
        }

        .btn-cv {
            background: var(--accent-light);
            color: #fff;
            padding: 14px 36px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.95rem;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            transition: var(--transition);
            box-shadow: 0 4px 16px rgba(20, 184, 166, 0.3);
        }

        .btn-cv:hover {
            background: #0d9488;
            transform: translateY(-2px);
            box-shadow: 0 6px 24px rgba(20, 184, 166, 0.4);
        }

        /* ─── Contact ─── */
        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 48px;
        }

        .contact-info h3 {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--charcoal);
            margin-bottom: 16px;
        }

        .contact-info > p {
            color: var(--text-light);
            font-size: 0.95rem;
            line-height: 1.7;
            margin-bottom: 32px;
        }

        .contact-links {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .contact-link {
            display: flex;
            align-items: center;
            gap: 16px;
            text-decoration: none;
            color: var(--text);
            padding: 16px 20px;
            border-radius: 12px;
            border: 1px solid var(--border);
            transition: var(--transition);
        }

        .contact-link:hover {
            border-color: var(--accent-light);
            background: var(--accent-glow);
            color: var(--accent);
        }

        .contact-link-icon {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background: var(--bg-subtle);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--accent);
            font-size: 1.1rem;
            flex-shrink: 0;
            transition: var(--transition);
        }

        .contact-link:hover .contact-link-icon {
            background: var(--accent);
            color: #fff;
        }

        .contact-link-text {
            display: flex;
            flex-direction: column;
        }

        .contact-link-text span:first-child {
            font-size: 0.78rem;
            color: var(--text-muted);
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.04em;
        }

        .contact-link-text span:last-child {
            font-weight: 600;
            font-size: 0.95rem;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .form-group label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            color: var(--charcoal);
            margin-bottom: 6px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid var(--border);
            border-radius: 10px;
            font-size: 0.92rem;
            font-family: inherit;
            color: var(--charcoal);
            background: #fff;
            transition: var(--transition);
            outline: none;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px var(--accent-glow);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        /* ─── Footer ─── */
        .footer {
            border-top: 1px solid var(--border);
            padding: 48px 24px;
        }

        .footer-inner {
            max-width: 1120px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-left p {
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        .footer-left a {
            color: var(--accent);
            text-decoration: none;
        }

        .footer-social {
            display: flex;
            gap: 8px;
        }

        .footer-social a {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-muted);
            text-decoration: none;
            font-size: 0.9rem;
            transition: var(--transition);
        }

        .footer-social a:hover {
            border-color: var(--accent);
            color: var(--accent);
            background: var(--accent-glow);
        }

        /* ─── Scroll Animations ─── */
        .reveal {
            opacity: 0;
            transform: translateY(28px);
            transition: opacity 0.7s ease, transform 0.7s ease;
        }

        .reveal.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .reveal-delay-1 { transition-delay: 0.1s; }
        .reveal-delay-2 { transition-delay: 0.2s; }
        .reveal-delay-3 { transition-delay: 0.3s; }

        /* ─── Keyframes ─── */
        @keyframes fadeUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* ─── Toast ─── */
        .toast {
            position: fixed;
            bottom: 32px;
            right: 32px;
            background: var(--charcoal);
            color: #fff;
            padding: 14px 24px;
            border-radius: 12px;
            font-size: 0.9rem;
            font-weight: 500;
            box-shadow: 0 8px 32px rgba(0,0,0,0.2);
            transform: translateY(120%);
            transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            z-index: 2000;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .toast.show {
            transform: translateY(0);
        }

        .toast i {
            color: var(--accent-light);
        }

        /* ─── Responsive ─── */
        @media (max-width: 900px) {
            .hero {
                grid-template-columns: 1fr;
                gap: 48px;
                padding: 140px 24px 80px;
                text-align: center;
                min-height: auto;
            }

            .hero-tagline {
                margin-left: auto;
                margin-right: auto;
            }

            .hero-actions {
                justify-content: center;
            }

            .hero-meta {
                justify-content: center;
                flex-wrap: wrap;
            }

            .hero-photo {
                order: -1;
            }

            .photo-frame {
                width: 200px;
                height: 240px;
            }

            .photo-decoration {
                width: 200px;
                height: 240px;
            }

            .about-grid {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .projects-grid {
                grid-template-columns: 1fr;
                max-width: 500px;
                margin: 0 auto;
            }

            .blog-card {
                grid-template-columns: 1fr;
                gap: 16px;
            }

            .blog-arrow {
                align-self: flex-end;
            }

            .contact-grid {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .cv-card {
                padding: 40px 28px;
            }

            .footer-inner {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
        }

        @media (max-width: 640px) {
            .nav-links {
                display: none;
            }

            .mobile-toggle {
                display: block;
            }

            .hero h1 {
                font-size: 2.2rem;
            }

            .hero-tagline {
                font-size: 1.05rem;
            }

            .section {
                padding: 72px 20px;
            }

            .detail-card p,
            .interest-tags {
                padding-left: 0;
            }

            .blog-meta {
                flex-wrap: wrap;
                gap: 10px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            *, *::before, *::after {
                animation-duration: 0.01ms !important;
                transition-duration: 0.01ms !important;
            }
            html {
                scroll-behavior: auto;
            }
        }

/* ═══════════════════════════════════════════════
   INNER PAGE STYLES (Blog, Projects, Portfolio, Single)
   ═══════════════════════════════════════════════ */

/* ─── Page Hero / Header ─── */
.page-hero {
    padding: 140px 24px 56px;
    max-width: 1120px;
    margin: 0 auto;
}

.page-hero h1 {
    font-family: 'Playfair Display', serif;
    font-size: clamp(2rem, 4vw, 2.8rem);
    font-weight: 700;
    color: var(--charcoal);
    letter-spacing: -0.02em;
    margin-bottom: 12px;
}

.page-hero > p {
    font-size: 1.05rem;
    color: var(--text-light);
    max-width: 600px;
    line-height: 1.7;
}

/* ─── Filter Tabs ─── */
.filter-tabs {
    display: flex;
    gap: 8px;
    margin-top: 24px;
    flex-wrap: wrap;
}

.filter-tab {
    padding: 8px 20px;
    border-radius: 100px;
    font-size: 0.85rem;
    font-weight: 500;
    color: var(--text-light);
    background: var(--bg);
    border: 1px solid var(--border);
    text-decoration: none;
    transition: var(--transition);
}

.filter-tab:hover,
.filter-tab.active {
    background: var(--accent);
    color: #fff;
    border-color: var(--accent);
}

/* ─── Blog Grid (card style for index) ─── */
.blog-cards-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
    gap: 24px;
}

.blog-card-v {
    background: #fff;
    border: 1px solid var(--border);
    border-radius: 16px;
    overflow: hidden;
    transition: var(--transition);
    text-decoration: none;
    color: inherit;
    display: block;
}

.blog-card-v:hover {
    box-shadow: var(--card-shadow-hover);
    border-color: rgba(15, 118, 110, 0.15);
    transform: translateY(-4px);
}

.blog-card-v .card-img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    background: var(--bg-subtle);
}

.blog-card-v .card-body {
    padding: 24px;
}

.blog-card-v .card-body h3 {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--charcoal);
    margin-bottom: 8px;
    line-height: 1.4;
    transition: var(--transition);
}

.blog-card-v:hover .card-body h3 {
    color: var(--accent);
}

.blog-card-v .card-body .excerpt {
    font-size: 0.9rem;
    color: var(--text-light);
    line-height: 1.6;
    margin-bottom: 16px;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.blog-card-v .card-meta {
    display: flex;
    align-items: center;
    gap: 14px;
    flex-wrap: wrap;
    font-size: 0.8rem;
    color: var(--text-muted);
}

.blog-card-v .card-meta .cat {
    padding: 4px 12px;
    background: var(--accent-glow);
    color: var(--accent);
    border-radius: 6px;
    font-size: 0.72rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.03em;
}

/* ─── Single Post ─── */
.post-page {
    padding: 140px 24px 80px;
    max-width: 760px;
    margin: 0 auto;
}

.post-page .post-cat {
    display: inline-block;
    padding: 5px 14px;
    background: var(--accent-glow);
    color: var(--accent);
    border-radius: 6px;
    font-size: 0.75rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.04em;
    margin-bottom: 16px;
}

.post-page h1 {
    font-family: 'Playfair Display', serif;
    font-size: clamp(1.8rem, 4vw, 2.6rem);
    font-weight: 700;
    color: var(--charcoal);
    line-height: 1.2;
    margin-bottom: 16px;
    letter-spacing: -0.02em;
}

.post-meta-bar {
    display: flex;
    align-items: center;
    gap: 20px;
    color: var(--text-muted);
    font-size: 0.85rem;
    margin-bottom: 48px;
    padding-bottom: 32px;
    border-bottom: 1px solid var(--border-light);
    flex-wrap: wrap;
}

.post-meta-bar span {
    display: inline-flex;
    align-items: center;
    gap: 6px;
}

.post-meta-bar i {
    color: var(--accent-light);
    font-size: 0.8rem;
}

/* Post content typography */
.post-body h2 {
    font-family: 'Playfair Display', serif;
    font-size: 1.6rem;
    font-weight: 700;
    color: var(--charcoal);
    margin: 48px 0 16px;
    padding-top: 24px;
    border-top: 1px solid var(--border-light);
    letter-spacing: -0.01em;
}

.post-body h3 {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--charcoal);
    margin: 36px 0 12px;
}

.post-body p {
    margin-bottom: 20px;
    line-height: 1.85;
    color: var(--text);
    font-size: 1.02rem;
}

.post-body img {
    border-radius: 14px;
    margin: 32px 0;
    box-shadow: var(--card-shadow);
    max-width: 100%;
}

.post-body blockquote {
    border-left: 3px solid var(--accent);
    padding: 16px 24px;
    margin: 32px 0;
    background: var(--accent-glow);
    border-radius: 0 12px 12px 0;
    font-style: italic;
    color: var(--charcoal-light);
}

.post-body ul, .post-body ol {
    margin: 16px 0 20px 24px;
    line-height: 1.85;
    color: var(--text);
}

.post-body li {
    margin-bottom: 8px;
}

.post-body code {
    background: var(--bg-subtle);
    padding: 2px 8px;
    border-radius: 6px;
    font-size: 0.88em;
    font-family: 'SF Mono', 'Fira Code', monospace;
    color: var(--accent-dark);
}

.post-body pre {
    background: var(--charcoal);
    color: #e2e8f0;
    padding: 24px;
    border-radius: 14px;
    overflow-x: auto;
    margin: 24px 0;
    line-height: 1.6;
    font-size: 0.88rem;
}

.post-body pre code {
    background: none;
    padding: 0;
    color: inherit;
}

.post-body em {
    color: var(--charcoal-light);
}

.post-body strong {
    color: var(--charcoal);
    font-weight: 600;
}

/* Post tags */
.post-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-top: 48px;
    padding-top: 24px;
    border-top: 1px solid var(--border);
}

.post-tags .tag {
    padding: 5px 14px;
    background: var(--bg-subtle);
    color: var(--text-muted);
    border-radius: 100px;
    font-size: 0.8rem;
    font-weight: 500;
}

/* ─── Portfolio Cards ─── */
.portfolio-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
    gap: 24px;
}

.portfolio-card {
    background: #fff;
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 32px 28px;
    transition: var(--transition);
    text-decoration: none;
    color: inherit;
    display: block;
}

.portfolio-card:hover {
    box-shadow: var(--card-shadow-hover);
    border-color: rgba(15, 118, 110, 0.15);
    transform: translateY(-4px);
}

.portfolio-card .port-date {
    font-size: 0.8rem;
    color: var(--text-muted);
    margin-bottom: 8px;
}

.portfolio-card h3 {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--charcoal);
    margin-bottom: 12px;
    line-height: 1.35;
    transition: var(--transition);
}

.portfolio-card:hover h3 {
    color: var(--accent);
}

.portfolio-card .port-excerpt {
    font-size: 0.9rem;
    color: var(--text-light);
    line-height: 1.65;
    margin-bottom: 16px;
}

.portfolio-card .port-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 6px;
}

/* ─── Single / Generic Pages ─── */
.single-page {
    padding: 140px 24px 80px;
    max-width: 800px;
    margin: 0 auto;
}

.single-page h1 {
    font-family: 'Playfair Display', serif;
    font-size: clamp(1.8rem, 4vw, 2.4rem);
    font-weight: 700;
    color: var(--charcoal);
    margin-bottom: 16px;
    letter-spacing: -0.02em;
}

.single-page .post-body {
    margin-top: 32px;
}

/* ─── 404 ─── */
.error-page {
    padding: 180px 24px 100px;
    text-align: center;
    max-width: 600px;
    margin: 0 auto;
}

.error-page .error-code {
    font-family: 'Playfair Display', serif;
    font-size: 8rem;
    font-weight: 700;
    color: var(--accent);
    line-height: 1;
    margin-bottom: 16px;
}

.error-page h2 {
    font-size: 1.5rem;
    color: var(--charcoal);
    margin-bottom: 12px;
}

.error-page p {
    color: var(--text-light);
    margin-bottom: 32px;
}

/* ─── Responsive additions ─── */
@media (max-width: 768px) {
    .blog-cards-grid,
    .portfolio-grid {
        grid-template-columns: 1fr;
    }
    .page-hero {
        padding: 120px 20px 40px;
    }
    .post-page,
    .single-page {
        padding: 120px 20px 60px;
    }
}

@media print {
    .nav, .footer, .mobile-menu, .toast, .btn { display: none; }
    body { font-size: 12pt; }
    .post-page, .single-page { padding: 0; max-width: 100%; }
}
CSSEOF
echo "✅ assets/css/style.css (1554 lines)"

echo ""
echo "═══ Updating blog post layouts ═══"
cd _posts
for f in *.md; do
    if [ -f "$f" ]; then
        if grep -q "layout: single" "$f" 2>/dev/null; then
            sed -i '' 's/layout: single/layout: post/' "$f"
            echo "  ✅ Updated: $f"
        else
            echo "  ⏭  OK: $f"
        fi
    fi
done
cd ..
echo "✅ Blog posts updated"

echo ""
echo "═══ Final check ═══"
echo "Files created:"
ls -la _config.yml
ls -la _data/navigation.yml
echo "--- _includes/ ---"
ls _includes/
echo "--- _layouts/ ---"
ls _layouts/
echo "--- _pages/ ---"
ls _pages/
echo "--- assets/css/ ---"
ls assets/css/
echo ""
echo "Content preserved:"
echo "  _posts/: $(ls _posts/*.md 2>/dev/null | wc -l) posts"
echo "  _projects/: $(ls _projects/*.md 2>/dev/null | wc -l) projects"
echo "  _portfolio/: $(ls _portfolio/*.md _portfolio/*.html 2>/dev/null | wc -l) items"
echo "  images/: $(find images -type f 2>/dev/null | wc -l) files"
echo "  files/: $(ls files/ 2>/dev/null | wc -l) files"

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║ ✅ ALL 3 SCRIPTS COMPLETE!                      ║"
echo "║                                                  ║"
echo "║ Now run these git commands:                      ║"
echo "║                                                  ║"
echo "║   git init                                       ║"
echo "║   git add -A                                     ║"
echo "║   git commit -m 'Redesign: modern portfolio'     ║"
echo "║   git branch -M master                           ║"
echo "║   git remote add origin https://github.com/      ║"
echo "║     Sudu-09-Nep/sudu.github.io.git               ║"
echo "║   git push -u origin master --force              ║"
echo "║                                                  ║"
echo "║ Then wait 2 min and visit:                       ║"
echo "║ https://sudu-09-nep.github.io/sudu.github.io/   ║"
echo "╚══════════════════════════════════════════════════╝"
