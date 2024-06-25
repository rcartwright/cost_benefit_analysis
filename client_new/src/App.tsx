import { useState } from 'react'
import { ColumnBox } from './components/ColumnBox'
import './App.css'

function App() {
  const data = useState([])


  const costData = [
      {
          details: "away from family",
          weight: 90
      },
      {
          details: "no thunderstorms or tornadoes",
          weight: 20
      },
      {
          details: "no green grass",
          weight: 80
      },
      {
          details: "no trees",
          weight: 60
      },
      {
          details: "no humidity - yes, I like humidity",
          weight: 30
      }
  ];

  const benefitData = [
      {
          details: "around pretty mountains",
          weight: 30
      },
      {
          details: "will have a band",
          weight: 20
      },
      {
          details: "a new place",
          weight: 80
      },
      {
          details: "no winter",
          weight: 60
      }
  ];
  return (
      <main className="flex min-h-screen flex-col items-center justify-between p-24">
          <div className="flex flex-col items-center w-full">
              <div className="p-4 w-full flex flex-col items-center justify-center  text-slate-800">
                  <h1 className="text-4xl">Cost Benefit Analysis</h1>
                  
              </div>
              <div className="p-4 w-full flex flex-col items-center justify-center bg-slate-400 text-slate-800">
                  <div className="text-2xl">Move to Las Vegas</div>
              </div>
              <div className="flex w-full">
                  <ColumnBox 
                      title="Costs" 
                      items={costData} 
                      classes="bg-danger-light text-danger-dark" 
                  />
                  <ColumnBox 
                      title="Benefits" 
                      items={benefitData} 
                      classes="bg-success-light text-success-dark" 
                  />
              </div>
          </div>
      </main>
  );
}

export default App
