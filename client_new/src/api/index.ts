
import { Data } from "../types";

export async function fetchAnalyses() : Promise<Data> {
  const response = await fetch('/api/analyses')
  if (!response.ok) {
    throw new Error('Network response was not ok')
  } 
  return response.json()
}

export async function createBenefit(body: any) : Promise<any> {
  console.log('the body', body)
  const response = await fetch('/api/benefits', {
    body: JSON.stringify({benefit: body}), 
    method: 'POST',
    headers: {
      "Content-Type": "application/json",
    },
  })

  if (!response.ok) {
    throw new Error('Network response was not ok')
  } 
  console.log('the respoonse', response.json())
  return response.json()
}
