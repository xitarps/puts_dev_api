import React, {useState, useEffect} from 'react';
import axios from 'axios';
import './App.css';

const App = () => {
  const backend_url = 'http://127.0.0.1:8000/api/v1/articles.json'

  useEffect(() => {
    axios.get(backend_url)
        .then(res => setItems(res.data['data']))
        .catch(error => console.log(error))
  }, []);
  
  const [items, setItems] = useState([]);

  return (
    <div className="App">
      <h2>Items:</h2>      <div>
        {
          items.map((item,_) => {
            return (
                <div key={item.id}>
                  {item.id}. {item.title} - {item.content}
                </div>
            )
          })
        }
      </div>    </div>
  );
}

export default App;