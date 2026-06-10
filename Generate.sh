python3 << 'PYEOF'
with open('/mnt/user-data/outputs/bigboyz.html', 'r') as f:
    html = f.read()

# Replace bad sidenav CSS with fixed version
old_css = '''.sidenav {
    position: fixed;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    z-index: 200;
    display: flex;
    flex-direction: column;
    gap: 0;
  }
  .sidenav-item {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    cursor: pointer;
    text-decoration: none;
    overflow: hidden;
    height: 48px;
    position: relative;
  }
  .sidenav-label {
    background: var(--red);
    color: var(--white);
    font-family: 'Oswald', sans-serif;
    font-size: 0.72rem;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 0 12px;
    height: 100%;
    display: flex;
    align-items: center;
    white-space: nowrap;
    max-width: 0;
    overflow: hidden;
    transition: max-width 0.3s ease, padding 0.3s ease;
    padding: 0;
  }
  .sidenav-item:hover .sidenav-label,
  .sidenav-item:focus .sidenav-label {
    max-width: 160px;
    padding: 0 12px;
  }
  .sidenav-icon {
    width: 44px;
    height: 48px;
    background: var(--card);
    border: 1px solid var(--border);
    border-right: none;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.1rem;
    transition: background 0.2s, border-color 0.2s;
    flex-shrink: 0;
  }
  .sidenav-item:hover .sidenav-icon,
  .sidenav-item:focus .sidenav-icon {
    background: var(--red);
    border-color: var(--red);
  }
  /* Top arrow — separate style */
  .sidenav-top .sidenav-icon {
    background: var(--red);
    border-color: var(--red);
    border-bottom: 1px solid rgba(255,255,255,0.15);
  }
  .sidenav-top:hover .sidenav-icon { background: var(--red-dark); }
  @media (max-width: 480px) {
    .sidenav-label { display: none; }
    .sidenav-icon { width: 40px; height: 44px; font-size: 1rem; }
  }'''

new_css = '''.sidenav {
    position: fixed;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    z-index: 200;
    display: flex;
    flex-direction: column;
    gap: 0;
  }
  .sidenav-item {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    cursor: pointer;
    text-decoration: none;
    overflow: hidden;
    height: 46px;
    position: relative;
  }
  .sidenav-label {
    background: var(--red);
    color: var(--white);
    font-family: 'Oswald', sans-serif;
    font-size: 0.72rem;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    height: 100%;
    display: flex;
    align-items: center;
    white-space: nowrap;
    max-width: 0;
    overflow: hidden;
    padding: 0;
    transition: max-width 0.3s ease, padding 0.3s ease;
  }
  .sidenav-item:hover .sidenav-label {
    max-width: 160px;
    padding: 0 14px;
  }
  .sidenav-icon {
    width: 42px;
    height: 46px;
    background: var(--card);
    border: 1px solid var(--border);
    border-right: none;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1rem;
    transition: background 0.2s, border-color 0.2s;
    flex-shrink: 0;
  }
  .sidenav-item:hover .sidenav-icon {
    background: var(--red);
    border-color: var(--red);
  }
  .sidenav-top .sidenav-icon {
    background: var(--red);
    border-color: var(--red-dark);
    color: var(--white);
    font-weight: bold;
  }
  .sidenav-top:hover .sidenav-icon { background: var(--red-dark); }
  @media (max-width: 768px) {
    .sidenav { top: auto; bottom: 100px; transform: none; }
    .sidenav-label { display: none; }
    .sidenav-icon { width: 38px; height: 42px; font-size: 0.95rem; }
  }'''

html = html.replace(old_css, new_css)

# Fix JS - wrap in DOMContentLoaded
old_js = '''// ── SIDEBAR BACK TO TOP ──
document.getElementById('backToTop').addEventListener('click', function(e) {
  e.preventDefault();
  window.scrollTo({ top: 0, behavior: 'smooth' });
});'''

new_js = '''// ── SIDEBAR BACK TO TOP ──
document.addEventListener('DOMContentLoaded', function() {
  var topBtn = document.getElementById('backToTop');
  if (topBtn) {
    topBtn.addEventListener('click', function(e) {
      e.preventDefault();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }
});'''

html = html.replace(old_js, new_js)

with open('/mnt/user-data/outputs/bigboyz.html', 'w') as f:
    f.write(html)

print("CSS fixed:", 'bottom: 100px' in html)
print("JS fixed:", 'DOMContentLoaded' in html)
print("HTML count:", html.count('<html'))
PYEOF
