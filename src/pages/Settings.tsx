import React from 'react';
import { useTheme } from '../hooks/useTheme';
import { themeTron, themeQuantum } from '../themes/themeTron';

const Settings: React.FC = () => {
  const { theme, setThemeKey } = useTheme();
  return (
    <div>
      <h2 className="text-2xl font-semibold">Settings</h2>
      <p>Select your preferred theme:</p>
      <select
        value={theme === themeTron ? 'tron' : 'quantum'}
        onChange={(e) => setThemeKey(e.target.value)}
        className="p-2 mt-2"
      >
        <option value="tron">Tron</option>
        <option value="quantum">Quantum</option>
      </select>
    </div>
  );
};

export default Settings;
