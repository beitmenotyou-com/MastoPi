# MastoPi Theming Guide

Personalize your MastoPi instance with custom colors, icons, and layouts! This guide will help you create a unique look and feel, whether you’re a designer or a beginner.

---

## Table of Contents
1. [How Theming Works](#how-theming-works)
2. [SCSS Overrides](#scss-overrides)
3. [Custom SVG Icons](#custom-svg-icons)
4. [Color Schemes & Dark Mode](#color-schemes--dark-mode)
5. [Accessibility Tips](#accessibility-tips)
6. [Troubleshooting](#troubleshooting)
7. [Best Practices](#best-practices)
8. [FAQ](#faq)

---

## How Theming Works
- MastoPi uses [SCSS](https://sass-lang.com/) for styles.
- All custom styles live in the `theme/` directory:
  - `_variables.scss` — color tokens
  - `_layout.scss` — layout and component overrides
  - `_icons.scss` — icon classes and masking
  - `mastopi.scss` — main entrypoint (imports all theme files)
  - `icons/` — your custom SVG icons

---

## SCSS Overrides

### 1. Edit Color Variables
Open `theme/_variables.scss` and change the color tokens:
```scss
:root {
  --brand-primary: #1d9bf0;
  --brand-accent:  #f91880;
  --bg-default:    #ffffff;
  --bg-alt:        #f7f9fa;
  --text-primary:  #0f1419;
  --text-muted:    #536471;
}
```

### 2. Customize Layout and Components
Edit `theme/_layout.scss` to override buttons, cards, forms, etc. Example:
```scss
.button {
  background: var(--brand-primary);
  color: var(--bg-default);
  border-radius: 999px;
  font-weight: bold;
}
```

### 3. Import Your Theme
Ensure `mastopi.scss` imports all your theme files:
```scss
@import 'variables';
@import 'layout';
@import 'icons';
```

---

## Custom SVG Icons

### 1. Add Icons
Place SVG files in `theme/icons/` (e.g., `home.svg`, `like.svg`).

### 2. Use in Rails Views
Use the provided helper:
```erb
<%= svg_icon("home", class: "icon icon-home", aria: "Home") %>
```

### 3. Style with SCSS
In `theme/_icons.scss`:
```scss
.icon-home {
  mask-image: url('./icons/home.svg');
  -webkit-mask-image: url('./icons/home.svg');
}
```

---

## Color Schemes & Dark Mode

- Define dark mode colors in `theme/_variables.scss`:
```scss
[data-theme="dark"] {
  --bg-default:   #000000;
  --bg-alt:       #16181c;
  --text-primary: #e7e9ea;
  --text-muted:   #71767b;
}
```
- Users can toggle dark mode in their settings.
- Admins can set a default theme for all users.

---

## Accessibility Tips
- Use high-contrast color pairs for text and backgrounds.
- Test with screen readers and keyboard navigation.
- Add `aria-label` to icons and important UI elements.
- Avoid using color alone to convey meaning.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Styles not updating | Clear browser cache and recompile assets |
| Icons not showing | Check SVG file paths and SCSS mask-image URLs |
| Dark mode not working | Ensure `[data-theme="dark"]` is set on `<body>` |
| Layout broken | Check for missing or extra braces in SCSS |

---

## Best Practices
- Keep your theme files organized and well-commented.
- Use CSS variables for easy color changes.
- Test your theme on desktop and mobile.
- Share your themes with the community!

---

## FAQ

**Q: Can I use a pre-made theme?**
A: Yes! Copy the theme files into your `theme/` directory and import them in `mastopi.scss`.

**Q: How do I reset to the default theme?**
A: Restore the original files from the repository or remove your custom overrides.

**Q: Where can I find more icons?**
A: Use open-source icon sets (e.g., [Feather](https://feathericons.com/), [Heroicons](https://heroicons.com/)), or design your own.

**Q: How do I contribute a theme?**
A: Fork the repo, add your theme to `theme/`, and submit a pull request!

---

## Screenshots & Diagrams

> **[Insert screenshots of custom themes, icon usage, and dark mode here]**

---

For more, see the [Install Guide](install.md), [Upgrade Guide](upgrade.md), and [Developer Guide](developing.md).
