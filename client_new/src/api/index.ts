
import { Data } from "../types";

export async function fetchAnalyses() : Promise<Data> {
  const response = await fetch('/api/analyses')
  if (!response.ok) {
    throw new Error('Network response was not ok')
  } 
  const data = await response.json()

  if (!response.ok) {
    // todo log error
    throw new Error('Network response was not ok')
  } 

  return data
}

export async function createBenefit(body: any) : Promise<any> {
  const response = await fetch('/api/benefits', {
    body: JSON.stringify({benefit: body}), 
    method: 'POST',
    headers: {
      "Content-Type": "application/json",
    },
  })
  
  const data = await response.json()

  if (!response.ok) {
    // todo log error
    throw new Error('Network response was not ok')
  } 

  return data
}
