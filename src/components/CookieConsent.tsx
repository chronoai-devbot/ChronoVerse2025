import React, { useState, useEffect } from 'react';

const COOKIE_NAME = 'chrono_cookie_consent';

const CookieConsent: React.FC = () => {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const consent = localStorage.getItem(COOKIE_NAME);
    if (!consent) setVisible(true);
  }, []);

  const accept = () => {
    localStorage.setItem(COOKIE_NAME, 'accepted');
    setVisible(false);
  };

  if (!visible) return null;
  return (
    <div className="fixed bottom-0 w-full bg-gray-900 text-white p-4 flex justify-between items-center">
      <span>
        This site uses cookies for a better experience. By continuing, you agree to our{' '}
        <a href="/privacy" className="underline">
          Privacy Policy
        </a>
        .
      </span>
      <button onClick={accept} className="bg-blue-600 px-4 py-2 rounded">
        Accept
      </button>
    </div>
  );
};

export default CookieConsent;
