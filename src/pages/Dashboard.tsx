import React, { useEffect, useState } from 'react';
import { supabase } from '../lib/supabase';

const Dashboard: React.FC = () => {
  const [data, setData] = useState<any[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      const { data: rows } = await supabase.from('example').select('*');
      setData(rows || []);
    };
    fetchData();
  }, []);

  return (
    <div>
      <h2 className="text-2xl font-semibold">Dashboard</h2>
      <ul className="mt-4 space-y-2">
        {data.map((item) => (
          <li key={item.id}>{JSON.stringify(item)}</li>
        ))}
      </ul>
    </div>
  );
};

export default Dashboard;
