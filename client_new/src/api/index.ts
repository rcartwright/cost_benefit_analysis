
import { Data } from "../types";

export async function fetchAnalyses() : Promise<Data> {
    const response = await fetch('/api/analyses')
    if (!response.ok) {
      throw new Error('Network response was not ok')
    } 
    return response.json()
  }
