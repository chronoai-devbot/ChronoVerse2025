#!/usr/bin/env bash
set -e

# 1) Create directories
mkdir -p public/assets
mkdir -p src/{components,contexts,hooks,layouts,lib,mock,modules/exampleModule,pages,themes,locales,styles,types,utils}
mkdir -p scripts .github/workflows

# 2) public files
cat > public/robots.txt << 'E2'
User-agent: *
Allow: /
E2

cat > public/assets/logo.svg << 'E2'
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">
  <text x="0" y="50" fill="#0ff" font-family="Orbitron" font-size="24">ChronoVerse</text>
</svg>
E2

touch public/favicon.ico

# 3) .env example
cat > .env.example << 'E2'
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
E2

# 4) tsconfig & vite config
cat > tsconfig.json << 'E2'
{ "compilerOptions": { "target":"esnext", "useDefineForClassFields":true, "lib":["dom","esnext"], "skipLibCheck":true, "strict":true, "module":"esnext", "moduleResolution":"node", "resolveJsonModule":true, "isolatedModules":true, "jsx":"react-jsx" }, "include":["src"] }
E2

cat > vite.config.ts << 'E2'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
export default defineConfig({ plugins:[react()], server:{ open:true } });
E2

# 5) package.json
cat > package.json << 'E2'
{ "name":"chronoverse","version":"1.0.0","private":true,
  "scripts":{"dev":"vite","build":"vite build","preview":"vite preview"},
  "dependencies":{"react":"^18.0.0","react-dom":"^18.0.0","react-router-dom":"^6.0.0","@supabase/supabase-js":"^2.0.0","i18next":"^21.0.0","react-i18next":"^12.0.0"},
  "devDependencies":{"typescript":"^4.0.0","vite":"^4.0.0","@vitejs/plugin-react":"^3.0.0","@types/react":"^18.0.0","@types/react-dom":"^18.0.0"}
}
E2

# 6) build & zip scripts
cat > scripts/build-and-zip-root.sh << 'E2'
#!/usr/bin/env bash
set -e
npm run build
ZIP="chrono-verse-$(date +%Y%m%d%H%M%S).zip"
zip -r "$ZIP" dist public/favicon.ico public/robots.txt package.json tsconfig.json .env.example README.md -x "*node_modules*" "*scripts/*"
E2
chmod +x scripts/build-and-zip-root.sh

cat > scripts/build-and-zip-segments.sh << 'E2'
#!/usr/bin/env bash
set -e
for seg in src public; do
  npm run build
  ZIP="chrono-verse-\${seg}-$(date +%Y%m%d%H%M%S).zip"
  zip -r "\$ZIP" "\$seg" -x "*node_modules*"
done
E2
chmod +x scripts/build-and-zip-segments.sh

# 7) minimal scaffold of src/App.tsx (you’ll paste the rest manually next)
cat > src/App.tsx << 'E2'
import React from 'react';
import { Routes,Route } from 'react-router-dom';
import MainLayout from './layouts/MainLayout';
import HomePage from './pages/HomePage';
const App:React.FC=()=>(
  <MainLayout>
    <Routes><Route path="/" element={<HomePage/>}/></Routes>
  </MainLayout>
);
export default App;
E2

echo "✅ init script created."
