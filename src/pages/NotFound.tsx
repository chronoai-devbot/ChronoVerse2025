import React from 'react';
import { Link } from 'react-router-dom';

const NotFound: React.FC = () => (
  <div className="text-center">
    <h2 className="text-3xl font-bold">404 - Page Not Found</h2>
    <p className="mt-2">The page you’re looking for doesn’t exist.</p>
    <Link to="/" className="mt-4 inline-block p-2 bg-blue-600 text-white rounded">
      Go Home
    </Link>
  </div>
);

export default NotFound;
